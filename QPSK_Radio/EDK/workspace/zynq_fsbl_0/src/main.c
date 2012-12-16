/******************************************************************************
*
* (c) Copyright 2011 Xilinx, Inc. All rights reserved.
*
* This file contains confidential and proprietary information of Xilinx, Inc.
* and is protected under U.S. and international copyright and other
* intellectual property laws.
*
* DISCLAIMER
* This disclaimer is not a license and does not grant any rights to the
* materials distributed herewith. Except as otherwise provided in a valid
* license issued to you by Xilinx, and to the maximum extent permitted by
* applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
* FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
* IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
* MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
* and (2) Xilinx shall not be liable (whether in contract or tort, including
* negligence, or under any other theory of liability) for any loss or damage
* of any kind or nature related to, arising under or in connection with these
* materials, including for any direct, or any indirect, special, incidental,
* or consequential loss or damage (including loss of data, profits, goodwill,
* or any type of loss or damage suffered as a result of any action brought by
* a third party) even if such damage or loss was reasonably foreseeable or
* Xilinx had been advised of the possibility of the same.
*
* CRITICAL APPLICATIONS
* Xilinx products are not designed or intended to be fail-safe, or for use in
* any application requiring fail-safe performance, such as life-support or
* safety devices or systems, Class III medical devices, nuclear facilities,
* applications related to the deployment of airbags, or any other applications
* that could lead to death, personal injury, or severe property or
* environmental damage (individually and collectively, "Critical
* Applications"). Customer assumes the sole risk and liability of any use of
* Xilinx products in Critical Applications, subject only to applicable laws
* and regulations governing limitations on product liability.
*
* THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
* AT ALL TIMES.
*
*******************************************************************************/
/*****************************************************************************/
/**
*
* @file main.c
*
* Reference implementation for for the First Stage Boot Loader (FSBL).
*
* For complete description of FSBL, please refer to FSBL PDD document.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date        Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a jz  06/04/11   Initial release
* 2.00a mb  25/05/12   standalone based FSBL
* </pre>
*
* @note
*
******************************************************************************/

/***************************** Include Files *********************************/

#include "fsbl.h"
#include "qspi.h"
#include "nand.h"
#include "nor.h"
#include "sd.h"
#include "pcap.h"

#include "xstatus.h"
#include "image_mover.h"

#include "xil_printf.h"
#include "xparameters.h"

#ifndef PEEP_CODE
#include "ps7_init.h"
#endif
#include "xil_cache.h"
#include "xil_exception.h"

/************************** Constant Definitions *****************************/

/* Watchdog Timer defines */
#define WDT_ZERO_MODE_OFFSET       0x0
#define WDT_CTR_CNTRL_OFFSET       0x4
#define WDT_RESTART_OFFSET         0x8
#define WDT_STS_OFFSET             0xC

#define WDT_ENABLE                 0x1
#define WDT_RST_ENABLE             0x2
#define WDT_IRQ_ENABLE             0x4
#define WDT_ZERO_KEY               0x00ABC000
#define WDT_ZERO_ENABLE_VAL   (WDT_ENABLE | WDT_RST_ENABLE)
#define WDT_USER_SETTING_MASK      0xF

#define WDT_CTR_CNTRL_VAL          ((0x248 << 6) | 0xFFFF)
#define WDT_RESTART_VAL            0x00001999
#define WDT_RESET_VAL              0x1

/* Reboot status register defines:
 * 0xF0000000 for FSBL fallback mask to notify Boot Rom
 * 0x60000000 for FSBL to mark that FSBL has not handoff yet
 * 0x0F000000 for FSBL to record partition number to work on
 * 0x00FFFFFF for user application to use across soft reset
 */
#define FSBL_FAIL_MASK          0xF0000000
#define FSBL_IN_MASK            0x60000000
#define PARTITION_NUMBER_MASK   0x0F000000

#define PARTITION_NUMBER_SHIFT          24
#define MAX_PARTITION_NUMBER            0xE

/* The address that holds the base address for the image Boot ROM found */
#define BASEADDR_HOLDER              0xFFFFFFF8

/* DDR Operating mode register */
#define DDR_MODE_STS_REG (XPS_DDR_CTRL_BASEADDR + 0x54)
#define OPERATING_MODE_MASK 0x7
#define NORMAL_MODE 0x1
#define DDR_MEMORY_1 0x01000000
#define DDR_MEMORY_2 0x02000000
#define PATTERN 0xAA55AA55

/**************************** Type Definitions *******************************/
/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/
extern void FsblHandoffExit(u32 FsblStartAddr);
extern void FsblHandoffJtagExit(void);

static void FsblHandoff(u32 FsblStartAddr);

static void RestartWDT(void);
static void EnableWDT(void);
static void DisableWDT(void);
static int IsWDTReset(void);

static void MarkFSBLIn(void);
static void ClearFSBLIn(void);
static int Check_ddr_init(void);
extern void init_ddr(void);
static u32 Get_SiliconVersion(void);
/************************** Variable Definitions *****************************/
int SkipPartition;

/* Base Address for the Read Functionality for Image Processing */
u32 FlashReadBaseAddress = 0;
/* Silicon Version */
u32 Silicon_Version;
extern ImageMoverType MoveImage;
extern XDcfg *DcfgInstPtr;
/*****************************************************************************/
/**
*
* This is the main function for the FSBL ROM code.
*
* The functionality progresses as follows:
*
* @param    None.
*
* @return   XST_SUCCESS to indicate success, otherwise XST_FAILURE.
*
* @note     None.
*
****************************************************************************/

int main(void)
{
    u32 BootModeRegister = 0;
    u32 HandoffAddress;
    volatile u32 RebootStatusRegister = 0;
    u32 ImageStartAddress = 0;
    u32 MediaAddr;
    int PartitionNumber = 0;
    int Status = 0;
	volatile u32 MultiBootReg = 0;

    /* Read bootmode register */
    BootModeRegister = FsblIn32(BOOT_MODE_REG);

#ifdef PEEP_CODE
    /* initialize the DDR for application code */
    init_ddr();
#else
    /* PCW initialization for MIO,PLL,CLK and DDR */
    ps7_init();
#endif
    /* Flush the Caches */
    Xil_DCacheFlush();

    /* Disable Data Cache */
    Xil_DCacheDisable();

    /* Check the operating mode of the DDR controller */
    Status = Check_ddr_init();
    if (Status == XST_FAILURE) {
    	 debug_xil_printf("DDR initialisation failed \n");
    	 OutputStatus(DDR_INIT_FAIL);
    	 FsblFallback();
    }

    /* Unlock MIO for register access inside FSBL */
    SlcrUnlock();

    /* Register the Exception handlers */
    RegisterHandlers();

    /* Check WDT reset, if so, fallback */
    if (IsWDTReset()) {
        xil_printf("WDT reset happened, falling back...\n\r");
        OutputStatus(FSBL_HANGS);
        FsblFallback();
    } else {
        MarkFSBLIn();
    }

    RestartWDT();
    EnableWDT();
    PatWDT();

    /* This code need to be removed after proper time out value */
    DisableWDT();
    debug_xil_printf("WDT disabled \r\n");

    BootModeRegister &= BOOT_MODES_MASK;

    if (BootModeRegister == QSPI_MODE) {
    	debug_xil_printf("Boot mode is QSPI\n");
    	InitQspi();
        /* QSPI has been initializes stopd by Boot ROM at the highest speed
		 * We do not to do anything about it */
        MoveImage = QspiAccess;
        FlashReadBaseAddress = XPS_QSPI_LINEAR_BASEADDR;
        debug_xil_printf("FSBL QSPI %x\r\n", FlashReadBaseAddress);

    } else
#ifdef XPAR_PS7_NAND_0_BASEADDR
    if (BootModeRegister == NAND_FLASH_MODE) {
        /* Boot ROM always initialize the nand at lower speed
		 * This is the chance to put it to an optimum speed for your nand
		 * device
		 */
    	debug_xil_printf("Boot mode is NAND\n");
        Status = InitNand();
        if (Status == XST_FAILURE) {
        /* Error Handling here */
            debug_xil_printf("NAND initialization error\r\n");
            OutputStatus(PERIPHERAL_INIT_FAIL);
            FsblFallback();
        }
        MoveImage = NandAccess;
        debug_xil_printf("FSBL NAND\r\n");

    } else
#endif
    if (BootModeRegister == NOR_FLASH_MODE) {
    	debug_xil_printf("Boot mode is NOR\n");
        /* Boot ROM always initialize the nor at lower speed
		 * This is the chance to put it to an optimum speed for your nor
		 * device
		 */
        InitNor();
        debug_xil_printf("Finished init NOR %d\r\n", Status);
        MoveImage = NorAccess;

    } else
#ifdef XPAR_PS7_SD_0_S_AXI_BASEADDR
    if (BootModeRegister == SD_MODE) {
    	debug_xil_printf("Boot mode is SD\n");
        Status = InitSD("BOOT.BIN");
        /* returns file open error or success */
        if (Status != XST_SUCCESS){
            debug_xil_printf("InitSD failed\r\n");
            OutputStatus(PERIPHERAL_INIT_FAIL);
            FsblFallback();
        }
        MoveImage = SDAccess;

    } else
#endif
    if (BootModeRegister == JTAG_MODE) {
    	debug_xil_printf("Boot mode is JTAG\n");
        DisableWDT();
        /* Clear our mark in reboot status register */
        ClearFSBLIn();
        FsblHandoffJtagExit();
    } else {
        debug_xil_printf("Unknown Mode %d\r\n", BootModeRegister);
        OutputStatus(ILLEGAL_BOOT_MODE);
        /* fallback fsbl starts, no return */
        FsblFallback();
    }
    debug_xil_printf("read base %x\r\n", FlashReadBaseAddress);

    MediaAddr = FlashReadBaseAddress &  MEDIA_ADDRESS_MASK;
    /* Review : Check if all these are correct */
    if ((MediaAddr != XPS_QSPI_LINEAR_BASEADDR) &&
            (MediaAddr != XPS_NAND_BASEADDR) &&
            (MediaAddr != XPS_NOR_BASEADDR) &&
            (FlashReadBaseAddress != XPS_SDIO0_BASEADDR) &&
            (FlashReadBaseAddress != XPS_SDIO1_BASEADDR)) {

        debug_xil_printf("Invalid flash address %x\r\n", FlashReadBaseAddress);
        OutputStatus(INVALID_FLASH_ADDRESS);
        FsblFallback();
    }
    /* Pcap initialization here */
    Status = InitPcap();
    if (Status == XST_FAILURE) {
    /* Error Handling here */
        debug_xil_printf("PCAP initialization error\r\n");
        OutputStatus(PERIPHERAL_INIT_FAIL);
        /* Review : should be do a FsblFallback here if this happens*/
        FsblFallback();
    }
	
	/* Get the silicon version */	
    Silicon_Version = Get_SiliconVersion();
        /* Partition walk */
        /* If partition is bitstream, then no reset is necessary.
         * SkipPartition is to the next partition without soft reset
         */
    SkipPartition = 1;

    while (SkipPartition) {
        RebootStatusRegister = FsblIn32(REBOOT_STATUS_REG);
        /* Prevent WDT reset */
        PatWDT();
        /* Clear out fallback mask from previous run
                * We start from the first partition again */
        if ((RebootStatusRegister & FSBL_FAIL_MASK) ==
                FSBL_FAIL_MASK) {
            debug_xil_printf("Reboot status shows previous run falls back\r\n");
            RebootStatusRegister &= ~(FSBL_FAIL_MASK | PARTITION_NUMBER_MASK);
            FsblOut32(REBOOT_STATUS_REG,
                    RebootStatusRegister &
                   ~(FSBL_FAIL_MASK | PARTITION_NUMBER_MASK));
        }

        if (Silicon_Version == SILICON_VERSION_0) {
        	/* Read the image start address */
            ImageStartAddress = *(u32 *)BASEADDR_HOLDER;
        } else {
        	/* read the mulitboot register */
     		MultiBootReg =  XDcfg_ReadReg(DcfgInstPtr->Config.BaseAddr,
     				    XDCFG_MULTIBOOT_ADDR_OFFSET);
    		debug_xil_printf("Multiboot Register = %08x\r\n",MultiBootReg);
     		/* Compute the image start address */
     		ImageStartAddress = (MultiBootReg & PCAP_MBOOT_REG_REBOOT_OFFSET_MASK)
     							* GOLDEN_IMAGE_OFFSET;
        }

		PartitionNumber = (RebootStatusRegister & PARTITION_NUMBER_MASK)
		                    >> PARTITION_NUMBER_SHIFT;

		debug_xil_printf("ImageStartAddress = %08x\r\n",ImageStartAddress);
		debug_xil_printf("PartitionNumber = %08x\r\n",PartitionNumber);

		debug_xil_printf("flash read base addr %x, image base %x\r\n",
		    FlashReadBaseAddress, ImageStartAddress);

        SkipPartition = 0;
        HandoffAddress = PartitionMove(ImageStartAddress, PartitionNumber);
        debug_xil_printf("Hand off address %x\r\n", HandoffAddress);

        if (SkipPartition) {
            debug_xil_printf("FSBL main: Skip partition\r\n");
            continue;
        }
        /* Image move encounters errors, fallback
         * Error code has been printed in image mover */
        if (HandoffAddress == MOVE_IMAGE_FAIL) {
            debug_xil_printf("FSBL fall back\r\n");
            if (Silicon_Version != SILICON_VERSION_0) {
        	    /* Increment the offset address looking for the ID */
        	    ImageStartAddress += GOLDEN_IMAGE_OFFSET;
        	    MultiBootReg &= ~PCAP_MBOOT_REG_REBOOT_OFFSET_MASK;
        	    MultiBootReg |=  (ImageStartAddress/GOLDEN_IMAGE_OFFSET) & PCAP_MBOOT_REG_REBOOT_OFFSET_MASK;

        	    XDcfg_WriteReg(DcfgInstPtr->Config.BaseAddr, XDCFG_MULTIBOOT_ADDR_OFFSET,
        		    		MultiBootReg);
        	    debug_xil_printf("Fallback: MultiBootReg = 0x%08x\r\n",MultiBootReg);
            } /* end of Silicon_Version */

			/* fallback starts, no return */
			FsblFallback();	
		}
	}

    debug_xil_printf("To handoff, End of main\r\n");

    /* Disable WDT to prevent WDT reset in application.
     * User can remove this disable and use PatWDT() to keep WDT
     * active, so that application hanging can be detected */
    DisableWDT();
#ifdef XPAR_PS7_SD_0_S_AXI_BASEADDR
    /* If using SD, close the file */
    if (BootModeRegister == SD_MODE) {
        ReleaseSD();
    }
#endif
    /* Clear our mark in reboot status register */
    ClearFSBLIn();
    debug_xil_printf("Before handoff reboot status register %x\r\n",
            FsblIn32(REBOOT_STATUS_REG));

        /* Lock MIO so application cannot mess with control registers */
    SlcrLock();
    FsblHandoff(HandoffAddress);

    /* Should not return here, if it ever does, it is an error */
    if (Silicon_Version != SILICON_VERSION_0) {
	    /* Increment the offset address looking for the ID */
	    ImageStartAddress += GOLDEN_IMAGE_OFFSET;
	    MultiBootReg &= ~PCAP_MBOOT_REG_REBOOT_OFFSET_MASK;
	    MultiBootReg |=  (ImageStartAddress/GOLDEN_IMAGE_OFFSET) & PCAP_MBOOT_REG_REBOOT_OFFSET_MASK;

	    XDcfg_WriteReg(DcfgInstPtr->Config.BaseAddr, XDCFG_MULTIBOOT_ADDR_OFFSET,
		    		MultiBootReg);
	    debug_xil_printf("Fallback: MultiBootReg = 0x%08x\r\n",MultiBootReg);
    } /* End of Silicon_Version */

	OutputStatus(ILLEGAL_RETURN);
	FsblFallback();
	
	return 0;
}


/******************************************************************************/
/**
*
* This function reset the CPU and goes for Boot ROM fallback handling
*
* @param None
*
* @return
*   None
*
****************************************************************************/
void FsblFallback(void)
{
	u32 RebootStatusReg = FsblIn32(REBOOT_STATUS_REG);

	SlcrUnlock();

	/* Notify Boot ROM something is wrong */
	FsblOut32(REBOOT_STATUS_REG, RebootStatusReg | FSBL_FAIL_MASK);

	xil_printf("FSBL fallback %x\r\n", FsblIn32(REBOOT_STATUS_REG));
	xil_printf("FSBL fallback %x\r\n", FsblIn32(REBOOT_STATUS_REG));

	/* Barrier */
	asm(
		"dsb\n\t"
		"isb"
	);

	/* Hand off to Boot ROM */
	SlcrUnlock();

	/* Reset PSS, so Boot ROM will restart */
	FsblOut32(PSS_RST_CTRL_REG, PSS_RST_MASK);

	SlcrLock();
}


/******************************************************************************/
/**
* This function set the address for the next partition
*
* @param Num is the partition number for the next partition, it should be less
*        than 15
*
* @return
*   . XST_SUCCESS if everything works
*   . XST_INVALID_PARAM if partition number is more than 15
*
****************************************************************************/
int FsblSetNextPartition(int Num)
{
    u32 RebootStatusReg;
    u32 ResetReg;

    /* Address must be word-aligned */
    if (Num > MAX_PARTITION_NUMBER) {
        debug_xil_printf("Partition number %d too large, limit %d \n",
            Num, MAX_PARTITION_NUMBER);

        /* Let the caller decide what to do next
                * If they continue with its partition walk, the last partition
                * will be repeated */
        return XST_INVALID_PARAM;
    }

    RebootStatusReg = FsblIn32(REBOOT_STATUS_REG);
    ResetReg = RebootStatusReg & ~PARTITION_NUMBER_MASK;

    FsblOut32(REBOOT_STATUS_REG, ResetReg |
         (Num << PARTITION_NUMBER_SHIFT));

    return XST_SUCCESS;
} /* End of FsblSetNextPartition */

/******************************************************************************/
/**
*
* This function hands the A9/PSS off to the loaded user code.
*
* @param    none
*
* @return   none
*
* @note
*   This function does not return.
*
****************************************************************************/
static void FsblHandoff(u32 FsblStartAddr){

    OutputStatus(SUCCESSFUL_HANDOFF);

    FsblHandoffExit(FsblStartAddr);

    OutputStatus(ILLEGAL_RETURN);

    FsblFallback();
} /* End of FsblHandoff */

/******************************************************************************/
/**
*
* This function outputs the status for the provided State in the boot process.
*
* @param    State - where in the boot process the output is desired.
*
* @return   None.
*
* @note     None.
*
****************************************************************************/
void OutputStatus(u32 State){

    volatile u32 Status;

    debug_xil_printf("FSBLStatus = 0x%.4x\r\n", State);
#ifdef STDOUT_BASEADDRESS
    Status = FsblIn32(STDOUT_BASEADDRESS + XUARTPS_SR_OFFSET);

    while ((Status & XUARTPS_SR_TXEMPTY) != XUARTPS_SR_TXEMPTY){
        Status = FsblIn32(STDOUT_BASEADDRESS + XUARTPS_SR_OFFSET);
    }
#endif
} /* end of OutputStatus */

/******************************************************************************/
/**
*
* This function handles the error and lockdown processing and outputs the status
* for the provided State in the boot process.
*
* This function is called upon exceptions.
*
* @param    State - where in the boot process the error occured.
*
* @return   None.
*
* @note    This function does not return, the PSS block is reset
*
****************************************************************************/
void ErrorLockdown(u32 State){

    OutputStatus(State);

    FsblFallback();

} /* End of ErrorLockdown */
/******************************************************************************/
/**
*
* This function sets a memory region with a set value
*
* @param s is the starting address
* @param c is the value to set to
* @param n is the number of bytes to set the value
*
* @return
*   Starting address of memory region
*
****************************************************************************/
void *(memset_rom)(void *s, int c, u32 n)
{
	unsigned char *us = s;
	unsigned char uc = c;
	while (n-- != 0)
		*us++ = uc;
	return s;
}
/******************************************************************************/
/**
*
* This function copies a memory region to another memory region
*
* @param s1 is starting address for destination
* @param s2 is starting address for the source
* @param n is the number of bytes to copy
*
* @return
*   Starting address for destination
*
****************************************************************************/
void *(memcpy_rom)(void * s1, const void * s2, u32 n)
{
	char *dst = s1;
	const char *src = s2;

	/* Loop and copy.  */
	while (n-- != 0)
		*dst++ = *src++;
	return s1;
}
/******************************************************************************/
/**
*
* This function copies a string to another, the source string must be null-
* terminated.
*
* @param dest is starting address for the destination string
* @param src is starting address for the source string
*
* @return
*   Starting address for the destination string
*
****************************************************************************/
char *strcpy_rom(char *dest, const char *src)
{
	unsigned i;
	for (i=0; src[i] != '\0'; ++i)
		dest[i] = src[i];
	dest[i] = '\0';
	return dest;
}

/******************************************************************************/
/**
*
* This function reset the WDT's reset interval to avoid immediate reset
*
* @param    None.
*
* @return   None.
*
* @note     None.
*
****************************************************************************/
static void RestartWDT(void) {
	FsblOut32(XPS_WDT_BASEADDR + WDT_RESTART_OFFSET, WDT_RESTART_VAL);
}

/******************************************************************************/
/**
*
* This function enables the WDT to catch misbehaving FSBL
*
* @param    None.
*
* @return   None.
*
* @note     None.
*
****************************************************************************/
void EnableWDT(void){
	u32 WdtReg = FsblIn32(XPS_WDT_BASEADDR + WDT_ZERO_MODE_OFFSET);

	FsblOut32(XPS_WDT_BASEADDR + WDT_CTR_CNTRL_OFFSET,
	    WDT_CTR_CNTRL_VAL);

	WdtReg &= ~WDT_USER_SETTING_MASK;
	FsblOut32(XPS_WDT_BASEADDR + WDT_ZERO_MODE_OFFSET,
	    WdtReg | WDT_ZERO_ENABLE_VAL | WDT_ZERO_KEY);
}

/******************************************************************************/
/**
*
* This function disables the WDT to avoid WDT reset in application code
*
* @param    None.
*
* @return   None.
*
* @note     None.
*
****************************************************************************/

void DisableWDT(void){
	u32 WdtReg = FsblIn32(XPS_WDT_BASEADDR + WDT_ZERO_MODE_OFFSET);

	FsblOut32(XPS_WDT_BASEADDR + WDT_ZERO_MODE_OFFSET,
	    (WdtReg | WDT_ZERO_KEY) & ~WDT_ENABLE);

}

/******************************************************************************/
/**
*
* This function restarts the WDT to avoid WDT reset
*
* @param    None.
*
* @return   None.
*
* @note     None.
*
****************************************************************************/

void PatWDT(void){

	FsblOut32(XPS_WDT_BASEADDR + WDT_RESTART_OFFSET, WDT_RESTART_VAL);
}

/******************************************************************************/
/**
*
* This function checks whether WDT reset has happened during FSBL run
*
* If WDT reset happened during FSBL run, then need to fallback
*
* @param    None.
*
* @return
*    1 -- if WDT reset happens while FSBL is running
*    0 -- otherwise
*
* @note     None.
*
****************************************************************************/
int IsWDTReset(void){
    u32 RegValue;

    RegValue = FsblIn32(REBOOT_STATUS_REG);

    debug_xil_printf("Reboot status %x\n\r", RegValue);
    debug_xil_printf("WDT STS %x\n\r",
        FsblIn32(XPS_WDT_BASEADDR + WDT_STS_OFFSET));

    /* If the FSBL_IN_MASK Has not been cleared, WDT happened
	 * before FSBL exits */
    if ((RegValue & FSBL_FAIL_MASK) == FSBL_IN_MASK) {
        return XST_FAILURE;
    } else {
        return XST_SUCCESS;
    }
}

/******************************************************************************/
/**
*
* This function sets FSBL is running mask in reboot status register
*
* @param    None.
*
* @return   None.
*
* @note     None.
*
****************************************************************************/
void MarkFSBLIn(void) {

    FsblOut32(REBOOT_STATUS_REG,
        FsblIn32(REBOOT_STATUS_REG) | FSBL_IN_MASK);
}

/******************************************************************************/
/**
*
* This function clears FSBL is running mask in reboot status register
*
* @param    None.
*
* @return   None.
*
* @note     None.
*
****************************************************************************/
void ClearFSBLIn(void) {

    FsblOut32(REBOOT_STATUS_REG,
        FsblIn32(REBOOT_STATUS_REG) & ~FSBL_IN_MASK);
}

/******************************************************************************/
/**
*
* This function Registers the Exception Handlers
*
* @param    None.
*
* @return   None.
*
* @note     None.
*
****************************************************************************/
void RegisterHandlers(void) {

    Xil_ExceptionInit();

     /*
     * Initialize the vector table. Register the stub Handler for each
     * exception.
     */

    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_UNDEFINED_INT,(Xil_ExceptionHandler)Undef_Handler,(void *) 0);
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_SWI_INT,(Xil_ExceptionHandler)SVC_Handler,(void *) 0);
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_PREFETCH_ABORT_INT,(Xil_ExceptionHandler)PreFetch_Abort_Handler,(void *) 0);
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_DATA_ABORT_INT,(Xil_ExceptionHandler)Data_Abort_Handler,(void *) 0);
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,(Xil_ExceptionHandler)IRQ_Handler,(void *) 0);
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_FIQ_INT,(Xil_ExceptionHandler)FIQ_Handler,(void *) 0);

    Xil_ExceptionEnable();

}/* end of Register Handlers*/

void Undef_Handler (void) {
    ErrorLockdown (EXCEPTION_ID_UNDEFINED_INT);
}

void SVC_Handler (void) {
    ErrorLockdown (EXCEPTION_ID_SWI_INT);
}

void PreFetch_Abort_Handler (void) {
    ErrorLockdown (EXCEPTION_ID_PREFETCH_ABORT_INT);
}

void Data_Abort_Handler (void) {
    ErrorLockdown (EXCEPTION_ID_DATA_ABORT_INT);
}

void IRQ_Handler (void) {
    ErrorLockdown (EXCEPTION_ID_IRQ_INT);
}

void FIQ_Handler (void) {
    ErrorLockdown (EXCEPTION_ID_FIQ_INT);
}
/******************************************************************************/
/**
*
* This function Checks for the ddr initialisation completion
*
* @param    None.
*
* @return   Status.
*
* @note     None.
*
****************************************************************************/
static int Check_ddr_init(void) {

	unsigned int reg;

	/* Read the operating mode of the DDR controller to verify if
	 * DDR is in normal mode of operation */

	while((Xil_In32(DDR_MODE_STS_REG) & OPERATING_MODE_MASK)!=NORMAL_MODE);

	/* Write and Read from the DDR location for sanity checks */
	Xil_Out32(DDR_MEMORY_1, PATTERN);
	reg = Xil_In32(DDR_MEMORY_1);
	if (reg != PATTERN)
		return XST_FAILURE;

	/* Write and Read from the DDR location for sanity checks */
	Xil_Out32(DDR_MEMORY_2, PATTERN);
	reg = Xil_In32(DDR_MEMORY_2);
	if (reg != PATTERN)
		return XST_FAILURE;

	return XST_SUCCESS;
}

/******************************************************************************/
/**
*
* This function Reads the Silicon Version
*
* @param None
*
* @return
* return  Silicon version number
*
****************************************************************************/
static u32 Get_SiliconVersion(void)
{
	u32 Regval;
	/* Read the Silicon Version */
	Regval =  XDcfg_ReadReg(DcfgInstPtr->Config.BaseAddr,
			XDCFG_MCTRL_OFFSET);
	/* PS Version number */
	Regval &= XDCFG_MCTRL_PCAP_PS_VER_MASK;

	Regval >>= XDCFG_MCTRL_PCAP_PS_VER_SHIFT;

	/* Gets the silicon version number */
	if (Regval == SILICON_VERSION_0) {
		debug_xil_printf("1.0 Silicon \n");
	} else if(Regval == SILICON_VERSION_1) {
		debug_xil_printf("2.0 Silicon \n");
	} else {
		debug_xil_printf("Silicon Version > 2.0 \n");
	}
	/* Return Silicon Version number */
	return Regval;
}
