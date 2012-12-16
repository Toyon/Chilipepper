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
* @file pcap.c
*
* Contains code for enabling and accessing the PCAP
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date        Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a ecm  02/10/10 Initial release
* 2.00a jz   05/28/11 Add SD support
* 3.00 mb    25/05/12 using the EDK provided devcfg driver
* 3.00a mb   06/06/12 Nand/SD encryption and review comments
* </pre>
*
* @note
*
******************************************************************************/

/***************************** Include Files *********************************/

#include "pcap.h"
#include "nand.h"          /* For NAND geometry information */
#include "fsbl.h"
#include "image_mover.h"   /* For MoveImage */
#include "xparameters.h"
#include "xil_exception.h"
#include "xdevcfg.h"

/************************** Constant Definitions *****************************/
/* DEBUG, remove the following defines to remove dump of registers */
#define DUMP_PCAP_REGS

#define MAX_COUNT 1000000
#define WORD_SHIFT 0x2
#define PCAP_LAST_TRANSFER 0x1
#define MAX_BUF_WORD_SIZE       0x1000

/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

/************************** Variable Definitions *****************************/

extern u32 FlashReadBaseAddress;
extern ImageMoverType MoveImage;

void pcap_register_dump(void);
void WritePcapISR(u32 Data);
u32 ClearPcap_Status(void);
/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are only defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define DCFG_DEVICE_ID		XPAR_XDCFG_0_DEVICE_ID
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID
#define DCFG_INTR_ID		XPAR_XDCFG_0_INTR

/* Devcfg driver instance */
static XDcfg DcfgInstance;
XDcfg *DcfgInstPtr;
/*
 * SLCR registers
 */
#define SLCR_LOCK	0xF8000004 /**< SLCR Write Protection Lock */
#define SLCR_UNLOCK	0xF8000008 /**< SLCR Write Protection Unlock */
#define FPGA_RST_CTRL	0xF8000240 /**< FPGA software reset control */

#define SLCR_LOCK_VAL	0x767B
#define SLCR_UNLOCK_VAL	0xDF0D

/* DDR location where the encrypted image will be copied to in case of
 * Nand and SD bootmodes
 */
#define DDR_1MB 0x00100000

/******************************************************************************/
/**
*
* This function does DMA transfer
*
* @param SourceData is a pointer to where the data is read from
* @param DestinationData is a pointer to where the data is written to
* @param SourceLength is the length of the data to be moved in words
* @param DestinationLength is the length of the data to be moved in words
* @param Flags indicated the encryption key location, 0 for non-encrypted
*
* @return   XST_SUCCESS if the PCAP transfer is successful
*           XST_FAILURE if the PCAP transfer fails
*           XST_DEVICE_BUSY if the DMA queue is full.
*
* @note         none
*
****************************************************************************/

u32 WritePcapXferData(u32 *SourceData, u32 *DestinationData, u32 SourceLength,
         u32 DestinationLength, u32 Flags)
{
    u32 Status = XST_SUCCESS;         /* Status value                      */
    int IsBitstream = 0;              /* Flag to check for bitstream       */
    int NonSecure = 0;                /* Flag to check for non secure mode */
    volatile u32 IntrStsReg = 0;
    int Count;                        /* Count for polling                 */

    /* Check if it is a bistream */
    if ((u32)DestinationData == XDCFG_DMA_INVALID_ADDRESS) {
        IsBitstream = 1;
    }
    /* check if its non secure mode */
    if (Flags == XDCFG_NON_SECURE_PCAP_WRITE) {
         NonSecure = 1;
         if(IsBitstream == 0) {
        	 debug_xil_printf("Set the loopback bit \n");
            /* Set the loopback bit for non secure */
            XDcfg_SetMiscControlRegister(DcfgInstPtr, XDCFG_MCTRL_PCAP_LPBK_MASK);
         }
		 
    }
   /* Clear the pcap status registers */
   Status = ClearPcap_Status();
    if (Status != XST_SUCCESS) {
    	debug_xil_printf("Clearing pcap status failed \n");
    	return XST_FAILURE;
    }

#ifndef PEEP_CODE
    if(IsBitstream)
            /* New bitstream download sequence */
            PcapProg_BitSequence();
#endif
    /* NAND/SD  */
    if (((FlashReadBaseAddress & 0xFF000000) == XPS_NAND_BASEADDR) ||
        (FlashReadBaseAddress == XPS_SD_BASEADDR)) {
        u32 *DDR_buffer = (u32*)DDR_1MB;

        /* Copy the data to DDR buffer */
        Status = MoveImage((u32)SourceData,
                 (u32)DDR_buffer,
                 (SourceLength << WORD_LENGTH_SHIFT));
        /* set up the transfer */
        DDR_buffer = (u32*)((u32)DDR_buffer | PCAP_LAST_TRANSFER);
        DestinationData = (u32*)((u32)DestinationData | PCAP_LAST_TRANSFER);
        Status = XDcfg_Transfer(DcfgInstPtr, (u8 *)DDR_buffer,
                                SourceLength,
                                (u8 *)DestinationData,
                                DestinationLength, Flags);
        /* Check the status of the transfer */
        if (Status != XST_SUCCESS) {
                 debug_xil_printf("Status of Transfer = %d \n",Status);
            return (XST_FAILURE);
        }

    } else { /* Not NAND/SD */
        /* set up the transfer */

        SourceData = (u32*)((u32)SourceData | PCAP_LAST_TRANSFER);
        DestinationData = (u32*)((u32)DestinationData | PCAP_LAST_TRANSFER);
        /* Start the transfer */
        Status = XDcfg_Transfer(DcfgInstPtr, (u8 *)SourceData,
                                SourceLength,
                                (u8 *)DestinationData,
                                DestinationLength, Flags);
        /* Check the status of the transfer */
        if (Status != XST_SUCCESS) {
        	xil_printf("Transfer failed \n");
            return (XST_FAILURE);
        }
    } /* End of else */
    /* Dump the pcap registers */
    pcap_register_dump();
    /* poll for the DMA done */
	Count = MAX_COUNT;
    while ((IntrStsReg & XDCFG_IXR_DMA_DONE_MASK) !=
               XDCFG_IXR_DMA_DONE_MASK) {
        IntrStsReg = XDcfg_IntrGetStatus(DcfgInstPtr);
		Count -=1;
		if(!Count) {
		    debug_xil_printf("PCAP transfer timed out \n");
			return XST_FAILURE;
		}
		if (Count > (MAX_COUNT - 100)) {
		    debug_xil_printf("Count for pcap download %d \n",Count);
		}
    } /* end of while */
    debug_xil_printf("STATUS for XDCFG_IXR_DMA_DONE_MASK \n");

    WritePcapISR(IntrStsReg & XDCFG_IXR_DMA_DONE_MASK);
    /* Poll for FPGA Done */
    if (IsBitstream) {
        Count = MAX_COUNT;
        while ((IntrStsReg & XDCFG_IXR_PCFG_DONE_MASK) !=
               XDCFG_IXR_PCFG_DONE_MASK) {
           IntrStsReg = XDcfg_IntrGetStatus(DcfgInstPtr);
           Count -=1;
		   if (!Count) {
               debug_xil_printf("FPGA config timed out \n");
			   return XST_FAILURE;
            }

         } /* end of while */
    debug_xil_printf("STATUS for XDCFG_IXR_PCFG_DONE_MASK \n");
    WritePcapISR(IntrStsReg & XDCFG_IXR_PCFG_DONE_MASK);
    } /* End of IsBitstream*/

#ifndef PEEP_CODE
    if(IsBitstream)
        SetLevel_Shifter();
#endif

    /* If non-secure mode, recover MCTRL register to not loopback */
    if ((NonSecure) && (!IsBitstream)) {
        XDcfg_SetMiscControlRegister(DcfgInstPtr, ~XDCFG_MCTRL_PCAP_LPBK_MASK);
    }
    return XST_SUCCESS;
} /* End of WritePcapXferData*/

/******************************************************************************/
/**
*
* This function prints PCAP register status.
*
* @param    none
*
* @return   none
*
* @note     none
*
****************************************************************************/

void pcap_register_dump (void) {

    debug_xil_printf("PCAP register dump:\r\n");

    debug_xil_printf("PCAP CTRL %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_CTRL_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_CTRL_OFFSET));
    debug_xil_printf("PCAP LOCK %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_LOCK_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_LOCK_OFFSET));
    debug_xil_printf("PCAP CONFIG %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_CFG_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_CFG_OFFSET));
    debug_xil_printf("PCAP ISR %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_INT_STS_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_INT_STS_OFFSET));
    debug_xil_printf("PCAP IMR %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_INT_MASK_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_INT_MASK_OFFSET));
    debug_xil_printf("PCAP STATUS %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_STATUS_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_STATUS_OFFSET));
    debug_xil_printf("PCAP DMA SRC ADDR %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_DMA_SRC_ADDR_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_DMA_SRC_ADDR_OFFSET));
    debug_xil_printf("PCAP DMA DEST ADDR %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_DMA_DEST_ADDR_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_DMA_DEST_ADDR_OFFSET));
    debug_xil_printf("PCAP DMA SRC LEN %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_DMA_SRC_LEN_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_DMA_SRC_LEN_OFFSET));
    debug_xil_printf("PCAP DMA DEST LEN %x: %08x\r\n",
            XPS_DEV_CFG_APB_BASEADDR + XDCFG_DMA_DEST_LEN_OFFSET,
            FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_DMA_DEST_LEN_OFFSET));

    debug_xil_printf("PCAP ROM SHADOW CTRL %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_ROM_SHADOW_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_ROM_SHADOW_OFFSET));
    debug_xil_printf("PCAP MBOOT %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_MULTIBOOT_ADDR_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_MULTIBOOT_ADDR_OFFSET));
    debug_xil_printf("PCAP SW ID %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_SW_ID_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_SW_ID_OFFSET));
    debug_xil_printf("PCAP UNLOCK %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_UNLOCK_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_UNLOCK_OFFSET));
    debug_xil_printf("PCAP MCTRL %x: %08x\r\n",
        XPS_DEV_CFG_APB_BASEADDR + XDCFG_MCTRL_OFFSET,
        FsblIn32(XPS_DEV_CFG_APB_BASEADDR + XDCFG_MCTRL_OFFSET));
} /* End of pcap dump register function */
 
/******************************************************************************/
/**
*
* This function Initialises the PCAP driver.
*
* @param    none
*
* @return   none
*
* @note     none
*
****************************************************************************/

int InitPcap(void)
{
	XDcfg_Config *ConfigPtr;
	u16 DeviceId;
	u16 DcfgIntrId;
	int Status = XST_SUCCESS;

	DeviceId = DCFG_DEVICE_ID;
	DcfgIntrId = DCFG_INTR_ID;
	DcfgInstPtr = &DcfgInstance;
	/*
	 * Initialize the Device Configuration Interface driver.
	 */
	ConfigPtr = XDcfg_LookupConfig(DeviceId);
	/*
	 * This is where the virtual address would be used, this example
	 * uses physical address.
	 */
	Status = XDcfg_CfgInitialize(DcfgInstPtr, ConfigPtr,
					ConfigPtr->BaseAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Disable AXI Interface
	 */
	Xil_Out32(SLCR_UNLOCK, SLCR_UNLOCK_VAL);
	Xil_Out32(FPGA_RST_CTRL, 0xFFFFFFFF);
	Xil_Out32(SLCR_LOCK, SLCR_LOCK_VAL);
	return Status;
} /* end of InitPcap */
/******************************************************************************/
/**
*
* This function programs the bit stream sequences.
*
* @param    None
*
* @return   None
*
* @note         none
*
****************************************************************************/

void PcapProg_BitSequence(void)
{
	u32 PcapReg;
	/*slcr unlock*/
	SlcrUnlock();

	/* Disable AXI interface */
	FsblOut32(FPGA_RESET_REG, 0xFFFFFFFF);

	/* Set Level Shifters DT618760*/
	PcapReg = FsblIn32(XPS_SYS_CTRL_BASEADDR + 0x900);
	PcapReg |= 0x0000000A;
	FsblOut32(XPS_SYS_CTRL_BASEADDR + 0x900,PcapReg);

	PcapReg = XDcfg_ReadReg(DcfgInstPtr->Config.BaseAddr,
					XDCFG_CTRL_OFFSET);
	/* Setting PCFG_PROG_B signal to high */
	XDcfg_WriteReg(DcfgInstPtr->Config.BaseAddr, XDCFG_CTRL_OFFSET,
			(PcapReg | XDCFG_CTRL_PCFG_PROG_B_MASK));

	/* Setting PCFG_PROG_B signal to low */
	XDcfg_WriteReg(DcfgInstPtr->Config.BaseAddr, XDCFG_CTRL_OFFSET,
			(PcapReg & ~XDCFG_CTRL_PCFG_PROG_B_MASK));

	/* Polling the PCAP_INIT status for Reset */
	while(XDcfg_GetStatusRegister(DcfgInstPtr) & XDCFG_STATUS_PCFG_INIT_MASK);

	/* Setting PCFG_PROG_B signal to low */
	XDcfg_WriteReg(DcfgInstPtr->Config.BaseAddr, XDCFG_CTRL_OFFSET,
			(PcapReg | XDCFG_CTRL_PCFG_PROG_B_MASK));

	/* Polling the PCAP_INIT status for Set */
	while(!(XDcfg_GetStatusRegister(DcfgInstPtr) & XDCFG_STATUS_PCFG_INIT_MASK));

	/*slcr lock*/
	SlcrLock();

} /* End of PcapProg_BitSequence */
/******************************************************************************/
/**
*
* This function programs sets the level shifter.
*
* @param    None
*
* @return   None
*
* @note         none
*
****************************************************************************/

void SetLevel_Shifter(void) {
	u32 PcapReg;
	/*slcr unlock*/
	SlcrUnlock();

	/* Set Level Shifters DT618760*/
	PcapReg = FsblIn32(XPS_SYS_CTRL_BASEADDR + 0x900);
	PcapReg |= 0x0000000F;
	FsblOut32(XPS_SYS_CTRL_BASEADDR + 0x900,PcapReg);

	/* Enable AXI interface */
	FsblOut32(FPGA_RESET_REG, 0);

	/*slcr lock*/
	SlcrLock();
} /* End of SetLevel_Shifters */
/******************************************************************************/
/**
*
* This function programs Clears the pcap status registers.
*
* @param    None
*
* @return   Success/failure
*
* @note         none
*
****************************************************************************/

u32 ClearPcap_Status(void) {

	volatile u32 StatusReg;
	u32 IntStatusReg;

	IntStatusReg = XDcfg_IntrGetStatus(DcfgInstPtr);

	/* Clear it all, so if Boot ROM comes back, it can proceed */
	XDcfg_WriteReg(DcfgInstPtr->Config.BaseAddr, XDCFG_INT_STS_OFFSET,
			0xFFFFFFFF);

	if (IntStatusReg & XDCFG_IXR_ERROR_FLAGS_MASK) {
		debug_xil_printf("FATAL errors in PCAP %x\r\n", IntStatusReg);

		/* If RX FIFO overflow, need to flush RX FIFO first */
		if (IntStatusReg & XDCFG_IXR_RX_FIFO_OV_MASK) {

		    XDcfg_SetMiscControlRegister(DcfgInstPtr, XDCFG_MCTRL_RFIFO_FLUSH_MASK);

			XDcfg_WriteReg(DcfgInstPtr->Config.BaseAddr, XDCFG_INT_STS_OFFSET,
					0xFFFFFFFF);
		}

		return XST_FAILURE;
	}

	/* Read the PCAP status register for DMA status */
	StatusReg = XDcfg_GetStatusRegister(DcfgInstPtr);

	debug_xil_printf("PCAP:StatusReg = 0x%.8x\r\n", StatusReg);

	/* if the queue is full, return w/ XST_DEVICE_BUSY */
	if ((StatusReg & XDCFG_STATUS_DMA_CMD_Q_F_MASK) ==
			XDCFG_STATUS_DMA_CMD_Q_F_MASK) {

		debug_xil_printf("PCAP:device busy\r\n");
		return XST_DEVICE_BUSY;
	}

	debug_xil_printf("PCAP:device ready\r\n");

	/* There are unacknowledged DMA commands outstanding */
	if ((StatusReg & XDCFG_STATUS_DMA_CMD_Q_E_MASK) !=
			XDCFG_STATUS_DMA_CMD_Q_E_MASK) {

		IntStatusReg = XDcfg_IntrGetStatus(DcfgInstPtr);

		if ((IntStatusReg & XDCFG_IXR_DMA_DONE_MASK) !=
				XDCFG_IXR_DMA_DONE_MASK){

			/* error state, transfer cannot occur */
			debug_xil_printf("PCAP:IntStatus indicates error\r\n");
			return XST_FAILURE;
		}
		else {
			/* clear out the status */
			WritePcapISR(XDCFG_IXR_DMA_DONE_MASK);
		}
	}

	if ((StatusReg & XDCFG_STATUS_DMA_DONE_CNT_MASK) != 0) {
		XDcfg_WriteReg(DcfgInstPtr->Config.BaseAddr, XDCFG_INT_STS_OFFSET,
				StatusReg & XDCFG_STATUS_DMA_DONE_CNT_MASK);

	}
	debug_xil_printf("PCAP:Clear done\r\n");
	return XST_SUCCESS;
} /* End of clear function */

/******************************************************************************/
/**
*
* This function writes the PCAP ISR.
*
* @param    data to be written to PCAP Interrupt Status Register
*
* @return   None
*
* @note         none
*
****************************************************************************/
void WritePcapISR(u32 Data){

	XDcfg_WriteReg(DcfgInstPtr->Config.BaseAddr, XDCFG_INT_STS_OFFSET,
			Data);
	return;

}

