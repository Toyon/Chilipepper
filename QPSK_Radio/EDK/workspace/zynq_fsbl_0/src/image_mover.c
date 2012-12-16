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
* @file image_mover.c
*
* Move partitions to either DDR to execute or to program FPGA.
* It performs partition walk.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date        Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a jz   05/24/11 Initial release
* 2.00a jz   06/30/11 Updated partition header defs for 64-byte alignment
*                     change in data2mem tool
* 3.00 mb    25/05/12 Updated for standalone based bsp FSBL 
* 3.00a mb   06/06/12 Nand/SD encryption and review comments
* </pre>
*
* @note
*   A partition is either an executable or a bitstream to program FPGA
*
******************************************************************************/

/* Comment in the following to do data comparison after transfer for NOR/QSPI
 * CAUTION: time expensive
 */
//#define  VERIFY_DMA
/***************************** Include Files *********************************/
#include "fsbl.h"
#include "image_mover.h"
#include "xil_printf.h"
#include "xreg_cortexa9.h"
#include "pcap.h"

/************************** Constant Definitions *****************************/

/* We are 32-bit machine */
#define MAXIMUM_IMAGE_WORD_LEN 0x40000000

/**************************** Type Definitions *******************************/
struct PartHeader {
    u32 ImageWordLen;              /* 0x0 */
    u32 DataWordLen;               /* 0x4 */
    u32 PartitionWordLen;          /* 0x8 */
    u32 LoadAddr;                  /* 0xC */
    u32 ExecAddr;                  /* 0x10 */
    u32 PartitionStart;            /* 0x14 */
    u32 PartitionAttr;             /* 0x18 */
    u32 SectionCount;		/* 0x1C */
    u32 Pads[7];
    u32 CheckSum;                  /* 0x3C */
};

struct HeaderArray {
    u32 Fields[16];
};
/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

static u32 PartitionHeaderChecksum(struct HeaderArray *H);
static u32 GoToPartition(u32 ImageAddress, int PartNum);
static void GetHeader(u32 Address, struct PartHeader *H);
static int IsEmptyHeader(struct HeaderArray *H);
static int IsLastPartition(struct HeaderArray *H);
#ifdef VERIFY_DMA
static int VerifyData(u32 source, u32 dest, int length);
#endif

/************************** Variable Definitions *****************************/
extern u32 FlashReadBaseAddress;

ImageMoverType MoveImage;

/******************************************************************************/
/**
*
* This function dumps the partition header.
*
* @param	Partition header pointer
*
* @return	NONE
*
* @note
*******************************************************************************/
void DumpHeader(struct PartHeader *Header)
{
    debug_xil_printf("Image Word Len:	%08x\n\r", Header->ImageWordLen);
    debug_xil_printf("Data Word Len:	%08x\n\r", Header->DataWordLen);
    debug_xil_printf("Partition Word Len:	%08x\n\r", Header->DataWordLen);
    debug_xil_printf("Load Addr:		%08x\n\r", Header->LoadAddr);
    debug_xil_printf("Exec Addr:		%08x\n\r", Header->ExecAddr);
    debug_xil_printf("Partition Start:	%08x\n\r", Header->PartitionStart);
    debug_xil_printf("Partition Attr:	%08x\n\r", Header->PartitionAttr);
    debug_xil_printf("Section Count:	%08x\n\r", Header->SectionCount);
    debug_xil_printf("Checksum:		%08x\n\r", Header->CheckSum);
}

/******************************************************************************/
/**
*
* This function validates the partition header.
*
* @param	Partition header pointer
*
* @return	MOVE_IMAGE_FAIL if bad header.
* 		0 if successful.
*
* @note
*******************************************************************************/
u32 ValidateHeader(struct PartHeader *Header)
{
    struct HeaderArray *Hap;
    u32 ImageLength;
    u32 PartitionLength;

    Hap = (struct HeaderArray *)Header;

    /* If there are no partitions to load, fail */
    if (IsLastPartition(Hap) ||
         IsEmptyHeader(Hap)) {
        xil_printf("Image with no partitions, falling back....\r\n"
            "****** Light is ON, NO one is home ******\r\n");

        OutputStatus(IMAGE_HAS_NO_PARTITIONS);
        return MOVE_IMAGE_FAIL;
    }

    /* Validate Checksum of partition header */
    if (PartitionHeaderChecksum(Hap) == XST_FAILURE) {
        debug_xil_printf("PartitionImageMove: ERROR checksum\r\n");

        OutputStatus(PARTITION_HEADER_CORRUPTION);
        return MOVE_IMAGE_FAIL;
    }

    ImageLength = Header->ImageWordLen;
    PartitionLength = Header->PartitionWordLen;

    if (ImageLength > MAXIMUM_IMAGE_WORD_LEN) {
        debug_xil_printf("Invalid Image word length %08X\r\n",
            ImageLength);

        OutputStatus(INVALID_PARTITION_LENGTH);
        return MOVE_IMAGE_FAIL;
    }

    /* For current tool implementation, partition header is not
     * encrypted. If the tool will encrypt the partition header,
     * the following should be overwritten after header decryption
     */
    if (ImageLength == 0) {
        /* if it is an empty partition, it is OK */
        if (PartitionLength != 0) {
                debug_xil_printf("PartitionImageMove:"
            "0 Image length, "
            "non-zero partition length\r\n");

            OutputStatus(INVALID_PARTITION_HEADER);
            return MOVE_IMAGE_FAIL;
        }
    }

    return XST_SUCCESS;
} /* end of ValidateHeader */

/******************************************************************************/
/**
*
* This function reads the data at the provided FLASH address and expects
* the partition header structure to be present. If the header is not
* present (blank FLASH) or does not match expected values, MOVE_IMAGE_FAIL
* is returned.
*
* There are four cases in partition handling:
*
* 1. If attribute indicates this is a bitstream partition, FPGA is programmed,
*    and if this is the last partition, FSBL hangs with WDT kicking
* 2. If Image word length != data word length, the partition is encrypted
*    partition. The partition is decrypted into DDR
* 3. Other cases, partition is moved from flash to DDR through copying or DMA
* 4. If partition data word length is 0, the partition is to be skipped. Note
*    that partition header cannot be encrypted for this to work
*
* Except case 1, the reboot status register is updated to reflect the next
* partition.
*
* @param    ImageAddress is the start of the image
* @param    PartitionNum is the index of the partition to process
*
* @return   MOVE_IMAGE_FAIL (0xFFFFFFFF) if image load failed
*           Address to begin executing at if successful
*
* @note
****************************************************************************/
u32 PartitionMove(u32 ImageAddress, int PartitionNum)
{
    u32 SourceAddr;
    u32 LoadAddr;
    u32 ExecAddr;
    u32 ImageLength;
    u32 DataLength;
    u32 SectionCount;

    u32 PartitionStart;
    u32 PartitionLength;

    u32 TempValue;
    u32 NextPartitionAddr;
    int NextPartition;
    u32 Status;

    u32 Attribute;
    u32 Before;
    u32 After;
     /* Flag to determine if image is encrypted or not */
    u32 IsEncrypted = 0;

    struct HeaderArray *Hap;
    struct PartHeader Header;

    ExecAddr = MOVE_IMAGE_FAIL;
    TempValue = 0;

    /* Default is not to skip partition execution */
    SkipPartition = 0;

    debug_xil_printf("image move with partition number %d\r\n",
         PartitionNum);

    PartitionStart = GoToPartition(ImageAddress, PartitionNum);

    GetHeader(PartitionStart, &Header);

    debug_xil_printf("--------- Header dump:\n\r");
    DumpHeader(&Header);

    Hap = (struct HeaderArray *)&Header;
    Status = ValidateHeader(&Header);
    if(Status !=0)
        return Status;

    ImageLength = Header.ImageWordLen;
    DataLength = Header.DataWordLen;
    PartitionLength = Header.PartitionWordLen;
    LoadAddr = Header.LoadAddr;
    ExecAddr = Header.ExecAddr;
    SourceAddr = Header.PartitionStart;
    Attribute = Header.PartitionAttr;
    SectionCount = Header.SectionCount;

    /* The offset in header is word offset */
    SourceAddr = SourceAddr << WORD_LENGTH_SHIFT;

    /* Consider image offset */
    SourceAddr += ImageAddress;

    debug_xil_printf("Partition Start %08x, Partition Length %08x\r\n",
                        PartitionStart, PartitionLength);

    debug_xil_printf("Source addr %08x, Load addr %08x, Exec addr %08x\r\n",
                        SourceAddr, LoadAddr, ExecAddr);

    /* If encrypted partition header, will get wrong next partition
     * address. Next run will fail and invoke FSBL fallback.
     * WARNING: Cannot handle skipping over encrypted partition header */
    if (DataLength == 0) {
        xil_printf("PartitionImageMove: skip partition. "
            "If encrypted partition, will fail\r\n");

        SkipPartition = 1;
        goto update_status_reg;
    }

    if (Attribute == ATTRIBUTE_PL_IMAGE_MASK) {
        debug_xil_printf("**** Bitstream **** \r\n");

        /* Check if encrypted or non encrypted */
        /* If image length not equal to data length, encrypted */
        if (ImageLength != DataLength) {
            IsEncrypted = 1;
            debug_xil_printf("ecrypted partition Encrypteion is enabled\n");
        }

        debug_xil_printf("Source addr %x, load addr %x, "
                "exec addr %x\r\n", SourceAddr, LoadAddr, ExecAddr);

        Before = mfcp(XREG_CP15_PERF_CYCLE_COUNTER);

        if (IsEncrypted) {
            /* Bitstream NAND/SD encrypted */
            if (((FlashReadBaseAddress & 0xFF000000) == XPS_NAND_BASEADDR) ||
                                (FlashReadBaseAddress == XPS_SD_BASEADDR)) {
                Status = WritePcapXferData(
                           (u32 *)(SourceAddr),
                           (u32 *)XDCFG_DMA_INVALID_ADDRESS,
                           (ImageLength), 0, XDCFG_SECURE_PCAP_WRITE);
            } else {
            /* Bitstream QSPI/NOR Encrypted */
                Status = WritePcapXferData(
                           (u32 *)(FlashReadBaseAddress + SourceAddr),
                           (u32 *)XDCFG_DMA_INVALID_ADDRESS,
                           (ImageLength), 0, XDCFG_SECURE_PCAP_WRITE);
                }

            } else {
                /* Bitstream NAND/SD Unencrypted */
            	debug_xil_printf("Bit stream NAND/SD Unencrypted \r\n");
                if (((FlashReadBaseAddress & 0xFF000000) == XPS_NAND_BASEADDR) ||
                                    (FlashReadBaseAddress == XPS_SD_BASEADDR)) {
                    Status = WritePcapXferData(
                                (u32 *)(SourceAddr),
                                (u32 *)XDCFG_DMA_INVALID_ADDRESS,
                                (ImageLength), 0, XDCFG_NON_SECURE_PCAP_WRITE);
                } else {
                    /* Bitstream QSPI/NOR - unencrypted */
                    Status = WritePcapXferData(
                                (u32 *)(FlashReadBaseAddress + SourceAddr),
                                (u32 *)XDCFG_DMA_INVALID_ADDRESS,
                                (ImageLength), 0, XDCFG_NON_SECURE_PCAP_WRITE);
                    }
                }

                After = mfcp(XREG_CP15_PERF_CYCLE_COUNTER);
                debug_xil_printf("Bitstream transfer time %x\n",
                                    After - Before);

                if (Status != XST_SUCCESS) {
                    debug_xil_printf("Failed to download bitstream\n");
                    OutputStatus(BITSTREAM_DOWNLOAD_FAIL);
                    return MOVE_IMAGE_FAIL;
            } else {

                debug_xil_printf("Bit stream download successful!\r\n");
        }

        if (IsLastPartition(Hap)) {
            /* This is the last partition, done */
            debug_xil_printf("Last partition is bit stream, done\r\n");
            while(1) {
                PatWDT();
            }

        } else if(IsEmptyHeader(Hap)) {
            debug_xil_printf("Empty partition header\r\n");
            OutputStatus(EMPTY_PARTITION_HEADER);
            return MOVE_IMAGE_FAIL;
        }
        /* We will skip soft reset and start loading the next partition */
        SkipPartition = 1;

        /* Go to the next partition */
        goto update_status_reg;

    } /* End of bitstream */
    /* Process all the partitions of application */

    while(SectionCount-- > 0) {

    /* If image length not equal to data length, encrypted */
    if (ImageLength != DataLength) {
        IsEncrypted = 1;
        debug_xil_printf("application encrypted\n\r");
        /* NAND and SD do not support encrypted partitions */
         if (((FlashReadBaseAddress & 0xFF000000) == XPS_NAND_BASEADDR) ||
             (FlashReadBaseAddress == XPS_SD_BASEADDR)) {

             debug_xil_printf("Images on NAND or SD   encrypted\r\n");
             Status = WritePcapXferData(
                        (u32 *)SourceAddr,
                        (u32 *)LoadAddr, ImageLength,
                         DataLength, XDCFG_SECURE_PCAP_WRITE);

             if (Status != XST_SUCCESS) {
                 OutputStatus(DECRYPTION_FAIL);
                 return MOVE_IMAGE_FAIL;
             }
         } else {
  /* Review: Can be removed this define is not required */
#ifdef PALLADIUM  /* Palladium has fixed BBRAM key */
                Status = WritePcapXferData(
                         (u32 *)(FlashReadBaseAddress + SourceAddr),
                         (u32 *)LoadAddr, ImageLength, DataLength,
                         XDCFG_SECURE_PCAP_WRITE);

               if (Status != XST_SUCCESS) {
                   debug_xil_printf("Failed to decrypt partition with bram\r\n");

                   OutputStatus(DECRYPTION_FAIL);
                   return MOVE_IMAGE_FAIL;
               }
#else

               Status = WritePcapXferData(
                        (u32 *)(FlashReadBaseAddress + SourceAddr),
                        (u32 *)LoadAddr, ImageLength,
                        DataLength, XDCFG_SECURE_PCAP_WRITE);

               if (Status != XST_SUCCESS) {
                   OutputStatus(DECRYPTION_FAIL);
                   return MOVE_IMAGE_FAIL;
             }
#endif
        }
         debug_xil_printf("Transfer is completed \n");
        if (SectionCount != 0) {
        	debug_xil_printf("load_next_partition\n\r");
            goto load_next_partition;
        }

        goto update_status_reg;
    }  else {/*End of if ImageLength != DataLength */

        debug_xil_printf("Start transfer data into DDR\n\r");
        /* Not using PCAP dma to copy , doing an image move
         * Same path for all boot modes QSPI/NAND/NOR/SD */
        /* Non-secure path */
#ifndef USE_PCAP_DMA_TO_MOV_IMAGE
        Before = mfcp(XREG_CP15_PERF_CYCLE_COUNTER);
        debug_xil_printf("not using PCAP DMA TO MOV IMAGE \n");
        MoveImage(SourceAddr, LoadAddr, (DataLength << WORD_LENGTH_SHIFT));
        After = mfcp(XREG_CP15_PERF_CYCLE_COUNTER);
        debug_xil_printf("transfer time %x\r\n", After - Before);
#else   /* USE_PCAP_DMA_TO_MOV_IMAGE */
        Before = mfcp(XREG_CP15_PERF_CYCLE_COUNTER);

        /* NAND and SD always use processor copy */
        if (((FlashReadBaseAddress & 0xFF000000) == XPSS_NAND_BASEADDR) ||
            (FlashReadBaseAddress == XPSS_SD_BASEADDR)) {

            Status = WritePcapXferData(
                  (u32 *)SourceAddr,
                  (u32 *)LoadAddr, ImageLength,
                   DataLength, XDCFG_NON_SECURE_PCAP_WRITE);

        } else {
            Status = WritePcapXferData(
                      (u32 *)(FlashReadBaseAddress + SourceAddr),
                      (u32 *)LoadAddr, ImageLength,
                      DataLength, XDCFG_NON_SECURE_PCAP_WRITE);
        }

        After = mfcp(XREG_CP15_PERF_CYCLE_COUNTER);

        debug_xil_printf("DMA transfer time %x\r\n", After - Before);

        if (Status == XST_FAILURE){
            debug_xil_printf("PCAP image move returned failure\r\n");

            OutputStatus(DMA_TRANSFER_FAIL);
            return MOVE_IMAGE_FAIL;
        }
#endif  /*USE_PCAP_DMA_TO_MOV_IMAGE */
    }


load_next_partition:
    if (SectionCount == 0) {
        goto update_status_reg;
    }

    PartitionNum += 1;

    /* Read the next partition */
    debug_xil_printf("Get next partition header\n\r");

    NextPartitionAddr = GoToPartition(ImageAddress, PartitionNum);
    GetHeader(NextPartitionAddr, &Header);

    debug_xil_printf("Next partition header dump\r\n");
    DumpHeader(&Header);

    Status = ValidateHeader(&Header);
    if(Status !=XST_SUCCESS)
        return Status;

    /* Don't re-initialize ExecAddr & SectionCount */
    ImageLength = Header.ImageWordLen;
    DataLength = Header.DataWordLen;
    PartitionLength = Header.PartitionWordLen;
    LoadAddr = Header.LoadAddr;
    SourceAddr = Header.PartitionStart;

    /* The offset in header is word offset */
    SourceAddr = SourceAddr << WORD_LENGTH_SHIFT;

    /* Consider image offset */
    SourceAddr += ImageAddress;

    debug_xil_printf("Partition Start %08x, Partition Length %08x\r\n",
                        PartitionStart, PartitionLength);

    debug_xil_printf("Source addr %08x, Load addr %08x, Exec addr %08x\r\n",
                        SourceAddr, LoadAddr, ExecAddr);

    } /* End of while Section count > 0 */


update_status_reg:

    NextPartition = PartitionNum + 1;

    debug_xil_printf("Get next partition header\n\r");

    NextPartitionAddr = GoToPartition(ImageAddress, PartitionNum + 1);
    GetHeader(NextPartitionAddr, &Header);
    Hap = (struct HeaderArray *)&Header;

    debug_xil_printf("--------- Next Header dump:\n\r");
    DumpHeader(&Header);

    /* If it is the last partition, then we will keep on running
         * this one */
    if (IsLastPartition(Hap)) {
        debug_xil_printf("There are no more partitions to load\r\n");
        NextPartition = PartitionNum;

    } else if(IsEmptyHeader(Hap)) {
        debug_xil_printf("Empty partition header %x\r\n", NextPartitionAddr);
        OutputStatus(EMPTY_PARTITION_HEADER);
        return MOVE_IMAGE_FAIL;
    }

    SlcrUnlock();

    Status = FsblSetNextPartition(NextPartition);

    if (Status != XST_SUCCESS) {
        debug_xil_printf("Next partition number %d is not valid\n",
                              NextPartition);

        OutputStatus(TOO_MANY_PARTITIONS);
        return MOVE_IMAGE_FAIL;
    }

    debug_xil_printf("end of partition move, reboot status reg %x, "
         "Next partition %d\r\n",
         MoverIn32(REBOOT_STATUS_REG), NextPartition);
    debug_xil_printf("Execution Address = 0x%x \n",ExecAddr);

    /* Returning Execution Address */
    return ExecAddr;
} /* End of Partition Move */

/******************************************************************************/
/**
*
* This function checks the header checksum If the header checksum is not valid
* XST_FAILURE is returned.
*
* @param    H is a pointer to struct HeaderArray
*
* @return   XST_SUCCESS is header checksum is ok
*           XST_FAILURE if not
*
* @note
*
****************************************************************************/
static u32 PartitionHeaderChecksum(struct HeaderArray *H){

	u32 Checksum;
	u32 Count;

	Checksum = 0;

	for (Count = 0; Count < PARTITION_HDR_CHECKSUM_WORD_COUNT; Count++){

		/* Read the word from the header */
		Checksum += H->Fields[Count];
	}

	/* invert checksum, last bit of error checking */
	Checksum ^= 0xFFFFFFFF;

	/* validate the checksum */
	if (H->Fields[PARTITION_HDR_CHECKSUM_WORD_COUNT] != Checksum){

		debug_xil_printf("Checksum %8.8x != %8.8x\r\n",
		    Checksum, H->Fields[PARTITION_HDR_CHECKSUM_WORD_COUNT]);
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

/******************************************************************************/
/**
* This function check whether the current partition is the end of partitions
*
* The partition is the end of the partitions if it looks like this:
*  0x00000000
*  0x00000000
*  ....
*  0x00000000
*  0x00000000
*  0xFFFFFFFF
*
* This function only checks the first, second, third and eighth word.
*
* @param    H is a pointer to struct HeaderArray
*
* @return
*   1 -- for last partition
*   0 -- for not last partition
*
****************************************************************************/
static int IsLastPartition(struct HeaderArray *H)
{
	int i;

	if (H->Fields[PARTITION_HDR_CHECKSUM_WORD_COUNT] != 0xFFFFFFFF) {
		return 0;
	}

	for (i = 0; i < PARTITION_HDR_WORD_COUNT - 1; i++) {

		if (H->Fields[i] != 0x0) {
			return 0;
		}
	}

	return 1;
}

/******************************************************************************/
/**
* This function check whether the current partition header is empty.
* A partition header is considered empty if image word length is 0 and the
* last word is 0.
*
* @param    H is a pointer to struct HeaderArray
*
* @return
*   1 -- for empty partition header
*   0 -- for not empty partition header
*
* @note
* Caller is responsible to make sure the address is valid
*
****************************************************************************/
static int IsEmptyHeader(struct HeaderArray *H)
{
	int i;

	for (i = 0; i < PARTITION_HDR_WORD_COUNT; i++) {

		if (H->Fields[i] != 0x0) {
			return 0;
		}
	}

	return 1;
}

/******************************************************************************/
/**
*
* This function goes to the partition header of the specified partition
*
* @param    ImageAddr is the start address of the image
* @param    PartNum is the partition number to go to
*
* @return   Partition header address of the partition
*
* @note
*   None
****************************************************************************/
static u32 GoToPartition(u32 ImageAddress, int PartNum)
{
	u32 HdrAddr;

	debug_xil_printf(" ImageAddress = 0x%x \n",ImageAddress);
	MoveImage(ImageAddress + IMAGE_PHDR_OFFSET, (u32)&HdrAddr, 4);

	debug_xil_printf("Partition hdr for %d: %x\n\r", PartNum,
		ImageAddress + HdrAddr + PARTITION_HDR_TOTAL_LEN * (PartNum + 1));

	return (ImageAddress + HdrAddr + PARTITION_HDR_TOTAL_LEN * (PartNum + 1));
}

/******************************************************************************/
/**
*
* This function gets the partition header
*
* @param    ImageAddr is the start address of the image
* @param    H is the pointer to the partition Header structure
*
* @return
*   None
*
* @note
*   None
****************************************************************************/
static void GetHeader(u32 Address, struct PartHeader *H)
{

	MoveImage(Address, (u32)H, PARTITION_HDR_TOTAL_LEN);

}

#ifdef VERIFY_DMA
/** Remove for production, debug */
static int VerifyData(u32 source, u32 dest, int length) {

	int i;
	int WordLen;
	u32 src;
	u32 dst;

	WordLen = length >> WORD_LENGTH_SHIFT;
	for (i = 0; i < WordLen; i++) {

		MoveImage(source + i * 4, (u32)&src, 4);
		dst = *(u32 *)(dest + i * 4);

		PatWDT();

		if (src != dst) {
			xil_printf("base %x, dest %x, data corruption on word %x: %x/%x\n\r",
			    source + i * 4, dest + i * 4, i, src, dst);

			while(1);
			return XST_FAILURE;
		}
	}

	return XST_SUCCESS;
}
#endif


