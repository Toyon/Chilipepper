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
* @file mmc.c
*
*  SD interface to FatFS
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date        Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a bh   05/28/11 Initial release
*       nm   03/20/12 Changed the SD base clock divider from 0x40 to 0x04.
*
* </pre>
*
* @note
*
******************************************************************************/
#include "xparameters.h"
#include "fsbl.h"
#ifdef XPS_SDIO0_BASEADDR

#include "diskio.h"    /* Common include file for FatFs and disk I/O layer */
#include "ff.h"
#include "xil_types.h"
#include "sd_hardware.h"
#define SD_BASEADDR XPS_SDIO0_BASEADDR
/* Map logical volume to physical drive + partition.
 * Logical X [0-3] to Physical 0, partition X
 */
#if _MULTI_PARTITION
const PARTITION VolToPart[] = {
        {0, 0}, {0, 1}, {0, 2}, {0, 3} };
#endif

static DSTATUS Stat;    /* Disk status */
static BYTE CardType;   /* b0:MMC, b1:SDv1, b2:SDv2, b3:Block addressing */

/*
 * "The" DMA buffer.  Only single sector reads (512 bytes) are
 * performed.
 */
static u32 sd_dma_buffer[129];

/* Data Memory Barrier */
#define dmb() __asm__ __volatile__ ("dmb" : : : "memory")
#define SYNCHRONIZE_IO dmb()

static void sd_out32(u32 OutAddress, u32 Value)
{
        OutAddress += SD_BASEADDR;
        *(volatile u32 *) OutAddress = Value;
        SYNCHRONIZE_IO;
}
static void sd_out16(u32 OutAddress, u16 Value)
{
        OutAddress += SD_BASEADDR;
        *(volatile u16 *) OutAddress = Value;
        SYNCHRONIZE_IO;
}
static void sd_out8(u32 OutAddress, u8 Value)
{
        OutAddress += SD_BASEADDR;
        *(volatile u8 *) OutAddress = Value;
        SYNCHRONIZE_IO;
}

static u32 sd_in32(u32 InAddress)
{
        SYNCHRONIZE_IO;
        InAddress += SD_BASEADDR;
        return *(volatile u32 *) InAddress;
}
static u16 sd_in16(u32 InAddress)
{
        SYNCHRONIZE_IO;
        InAddress += SD_BASEADDR;
        return *(volatile u16 *) InAddress;
}
static u8 sd_in8(u32 InAddress)
{
        SYNCHRONIZE_IO;
        InAddress += SD_BASEADDR;
        return *(volatile u8 *) InAddress;
}

/* Initialize the SD controller */
static void init_port(void)
{
        unsigned clk;
        int i;

        Stat = STA_NOINIT;

        /* Scrub the DMA buffer */
        for (i=0; i<129; i++) {
                sd_dma_buffer[i] = 0xDEADBEEF;
        }

        /* Power off the card */
        sd_out8(SD_PWR_CTRL_R, 0);

        /* Disable interrupts */
        sd_out32(SD_SIG_ENA_R, 0);

        /* Perform soft reset */
        sd_out8(SD_SOFT_RST_R, SD_RST_ALL);
        /* Wait for reset to comlete */
        while (sd_in8(SD_SOFT_RST_R)) {
                ;
        }

        /* Power on the card */
        sd_out8(SD_PWR_CTRL_R, SD_POWER_33|SD_POWER_ON);

        /* Enable Internal clock and wait for it to stablilize */
        clk = (0x04 << SD_DIV_SHIFT) | SD_CLK_INT_EN;
        sd_out16(SD_CLK_CTL_R, clk);
        do {
                clk = sd_in16(SD_CLK_CTL_R);
        } while (!(clk & SD_CLK_INT_STABLE));

        /* Enable SD clock */
        clk |= SD_CLK_SD_EN;
        sd_out16(SD_CLK_CTL_R, clk);

        sd_out32(SD_SIG_ENA_R, 0xFFFFFFFF);
        sd_out32(SD_INT_ENA_R, 0xFFFFFFFF);
}


/*--------------------------------------------------------------------------

   Module Private Functions

---------------------------------------------------------------------------*/

/* MMC/SD commands */
#define CMD0    (0)             /* GO_IDLE_STATE */
#define CMD1    (1)             /* SEND_OP_COND */
#define ACMD41  (0x80+41)       /* SEND_OP_COND (SDC) */
#define CMD2    (2)             /* SEND_CID */
#define CMD3    (3)             /* RELATIVE_ADDR */
#define CMD5    (5)             /* SLEEP_WAKE (SDC) */
#define CMD7    (7)             /* SELECT */
#define CMD8    (8)             /* SEND_IF_COND */
#define CMD9    (9)             /* SEND_CSD */
#define CMD10   (10)            /* SEND_CID */
#define CMD12   (12)            /* STOP_TRANSMISSION */
#define ACMD13  (0x80+13)       /* SD_STATUS (SDC) */
#define CMD16   (16)            /* SET_BLOCKLEN */
#define CMD17   (17)            /* READ_SINGLE_BLOCK */
#define CMD18   (18)            /* READ_MULTIPLE_BLOCK */
#define CMD23   (23)            /* SET_BLOCK_COUNT */
#define ACMD23  (0x80+23)       /* SET_WR_BLK_ERASE_COUNT (SDC) */
#define CMD24   (24)            /* WRITE_BLOCK */
#define CMD25   (25)            /* WRITE_MULTIPLE_BLOCK */
#define CMD41   (41)            /* SEND_OP_COND (ACMD) */
#define CMD52   (52)            /*  */
#define CMD55   (55)            /* APP_CMD */
#define CMD58   (58)            /* READ_OCR */

/* Card type flags (CardType) */
#define CT_MMC          0x01            /* MMC ver 3 */
#define CT_SD1          0x02            /* SD ver 1 */
#define CT_SD2          0x04            /* SD ver 2 */
#define CT_SDC          (CT_SD1|CT_SD2) /* SD */
#define CT_BLOCK        0x08            /* Block addressing */



/*
 * make_command:
 * Determine the value of the controller transfer register for the provided
 * command index.
 */
static int
make_command (unsigned cmd)
{
        unsigned retval;

        retval = cmd << 8;

#define RSP_NONE SD_CMD_RESP_NONE
#define RSP_R1   (SD_CMD_INDEX|SD_CMD_RESP_48     |SD_CMD_CRC)
#define RSP_R1b  (SD_CMD_INDEX|SD_CMD_RESP_48_BUSY|SD_CMD_CRC)
#define RSP_R2   (SD_CMD_CRC  |SD_CMD_RESP_136)
#define RSP_R3   (SD_CMD_RESP_48)
#define RSP_R6   (SD_CMD_INDEX|SD_CMD_RESP_48_BUSY|SD_CMD_CRC)

        switch(cmd) {
        case CMD0:
                retval |= (SD_CMD_RESP_NONE);
                break;
        case CMD1:
                retval |= RSP_R3;
                break;
        case CMD2:
                retval |= RSP_R2;
                break;
        case CMD3:
                retval |= RSP_R6;
                break;
        case CMD5:
                retval |= RSP_R1b;
                break;
        case CMD7:
                retval |= RSP_R1;
                break;
        case CMD8:
                retval |= RSP_R1;
                break;
        case CMD9:
                retval |= RSP_R2;
                break;
        case CMD10:
        case CMD12:
        case ACMD13:
        case CMD16:
                retval |= RSP_R1;
                break;
        case CMD17:
                retval |= RSP_R1|SD_CMD_DATA;
                break;
        case CMD18:
        case CMD23:
        case ACMD23:
        case CMD24:
        case CMD25:
        case CMD41:
                retval |= RSP_R3;
                break;
        case CMD52:
        case CMD55:
                retval |= RSP_R1;
                break;
        case CMD58:
                break;
        }

        return retval;
}

/*
 * Send a command.  Returns 1 on success, 0 on timeout.
 */
static
BYTE send_cmd (
        BYTE cmd,               /* Command byte */
        DWORD arg,              /* Argument */
        DWORD *response
)
{
        u32 status;
        u16 cmdreg;

#ifdef DEBUG_VERBOSE
        debug_xil_printf("send_cmd: cmd: %d arg: 0x%x\n",
                cmd, arg);
#endif

        if (response) {
                *response = 0;
        }

        /* Wait until the device is willing to accept commands */
        do {
                status = sd_in32(SD_PRES_STATE_R);
        } while (status & (SD_CMD_INHIBIT|SD_DATA_INHIBIT));

        /* Clear all pending interrupt status */
        sd_out32(SD_INT_STAT_R, 0xFFFFFFFF);

        /* Set the DMA address to the DMA buffer.
         * This is only relevant for data commands.
         */
        sd_out32(SD_DMA_ADDR_R, (u32)&sd_dma_buffer[0]);

        /* 512 byte block size.
         * This is only relevant for data commands.
         */
        sd_out16(SD_BLOCK_SZ_R, 0x200);
        sd_out16(SD_BLOCK_CNT_R, 1);

        sd_out8(SD_TIMEOUT_CTL_R, 0xA);

        sd_out32(SD_ARG_R, arg);

        /* Set the transfer mode to read, simple DMA, single block
         * (applicable only to data commands)
         * This is all that this software supports.
         */
        sd_out16(SD_TRNS_MODE_R,
                SD_TRNS_BLK_CNT_EN|SD_TRNS_READ|SD_TRNS_DMA);

        /* Initiate the command */
        cmdreg = make_command(cmd);
        sd_out16(SD_CMD_R, cmdreg);

        /* Poll until operation complete */
        while (1) {
                status = sd_in32(SD_INT_STAT_R);
                if (status & SD_INT_ERROR) {
#ifdef DEBUG
                        debug_xil_printf("send_cmd: Error: (0x%08x) cmd: %d arg: 0x%x\n",
                                status, cmd, arg);
#endif
                        sd_out8(SD_SOFT_RST_R, SD_RST_CMD|SD_RST_DATA);

                        return 0;
                }
                /* Command complete? */
                if (status & SD_INT_CMD_CMPL) {
                        if (cmdreg & SD_CMD_DATA) {
                                if (status & (SD_INT_DMA | SD_INT_TRNS_CMPL)) {
                                        /* DMA transfer complete */
                                        break;
                                }
                        } else {
                                /* Non-DMA transfer complete */
                                break;
                        }
                }
    }

        status = sd_in32(SD_RSP_R);
        if (response) {
                *response = status;
        }

#ifdef DEBUG_VERBOSE
        debug_xil_printf("send_cmd: response: 0x%08x 0x%08x 0x%08x 0x%08x\n",
                sd_in32(SD_RSP_R),
                sd_in32(SD_RSP_R+4),
                sd_in32(SD_RSP_R+8),
                sd_in32(SD_RSP_R+12));
#endif

        return 1;
}



/*--------------------------------------------------------------------------

   Public Functions

---------------------------------------------------------------------------*/


/*-----------------------------------------------------------------------*/
/* Get Disk Status                                                       */
/*-----------------------------------------------------------------------*/

DSTATUS disk_status (
        BYTE drv                        /* Drive number (0) */
)
{
        DSTATUS s = Stat;
        unsigned statusreg;

        statusreg = sd_in32(SD_PRES_STATE_R);
        if (!(statusreg & SD_CARD_INS)) {
                s = STA_NODISK | STA_NOINIT;
        } else {
                s &= ~STA_NODISK;
                if (statusreg & SD_CARD_WP)
                        s |= STA_PROTECT;
                else
                        s &= ~STA_PROTECT;
        }
        Stat = s;

        return s;
}



/*-----------------------------------------------------------------------*/
/* Initialize Disk Drive                                                 */
/*-----------------------------------------------------------------------*/

DSTATUS disk_initialize (
        BYTE drv                /* Physical drive nmuber (0) */
)
{
        BYTE ty;
        DSTATUS s;
        DWORD response;
        unsigned rca;

        /* Check if card is in the socket */
        s = disk_status(drv);
        if (s & STA_NODISK) {
                debug_xil_printf("No SD card present.\n");
                return s;
        }
#ifdef NOTNOW_BHILL
        /* Already initialized? */
        if (!(s & STA_NOINIT))
                return s;
#endif

        /* Initialize the host controller */
        init_port();

        /* Enter Idle state */
        send_cmd(CMD0, 0, NULL);

        ty = CT_SD1;
        /* SDv2? */
        if (send_cmd(CMD8, 0x1AA, &response) == 1) {
                /* The card can work at vdd range of 2.7-3.6V */
                if (response == 0x1AA) {
                        ty = CT_SD2;
                }
        }

        /* Wait for leaving idle state (ACMD41 with HCS bit) */
        while (1) {
                /* ACMD41, Set Operating Contitions */
                send_cmd(CMD55, 0, NULL);
                                 /* 0x00ff8000 */
                s = send_cmd(CMD41, 0x40300000, &response);
                if (s == 0) {
                        /* command error; probably an MMC card. */
                        /* presently unsupported; abort */
                        ty = 0;
                        goto fail;
                }
                if (response & 1<<31) {
                        break;
                }
        }
        if (response & 1<<30) {
                /* Card supports block addressing */
                ty |= CT_BLOCK;
        }

        /* Get CID */
        send_cmd(CMD2, 0, &response);

        /* Get RCA */
        rca = 0x1234;
        send_cmd(CMD3, rca << 16, &response);
        rca = response >> 16;

        /* select card */
        send_cmd(CMD7, rca << 16, &response);

        /* Set R/W block length to 512 */
        send_cmd(CMD16, 512, &response);

fail:
        CardType = ty;
        if (ty)         /* Initialization succeded */
                s &= ~STA_NOINIT;
        else            /* Initialization failed */
                s |= STA_NOINIT;
        Stat = s;

        return s;
}



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/

DRESULT disk_read (
        BYTE drv,                       /* Physical drive nmuber (0) */
        BYTE *buff,                     /* Pointer to the data buffer to store read data */
        DWORD sector,                   /* Start sector number (LBA) */
        BYTE count                      /* Sector count (1..128) */
)
{
        DSTATUS s;

        s = disk_status(drv);
        if (s & STA_NOINIT) return RES_NOTRDY;
        if (!count) return RES_PARERR;
        /* Convert LBA to byte address if needed */
        if (!(CardType & CT_BLOCK)) sector *= 512;
        while (count > 0) {
                /* READ_SINGLE_BLOCK */
                if (send_cmd(CMD17, sector, NULL) == 1) {
                memcpy_rom(buff, &sd_dma_buffer[0], 512);
                if (CardType & CT_BLOCK) {
                       sector++;
                } else {
                       sector += 512;
                }
                buff += 512;
                count--;
                } else {
                        debug_xil_printf("disk_read: failure - sector: %d\n", (int)sector);
                        break;
                }
        }

        return count ? RES_ERROR : RES_OK;
}


/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

DRESULT disk_ioctl (
        BYTE drv,               /* Physical drive nmuber (0) */
        BYTE ctrl,              /* Control code */
        void *buff              /* Buffer to send/receive control data */
)
{
        DRESULT res;

        if (disk_status(drv) & STA_NOINIT)                      /* Check if card is in the socket */
                return RES_NOTRDY;

        res = RES_ERROR;
        switch (ctrl) {
                case CTRL_SYNC :                /* Make sure that no pending write process */
                        break;

                case GET_SECTOR_COUNT : /* Get number of sectors on the disk (DWORD) */
                        break;

                case GET_BLOCK_SIZE :   /* Get erase block size in unit of sector (DWORD) */
                        *(DWORD*)buff = 128;
                        res = RES_OK;
                        break;

                default:
                        res = RES_PARERR;
        }

        return res;
}

/*---------------------------------------------------------*/
/* User Provided Timer Function for FatFs module           */
/*---------------------------------------------------------*/

DWORD get_fattime (void)
{
        return    ((DWORD)(2010 - 1980) << 25)  /* Fixed to Jan. 1, 2010 */
                        | ((DWORD)1 << 21)
                        | ((DWORD)1 << 16)
                        | ((DWORD)0 << 11)
                        | ((DWORD)0 << 5)
                        | ((DWORD)0 >> 1);
}

#endif
