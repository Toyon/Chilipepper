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
* @file nor.c
*
* Contains code for the NOR FLASH functionality.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date        Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a ecm  01/10/10 Initial release
* 2.00a mb   25/05/12
*
* </pre>
*
* @note
*
******************************************************************************/

/***************************** Include Files *********************************/
#include "fsbl.h"
#include "nor.h"
#include "xstatus.h"

/************************** Constant Definitions *****************************/

/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

u8 ReadNor8(u32 Address);
void ResetNorFlash(void);
u32 PollDataStatusNorFlash(u32 Address, u8 Data);

/************************** Variable Definitions *****************************/

extern u32 FlashReadBaseAddress;

/******************************************************************************/
/******************************************************************************/
/**
*
* This function initializes the controller for the NOR FLASH interface.
*
* @param    none
*
* @return   XST_SUCCESS if the controller initializes correctly
*           XST_FAILURE if the controller fails to initializes correctly
*
* @note    none.
*
****************************************************************************/
void InitNor(void) {

    /* set up base address for access */
    FlashReadBaseAddress = XPS_NOR_BASEADDR;
}

/******************************************************************************/
/**
*
* This function reads the requested data from NOR FLASH interface.
*
* @param    Address into the FLASH data space
*
* @return   Data at the provided offset in the FLASH
*
* @note    none.
*
****************************************************************************/
u32 ReadNor(u32 Address){

    return NorIn32(Address);

}

/******************************************************************************/
/**
*
* This function reads the requested byte from NOR FLASH interface.
*
* @param    Address into the FLASH data space
*
* @return   Data at the provided offset in the FLASH
*
* @note    none.
*
****************************************************************************/
u8 ReadNor8(u32 Address){

    return NorIn8(Address);

}

/******************************************************************************/
/**
*
* This function provides the reset of the NOR FLASH
*
* @param    None
*
* @return   None
*
* @note    none.
*
****************************************************************************/
void ResetNorFlash(void)
{
    NorOut8(FlashReadBaseAddress,         0xF0);
}


/******************************************************************************/
/**
*
* This function polls the status of the last command to the NOR FLASH
*
* @param    None
*
* @return   XST_SUCCESS if the command completes correctly
*           XST_FAILURE if the command fails to completes correctly
*
* @note    none.
*
****************************************************************************/
u32 PollDataStatusNorFlash(u32 Address, u8 Data)
{

    u8 Status;

    while (1) {
        Status = NorIn8(FlashReadBaseAddress + Address);
        if ((Status >> 7) == (Data >> 7)) {
            ResetNorFlash();
            return XST_SUCCESS;

        } else if ((Status >> 5) == 1) {

            Status = NorIn8(FlashReadBaseAddress + Address);

            if ((Status >> 7) == (Data >> 7)) {
                ResetNorFlash();
                return XST_SUCCESS;
            } else {
                ResetNorFlash();
                return XST_FAILURE; /* fail */
            }
        }
    }
} /* End of PollDataStatusNorFlash */

/******************************************************************************/
/**
*
* This function provides the NOR FLASH interface for the Simplified header
* functionality.
*
* @param    SourceAddress is address in FLASH data space
*           DestinationAddress is address in OCM data space
*
* @return   XST_SUCCESS if the write completes correctly
*           XST_FAILURE if the write fails to completes correctly
*
* @note    none.
*
****************************************************************************/

u32 NorAccess( u32 SourceAddress, u32 DestinationAddress, u32 LengthBytes)
{
    u32 Data;
    u32 Count;
    u32 *SourceAddr;
    u32 *DestAddr;
    int LengthWords;

    /* check for non-word tail
         * add bytes to cover the end */
    if ((LengthBytes%4) != 0){

        LengthBytes += (4 - (LengthBytes & 0x00000003));
    }

    LengthWords = LengthBytes >> WORD_LENGTH_SHIFT;

    SourceAddr = (u32 *)(SourceAddress + FlashReadBaseAddress);
    DestAddr = (u32 *)(DestinationAddress);

    /* Word transfers, endianism isn't an issue */
    for (Count=0; Count < LengthWords; Count++){

        Data = NorIn32((u32)(SourceAddr++));
        Xil_Out32((u32)(DestAddr++), Data);
    }

    return XST_SUCCESS;
}

