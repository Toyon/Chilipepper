#include "chilipepper.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xil_printf.h"
#include <math.h>
#include "xbasic_types.h"

#define MCU_UART
#define MCU_DRIVER
#define DC_OFFSET
#define TX_DRIVER
#define DAC_DRIVER
#define RX_DRIVER

#ifdef MCU_UART
#include "xuartlite.h"
XUartLite uartLite;
#endif
#ifdef TX_DRIVER
#include "tx_axiw.h"
#endif
#ifdef RX_DRIVER
#include "rx_axiw.h"
#endif
#ifdef DC_OFFSET
//#include "dc_offset_axiw.h"
#endif

#define TARGET_RSSI 800
#define TARGET_RSSI_MARGIN 50

unsigned char SendBuffer[4];	/* Buffer for Transmitting Data */
unsigned char RecvBuffer[4];	/* Buffer for Receiving Data */

#ifdef RX_DRIVER
xc_iface_t 			*chiliRxIface;
xc_from_fifo_t 	*chiliRxFromFifo;
#endif

// mcu registers
Xuint32 *chili_init_done, *chili_pa_en, *chili_tr_sw, *chili_mcu_reset, *chili_rx_en, *chili_tx_en;
// DAC registers
Xuint32 *dac_en;
// DC Offset registers
Xuint32 *chili_rssi, *chili_dir, *chili_rssi_high_goal, *chili_rssi_low_goal, *chili_agc_en, *rx_en;
// RX registers
Xuint32 *chili_mcu_rx_ready, *chili_num_bytes_ready, *chili_percent_full;
// tx registers
Xuint32 *clear_fifo, *tx_en, *tx_done, *tx_fifo;

/////////////////////////////////////////////////////////////////////////////////////////////
// Initialize
/////////////////////////////////////////////////////////////////////////////////////////////
int Chilipepper_Initialize( void )
{
	int xStatus;

	// take care of the UART that goes to/from Chilipepper
#ifdef MCU_UART
	xStatus = XUartLite_Initialize(&uartLite, XPAR_AXI_UARTLITE_0_DEVICE_ID);
	if ( xStatus != 0 )
		return -1;
	XUartLite_ResetFifos(&uartLite);
#endif

#ifdef RX_DRIVER
	// initialize the software driver, assuming the Pcore device ID is 0
	XC_CfgInitialize(&chiliRxIface, &RX_AXIW_ConfigTable[0]);
	// obtain the memory location for storing the settings of shared memory "fromfifo"
	XC_GetShmem(chiliRxIface, "rx_fifo", (void **) &chiliRxFromFifo);
#endif

#if defined (MCU_DRIVER)
    chili_init_done 	= (Xuint32 *) XPAR_MCU_AXIW_0_MEMMAP_INIT_DONE;
    chili_pa_en 		= (Xuint32 *) XPAR_MCU_AXIW_0_MEMMAP_PA_EN;
    chili_tr_sw 		= (Xuint32 *) XPAR_MCU_AXIW_0_MEMMAP_TR_SW;
    chili_mcu_reset 	= (Xuint32 *) XPAR_MCU_AXIW_0_MEMMAP_MCU_RESET;
    chili_rx_en 		= (Xuint32 *) XPAR_MCU_AXIW_0_MEMMAP_RX_EN;
    chili_tx_en 		= (Xuint32 *) XPAR_MCU_AXIW_0_MEMMAP_TX_EN;
#endif
#if defined (DAC_DRIVER)
    dac_en 				= (Xuint32 *) (0x69800000 + 0x800);
#endif
#if defined (RX_DRIVER)
    chili_num_bytes_ready 	= (Xuint32 *) XPAR_RX_AXIW_0_MEMMAP_NUM_BYTES_READY;
    chili_mcu_rx_ready 		= (Xuint32 *) XPAR_RX_AXIW_0_MEMMAP_MCU_RX_READY;
    chili_percent_full 		= (Xuint32 *) XPAR_RX_AXIW_0_MEMMAP_RX_FIFO_PERCENTFULL;
#endif
#if defined (DC_OFFSET)
    chili_rssi 				= (Xuint32 *) XPAR_RX_AXIW_0_MEMMAP_RSSI; // read
    chili_dir 				= (Xuint32 *) XPAR_RX_AXIW_0_MEMMAP_DIR; // read
    chili_rssi_high_goal 	= (Xuint32 *) XPAR_RX_AXIW_0_MEMMAP_RSSI_HIGH_GOAL; // write
    chili_rssi_low_goal 	= (Xuint32 *) XPAR_RX_AXIW_0_MEMMAP_RSSI_LOW_GOAL; // write
    chili_agc_en 			= (Xuint32 *) XPAR_RX_AXIW_0_MEMMAP_AGC_EN; // write
    rx_en 					= (Xuint32 *) XPAR_RX_AXIW_0_MEMMAP_RX_EN; // write
#endif
#if defined (TX_DRIVER)
    clear_fifo = (Xuint32 *)(0x70e00000 + 0x804);
    tx_en = (Xuint32 *)(0x70e00000 + 0x800);
    tx_done = (Xuint32 *)(0x70e00000 + 0x800);
    tx_fifo = (Xuint32 *)(0x70e00000 + 0x400);
#endif
    // initialize rx driver
    *chili_mcu_rx_ready = 1;
    *chili_mcu_rx_ready = 0;
    *chili_mcu_rx_ready = 1;
#ifdef DC_OFFSET
    // initialize values for the DC offset/AGC core
    *chili_rssi_high_goal = (Xuint32)(1010*1010*2);
    *chili_rssi_low_goal = (Xuint32)(990*990*2);
    *chili_agc_en = 0;
#endif
    // by default we enable Tx/Rx. User can disable later if they want
    Chilipepper_TxEnable( 1 );
    Chilipepper_RxEnable( 1 );
    // disable data going to DAC prior to reset
#if defined (DAC_DRIVER)
    *dac_en = 0;
#endif
    Chilipepper_Reset();
    // go ahead and reenable DAC
#if defined (DAC_DRIVER)
    *dac_en = 1;
#endif

	return 0;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// Check to see if onboard calibration has finished
/////////////////////////////////////////////////////////////////////////////////////////////
int Chilipepper_InitDone( void )
{
	int done;
	done = *chili_init_done;
	return done;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// reset the board
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_Reset( void )
{
    // reset Chilipepper
	*chili_mcu_reset = 1;
	*chili_mcu_reset = 0;
	*chili_mcu_reset = 1;
    // don't continue until we get a valid init back from Chilipepper.
    while(Chilipepper_InitDone()==0)
        ;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// set the transmit/receive switch
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_SetTxRxSw( int zeroTxOneRx )
{
	// 0- transmit, 1-receive - defaults to Rx if input not zero
	if (zeroTxOneRx==0)
	    *chili_tr_sw = 0; // Tx
	else
	    *chili_tr_sw = 1; // Rx
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// enable or disable the Tx PA
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_SetPA(int onOff)
{
	// if not 1 then some other value so for safety disable PA
	if (onOff==1)
	    *chili_pa_en = 1; // active high
	else
	    *chili_pa_en = 0; // active high
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// enable or disable the Tx portion of the transceiver
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_TxEnable(int onOff)
{
	if (onOff==1)
	    *chili_tx_en = 1; // active high
	else
	    *chili_tx_en = 0; // active high
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// enable or disable the Rx portion of the transceiver
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_RxEnable(int onOff)
{
	if (onOff==1){
	    *chili_rx_en = 1; // active high (enable rx in MCU)
		*rx_en = 1;       // active high (enable rx in DC_OFFSET)
	}
	else{
	    *chili_rx_en = 0; // active high (disable rx in MCU)
		*rx_en = 0;		  // active high (disable rx in DC_OFFSET)
	}
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// read RSSI off the hardware core
/////////////////////////////////////////////////////////////////////////////////////////////
int Chilipepper_ReadRssi( void )
{
	Xuint32 rssiValue;

	rssiValue = *chili_rssi;

	return (int)rssiValue;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// turn Chilipeppers onboard LED on/off
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_SetLed( int onOff )
{
	SendBuffer[0] = 0xFF;
	SendBuffer[1] = 0x00;
	SendBuffer[2] = onOff;
	SendBuffer[3] = 0xFE;

	Chilipepper_SetRegister();
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// control the AGC
/////////////////////////////////////////////////////////////////////////////////////////////
int Chilipepper_ControlAgc( void )
{
	static int gain = 14;
	//int rssi
	int dir;

	//rssi = *chili_rssi;
	dir = *chili_dir;
	// just to be safe clear the agc en if we have no dir instruction
	if (dir == 0)
		*chili_agc_en = 0;
	if (dir == 1) // increase gain
	{
		gain += 1;
		if (gain > 56)
			gain = 56; // don't allow to grow beyond 60
		Chilipepper_SetRxGain( gain );
		*chili_agc_en = 1;
		*chili_agc_en = 0;
	}
	if (dir == 2) // decreases gain
	{
		gain -= 1;
		if (gain < 0)
			gain = 0; // don't allow to fall below 0
		Chilipepper_SetRxGain( gain );
		*chili_agc_en = 1;
		*chili_agc_en = 0;
	}
	//xil_printf("Dir %d, RSSI %d, Gain %d\r\n",dir,rssi,gain);
	return gain;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// Set the transmitter gain
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_SetTxGain( int dB )
{
	int lg;

	if (dB < 0)
		lg = 0;
	else if (dB > 25)
		lg = 25;
	else
		lg = dB;
	SendBuffer[0] = 0xFF;
	SendBuffer[1] = 0x01;
	SendBuffer[2] = (unsigned char)lg;
	SendBuffer[3] = 0xFE;

	Chilipepper_SetRegister();
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// control the AGC
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_SetRxGain( int dB )
{
	SendBuffer[0] = 0xFF;
	SendBuffer[1] = 0x02;
	SendBuffer[2] = (unsigned char)dB;
	SendBuffer[3] = 0xFE;

	Chilipepper_SetRegister();
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// generic function to send and check a packet
/////////////////////////////////////////////////////////////////////////////////////////////

void Chilipepper_SetRegister( void )
{
#ifdef MCU_UART
	int sentBytes, recvBytes, numTries, pass;
		int sentValue, recvValue;

		pass = 1;
		do
		{
			if (pass==0)
			{
				//xil_printf("error setting register\r\n");
				XUartLite_ResetFifos(&uartLite);
			}
			// use the do/while loop to make sure we send all four bytes
			sentBytes = 0; numTries = 0;
			do
			{
				sentBytes += XUartLite_Send(&uartLite, &(SendBuffer[sentBytes]), 4);
				numTries++;
			}
			while (sentBytes != 4 && numTries < 1000000);
			if (sentBytes != 4)
				pass = 0;

			// make sure we get back the same thing we sent
			recvBytes = 0; numTries = 0;
			do
			{
				recvBytes += XUartLite_Recv(&uartLite, &(RecvBuffer[recvBytes]), 4);
				numTries++;
			}
			while (recvBytes != 4 && numTries < 1000000);

			if (recvBytes != 4)
				pass = 0;

			sentValue = SendBuffer[2];
			recvValue = RecvBuffer[2];
			if (sentValue != recvValue)
				pass = 0;
			if (sentValue == recvValue && sentBytes == 4 && recvBytes == 4)
				pass = 1;
		}
		while (pass==0);
#endif
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// Write packet to FIFO
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_WriteAckPacket( unsigned char *txBuf, unsigned char id )
{
	txBuf[4] = id; // payload
	Chilipepper_WritePacket( txBuf, 1, 0 );
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// Write packet to FIFO
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_WritePacket( unsigned char *txBuf, int numPayloadBytes, unsigned char packetID )
{
    int count;

    *rx_en = 0;
	Chilipepper_SetTxRxSw( 0 ); // 0- transmit, 1-receive
	Chilipepper_FlushRxFifo();

	// 1.) set tx_en low, 2.) toggle clear_fifo, 3.) fill FIFO,
    // 4.) set tx_en high, 5.) wait for tx_done to go high
    *tx_en = 0;
    *clear_fifo = 0;
    *clear_fifo = 1;
    *clear_fifo = 0;
    txBuf[0] = numPayloadBytes%256;
    txBuf[1] = (numPayloadBytes>>8)%256;
    txBuf[2] = (numPayloadBytes>>16)%256;
    txBuf[3] = packetID;
    Chilipepper_AppendCrc( txBuf, 4+numPayloadBytes );
    for( count=0; count<(numPayloadBytes+6); count++)
    {
        *tx_fifo = txBuf[count];
    }
    *tx_fifo = 55; // help with SRRC filtering at end
    *tx_fifo = 66; // help with SRRC filtering at end
    *tx_fifo = 77; // help with SRRC filtering at end

    *tx_en = 1;

    while (*tx_done == 0)
        ;
    // go back to receive
    *rx_en = 1;
    Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// Write test "hello world!" packet to FIFO
/////////////////////////////////////////////////////////////////////////////////////////////
int Chilipepper_WritePacketWithAck(  unsigned char *txBuf, int numPayloadBytes, unsigned char *rxBuf )
{
	int success, numSendTries, numRecvTries;
	unsigned char id;
	static unsigned char count = 1; // packet ID is a sequential counter, *not* equal to 0 which is ACK
	unsigned char retValue;
	int numBytes;

    success = 0;
    numSendTries = 0;
	do
	{
        // transmit a packet with the count index
		// count becomes the ID
		Chilipepper_WritePacket( txBuf, numPayloadBytes, count );

        // try to receive an ACK with the same count index
	    numRecvTries = 0;
		do
		{
			numBytes = Chilipepper_ReadPacket( rxBuf, &id );

            if (numBytes > 0)
            {
            	// id is zero for an ACK and first byte is previous id/count
            	retValue = rxBuf[4]; // first payload byte
                if ( (id == 0) && (retValue == count) )
                {
                    success = 1;
                    break; //we received the correct ACK
                }
            }

            numRecvTries += 1;
		}
        while (numRecvTries<1000000);

        if (success == 1)
            break; // Tx/ACK went ok

		numSendTries += 1;
	}
	while (numSendTries<10);

	count += 1;
	if (count >= 255)
		count = 1;

	return success;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// Write test "hello world!" packet to FIFO
/////////////////////////////////////////////////////////////////////////////////////////////
int Chilipepper_WriteTestPacketWithAck( unsigned char *rxBuf )
{
	int success, numSendTries, numRecvTries;
	unsigned char id;
	static unsigned char count = 1; // packet ID is a sequential counter, *not* equal to 0 which is ACK
	unsigned char retValue;
	int numBytes;

    success = 0;
    numSendTries = 0;
	do
	{
        // transmit a packet with the count index
		// count becomes the ID
		Chilipepper_WriteTestPacket( count );

        // try to receive an ACK with the same count index
	    numRecvTries = 0;
		do
		{
			numBytes = Chilipepper_ReadPacket( rxBuf, &id );

            if (numBytes > 0)
            {
            	// id is zero for an ACK and first byte is previous id/count
            	retValue = rxBuf[4]; // first payload byte
                if ( (id == 0) && (retValue == count) )
                {
                    success = 1;
                    break; //we received the correct ACK
                }
            }

            numRecvTries += 1;
		}
        while (numRecvTries<1000000);

        if (success == 1)
            break; // Tx/ACK went ok

		numSendTries += 1;
	}
	while (numSendTries<10);

	count += 1;
	if (count >= 255)
		count = 1;

	return success;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// Write test "hello world!" packet to FIFO
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_WriteTestPacket( unsigned char count )
{
	unsigned char testBuf[18];
	int i1;

    *rx_en = 0;
	Chilipepper_SetTxRxSw( 0 ); // 0- transmit, 1-receive
	Chilipepper_FlushRxFifo();

    // 1.) set tx_en low, 2.) toggle clear_fifo, 3.) fill FIFO,
    // 4.) set tx_en high, 5.) wait for tx_done to go high
    *tx_en = 0;
    *clear_fifo = 0;
    *clear_fifo = 1;
    *clear_fifo = 0;

	// first three bytes are number of bytes to write to FIFO
    testBuf[0] = 12;
    testBuf[1] = 0;
    testBuf[2] = 0;
    testBuf[3] = count;
    testBuf[4] = 104;
    testBuf[5] = 101;
    testBuf[6] = 108;
    testBuf[7] = 108;
    testBuf[8] = 111;
    testBuf[9] = 32;
    testBuf[10] = 119;
    testBuf[11] = 111;
    testBuf[12] = 114;
    testBuf[13] = 108;
    testBuf[14] = 100;
    testBuf[15] = 33;

    Chilipepper_AppendCrc( testBuf, 16 );
    for (i1=0; i1<18; i1++)
    	*tx_fifo = testBuf[i1];
    *tx_fifo = 55; // help with SRRC filtering at end
    *tx_fifo = 66; // help with SRRC filtering at end
    *tx_fifo = 77; // help with SRRC filtering at end

    *tx_en = 1;

    while (*tx_done == 0)
        ;
    // go back to receive mode
    Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive
    *rx_en = 1;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// pull a packet off the receive FIFO
// #1 This begins by indicating that we are ready to receive a packet
/////////////////////////////////////////////////////////////////////////////////////////////
int Chilipepper_ReadPacket( unsigned char *rxBuf, unsigned char *id )
{
#ifdef RX_DRIVER
	int numBytes, i1;
		u32 value;
		int numBytesReady;
		int retValue;

		// put transceiver in receive mode
	    Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive
	    *rx_en = 1;
	    *chili_mcu_rx_ready = 1;

	    numBytesReady = *chili_num_bytes_ready;

	    if (numBytesReady == 0)
	    	return -1;

		// read the bytes and the CRC
	    for (i1=0; i1<numBytesReady; i1++)
	    {
			XC_Read(chiliRxIface, chiliRxFromFifo->dout, &value);
			rxBuf[i1] = value;
	    }
		*id = rxBuf[3];
		 numBytes = rxBuf[0];

		Chilipepper_FlushRxFifo();

		if (Chilipepper_CheckCrc( rxBuf, numBytes+6 ) != 0)
			retValue = -5;
		else
			retValue = numBytes;

		// go ahead and queue up for new packet
		*chili_mcu_rx_ready = 0;
		*chili_mcu_rx_ready = 1;

		return retValue;
#endif
	return 0;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// FlushRxFifo
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_FlushRxFifo( void )
{
#ifdef RX_DRIVER
	u32 empty, value;

		// flush the read FIFO
		while(1)
		{
			XC_Read(chiliRxIface, chiliRxFromFifo->empty, &empty);
			if (empty == 1)
				break;
			XC_Read(chiliRxIface, chiliRxFromFifo->dout, &value);
		}
#endif
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// Check the CRC of the received packet
/////////////////////////////////////////////////////////////////////////////////////////////
int Chilipepper_CheckCrc( unsigned char *rxBuf, int numBytes )
{
    unsigned short valueCRC, genPoly; // 16-bits
    unsigned short p, b, top;
    unsigned long valueCRCsh1, valueCRCadd1; // 32-bits
    unsigned char cv, d;
    int i1, i2;

    valueCRC = 65535;
    genPoly = 4129;
    for (i1=0; i1<numBytes; i1++) // add header and CRC
    {
    	cv = rxBuf[i1];
        for (i2=0; i2<8; i2++)
        {
            p = pow(2,7-i2);
            d = cv/p;
            b = d%2; // mod of message
            valueCRCsh1 = valueCRC<<1; // shift left
            valueCRCadd1 = valueCRCsh1|b; // bit or
            top = valueCRCadd1/pow(2,16);
            if ( top== 1)
            {
                valueCRC = valueCRCadd1^genPoly; // bit xor
            }
            else
            {
                valueCRC = valueCRCadd1;
            }
            valueCRC = valueCRC%65535;
        }
    }
    return valueCRC;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// Check the CRC of the received packet
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_AppendCrc( unsigned char *buf, int msgLength )
{
    unsigned short valueCRC, genPoly; // 16-bits
    unsigned short p, b, top;
    unsigned long valueCRCsh1, valueCRCadd1; // 32-bits
    int i1, i2;
    unsigned char msb, lsb;
    unsigned char cv, d;

    valueCRC = 65535;
    genPoly = 4129;
    for (i1=0; i1<(msgLength+2); i1++) // add header and CRC
    {
        cv = buf[i1];
        for (i2=0; i2<8; i2++)
        {
            p = pow(2,7-i2);
            if (i1<msgLength)
            {
            	d = cv/p;
            	b = d%2; // mod of message
            }
            else
            	b = 0;
            valueCRCsh1 = valueCRC<<1; // shift left
            valueCRCadd1 = valueCRCsh1|b; // bit or
            top = valueCRCadd1/pow(2,16);
            if ( top == 1)
            {
                valueCRC = valueCRCadd1^genPoly; // bit xor
            }
            else
            {
                valueCRC = valueCRCadd1;
            }
            valueCRC = valueCRC%65535;
        }
    }
    msb = valueCRC>>8;
    lsb = valueCRC%256;
    buf[msgLength] = msb;
    buf[msgLength+1] = lsb;
}
/////////////////////////////////////////////////////////////////////////////////////////////
