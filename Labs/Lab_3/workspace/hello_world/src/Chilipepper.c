//#include "xuartlite.h"
//#include "rx_axiw.h"
//#include "tx_axiw.h"
#include "xbasic_types.h"
#include "chilipepper.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xil_printf.h"

// mcu registers
	Xuint32 *chili_init_done, *chili_pa_en, *chili_tr_sw, *chili_mcu_reset, *chili_rx_en, *chili_tx_en;
// DAC registers
	Xuint32 *dac_en;
// tx registers
	Xuint32 *clear_fifo, *tx_en, *tx_done, *tx_fifo;

int Chilipepper_Initialize( void )
{

// MCU core
	chili_init_done = (Xuint32 *)(0x61600000 + 0x800);
	chili_pa_en = (Xuint32 *)(0x61600000 + 0x800);
	chili_tr_sw = (Xuint32 *)(0x61600000 + 0x804);
	chili_mcu_reset = (Xuint32 *)(0x61600000 + 0x808);
	chili_rx_en = (Xuint32 *)(0x61600000 + 0x80C);
	chili_tx_en = (Xuint32 *)(0x61600000 + 0x810);
// DAC core
	dac_en = (Xuint32 *)(0x69800000 + 0x800);
// tx core
	tx_done = (Xuint32 *)(0x70e00000 + 0x800);
	tx_en = (Xuint32 *)(0x70e00000 + 0x800);
	clear_fifo = (Xuint32 *)(0x70e00000 + 0x804);
	tx_fifo = (Xuint32 *)(0x70e00000 + 0x400);

	  // disable data going to DAC and tx
	    *dac_en = 0;

	    // put RF front-end in state for transmit
	    *chili_pa_en = 1; // active high
	    *chili_tr_sw = 0; // 0- transmit, 1-receive

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

	    // after MCU finished enable the DACs and tx
	    *dac_en = 1;

	return 0;
}

void Chilipepper_WriteTestPacket( unsigned char count )
{
	char message[] = "Trust in me, I won't lead you astray...";
	int msglen = strlen(message);
	unsigned char testBuf[msglen + 10];
	//unsigned char testBuf[18];
	int i1;
	int j1;

    //*rx_en = 0;
	//Chilipepper_SetTxRxSw( 0 ); // 0- transmit, 1-receive
	//Chilipepper_FlushRxFifo();

    // 1.) set tx_en low, 2.) toggle clear_fifo, 3.) fill FIFO,
    // 4.) set tx_en high, 5.) wait for tx_done to go high
    *tx_en = 0;
    *clear_fifo = 0;
    *clear_fifo = 1;
    *clear_fifo = 0;

	// first three bytes are number of bytes to write to FIFO
    testBuf[0] = msglen;
    testBuf[1] = 0;
    testBuf[2] = 0;
    testBuf[3] = count;
/*
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
*/
    for (i1=0; i1<msglen; i1++)
		testBuf[i1+4] = message[i1];

    Chilipepper_AppendCrc( testBuf, (msglen+4) );

    for (i1=0; i1<(msglen+6); i1++)
    {
    	for (j1=0; j1<10; j1++)
    	{
    		if (j1 == 0)
    			*tx_fifo = testBuf[i1];
    	}
    }
    *tx_fifo = 55; // help with SRRC filtering at end
    *tx_fifo = 66; // help with SRRC filtering at end
    *tx_fifo = 77; // help with SRRC filtering at end

    *tx_en = 1;

    while (*tx_done == 0)
        ;
    // go back to receive mode
    //Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive
    //*rx_en = 1;
}

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
