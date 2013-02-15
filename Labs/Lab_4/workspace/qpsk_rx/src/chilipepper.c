#include "chilipepper.h"
#include "xuartlite.h"
//#include "rx_axiw.h"
//#include "qpsk_tx_axiw.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xil_printf.h"
#include "xbasic_types.h"
#include <math.h>

#define TARGET_RSSI 800
#define TARGET_RSSI_MARGIN 50

XUartLite uartLite;
unsigned char SendBuffer[4];	/* Buffer for Transmitting Data */
//unsigned char RecvBuffer[4];	/* Buffer for Receiving Data */

//xc_iface_t *chiliRxIface;
//xc_from_fifo_t *chiliRxFromFifo;

// mcu registers
Xuint32 *chili_init_done, *chili_pa_en, *chili_tr_sw, *chili_mcu_reset, *chili_rx_en, *chili_tx_en;
// DAC registers
Xuint32 *dac_en;
// tx registers
Xuint32 *clear_fifo, *tx_en, *tx_done, *tx_fifo;

/////////////////////////////////////////////////////////////////////////////////////////////
// Initialize
/////////////////////////////////////////////////////////////////////////////////////////////
int Chilipepper_Initialize( void )
{

// MCU core
	chili_init_done = (Xuint32 *)(0x61600000 + 0x800);
	chili_pa_en = (Xuint32 *)(0x61600000 + 0x800);
	chili_tr_sw = (Xuint32 *)(0x61600000 + 0x804);
	chili_mcu_reset = (Xuint32 *)(0x61600000 + 0x808);
	chili_rx_en = (Xuint32 *)(0x61600000 + 0x80C);
	chili_tx_en = (Xuint32 *)(0x61600000 + 0x810);

	    // enable Tr/Rx cores in the RFIC
	    *chili_rx_en = 1;
	    *chili_tx_en = 1;

	    // toggle reset on MCU - active low
	    *chili_mcu_reset = 1;
	    *chili_mcu_reset = 0;
	    *chili_mcu_reset = 1;

	    // wait for the MCU to finish calibration
	    while(*chili_init_done == 0)
	    	;

	    // put RF front-end in state for receive
	    *chili_pa_en = 0; // active high
	    *chili_tr_sw = 1; // 0- transmit, 1-receive

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
	if (onOff==1)
	    *chili_rx_en = 1; // active high
	else
	    *chili_rx_en = 0; // active high

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

	Chilipepper_SetTxRxSw( 0 ); // 0- transmit, 1-receive

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
    Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// Write test "hello world!" packet to FIFO
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_WriteTestPacket( unsigned char count )
{
	unsigned char testBuf[18];
	int i1;

	Chilipepper_SetTxRxSw( 0 ); // 0- transmit, 1-receive

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
