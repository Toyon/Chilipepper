#include <stdio.h>
#include "platform.h"
#include "xbasic_types.h"
#include "xgpio.h"
#include "xparameters.h"
#include "xstatus.h"
#include "chilipepper.h"
#include "xuartps.h"
#include "xil_printf.h"
#include "xscugic.h"
#include "xil_exception.h"

XGpio gpio_blinky, gpio_sw_test, gpio_btn, gpio_gain, gpio_sw_tx_pa;
XUartPs uartPs;
XUartPs_Config *pUartPsConfig;

int DebouncButton( void );
int SetupPeripherals( void );
void WriteLedGain( int gain );

int main()
{
	int sentCount;
	int aliveLed = 0;
	int numBytes;
	int currentGain;
	unsigned char id, prevId;
	int sw, i1;
    int success;
    int pa, prevPa;
	static int testBlinkCount;
	int txCount = 0, txTryCount = 0, txSuccess;
	unsigned char numUartRead, curValue;
	unsigned char rxBuf[256], txBuf[256];

    init_platform();

    if(SetupPeripherals() != XST_SUCCESS)
    	return -1;

	if ( Chilipepper_Initialize() != 0 )
		return -1;

	// by default we are in receive
	Chilipepper_SetPA( 1 );
	Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive

	// enable the Chilipepper LED to indicate we are operational
	Chilipepper_SetLed( 1 );


	xil_printf("\r\n\r\nWelcome to Toyon's Chilipepper QPSK demo. This demo was written in MATLAB using Mathworks HDL Coder.\r\n\r\n");
	//Chilipepper_SetRxGain( 20 );
	prevPa = 0;
	prevId = 0;
	//Chilipepper_Reset();
    while (1)
    {
		currentGain = Chilipepper_ControlAgc();
    	WriteLedGain( currentGain );
    	pa = XGpio_DiscreteRead(&gpio_sw_tx_pa, 1);
    	if (pa != prevPa)
    		Chilipepper_SetTxGain( pa );
    	prevPa = pa;
        sw = XGpio_DiscreteRead(&gpio_sw_test, 1);
    	switch (sw)
    	{
    	case 0: // normal operation
    		// during normal operation adjust the AGC

        	// main priority is to parse OTA packets
    		numBytes = Chilipepper_ReadPacket( rxBuf, &id );

    		if (numBytes > 0)
    			XGpio_DiscreteWrite(&gpio_blinky, 1, 1);

    		// if ID is zero then this is an ACK - should never see this here
    		// if ID is not zero we need to send a packet back with the payload being the ID

    		// Here we've received the same packet as last time. This means the sender must not
    		// have gotten the ACK we sent. So, let's just send the ACK again, but don't write to UART.
    		if (id != 0 && numBytes > 0 && id == prevId)
			{
				// received the same packet again so transmitter must not have gotten ACK
				Chilipepper_WriteAckPacket( txBuf, id );
    			XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
			}
    		// This is a normal receive situation. We get a packet, write it to UART, and send ACK
    		else if ( id != 0 && numBytes > 0)
    		{
                // first thing we need to do if ID is not zero is send back ACK with payload
                // being id
                Chilipepper_WriteAckPacket( txBuf, id );

    			sentCount = 0;
    			while (sentCount < numBytes)
    			{
    				curValue = rxBuf[sentCount+4];
    				sentCount += XUartPs_Send(&uartPs, &curValue, 1);
    			}

    			prevId = id;
    			XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
    		}

			// now that we've gotten the radio stuff out of the way, let's parse things coming over the UART
    		do
    		{
    			numUartRead = XUartPs_Recv(&uartPs, &txBuf[txCount+4], 1);
				if (numUartRead == 1)
					txCount++;
    		} while(numUartRead == 1);

			// only attempt to send something if we have something to send
			if (txCount > 0)
			{
    			XGpio_DiscreteWrite(&gpio_blinky, 1, 1);
				if (txCount >= 10 || txTryCount > 100000)
				{
					txSuccess = Chilipepper_WritePacketWithAck( txBuf, txCount, rxBuf );
					if (txSuccess == 1)
					{
		    			XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
					}
	    			txCount = 0;
	    			txTryCount = 0;
				}
			}
			txTryCount++;
	    	// flip the LED1 so the user knows the processor is alive
			testBlinkCount += 1;
	    	if (testBlinkCount > 100000)
	    	{
	    		if (aliveLed == 0)
	    			aliveLed = 1;
	    		else
	    			aliveLed = 0;
	    		testBlinkCount = 1;
	    		XGpio_DiscreteWrite(&gpio_blinky, 2, aliveLed);
	    	}
    		break;
    	case 1: // continuously send out packets
    		// do it once and then stall for a bit
    		for (i1=0; i1<5000; i1++)
    		{
    			if (i1 == 0)
    			{
    				XGpio_DiscreteWrite(&gpio_blinky, 1, 1);
    				Chilipepper_WriteTestPacket( 1 );
    				XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
    			}
    		}
        	// flip the LED1 so the user knows the processor is alive
    		testBlinkCount += 1;
        	if (testBlinkCount > 2000)
        	{
        		if (aliveLed == 0)
        			aliveLed = 1;
        		else
        			aliveLed = 0;
        		testBlinkCount = 1;
        		XGpio_DiscreteWrite(&gpio_blinky, 2, aliveLed);
        	}
    		break;
    	case 2: // initiate packet transmission with a button press
        	// flip the LED1 so the user knows the processor is alive
    		testBlinkCount += 1;
        	if (testBlinkCount > 200000)
        	{
        		if (aliveLed == 0)
        			aliveLed = 1;
        		else
        			aliveLed = 0;
        		testBlinkCount = 1;
        		XGpio_DiscreteWrite(&gpio_blinky, 2, aliveLed);
        	}

        	if (DebouncButton() == 0)
    			break;

			XGpio_DiscreteWrite(&gpio_blinky, 1, 1);
        	success = Chilipepper_WriteTestPacketWithAck( rxBuf );
        	if (success == 1)
				XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
        	else
        	{
        		Chilipepper_Reset();
        	}
    		break;
    	default:
    		break;
    	}

    }
    cleanup_platform();

    return 0;
}

void WriteLedGain( int gain )
{
	int gainFloor;

	gainFloor = gain/10;
	switch (gainFloor)
	{
	case 0:
		XGpio_DiscreteWrite(&gpio_gain, 1, 1);
		break;
	case 1:
		XGpio_DiscreteWrite(&gpio_gain, 1, 1+2);
		break;
	case 2:
		XGpio_DiscreteWrite(&gpio_gain, 1, 1+2+4);
		break;
	case 3:
		XGpio_DiscreteWrite(&gpio_gain, 1, 1+2+4+8);
		break;
	case 4:
		XGpio_DiscreteWrite(&gpio_gain, 1, 1+2+4+8+16);
		break;
	case 5:
		XGpio_DiscreteWrite(&gpio_gain, 1, 1+2+4+8+32);
		break;
	default:
		XGpio_DiscreteWrite(&gpio_gain, 1, 0);
		break;
	}
}

int DebouncButton( void )
{
    int btn;
    static int hitZero=0;
    static int btnIntegrator=0;

    btn = XGpio_DiscreteRead(&gpio_btn, 1);

    // decrement and keep track if we've touched zero
    if ( btn==0 )
    {
    	if (btnIntegrator > 0)
    		btnIntegrator -= 1;
    	if (btnIntegrator == 0)
    		hitZero = 1;
    	return 0;
    }
    if (btnIntegrator < 1000)
    	btnIntegrator += 1;

    if (btnIntegrator < 1000)
    	return 0;

    if (hitZero == 0)
    	return 0;

    // we've hit 1000 so now we know we need to hit zero again
    hitZero = 0;

    return 1;
}

int SetupPeripherals( void )
{
	int status;

    XGpio_Initialize(&gpio_blinky, XPAR_AXI_GPIO_LED_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_blinky, 2, 0);
    XGpio_SetDataDirection(&gpio_blinky, 1, 0);
	XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
	XGpio_DiscreteWrite(&gpio_blinky, 2, 0);

    XGpio_Initialize(&gpio_gain, XPAR_AXI_GPIO_GAIN_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_gain, 1, 0); // out

    XGpio_Initialize(&gpio_sw_test, XPAR_AXI_GPIO_SWITCH_TEST_MODES_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_sw_test, 1, 3);

    XGpio_Initialize(&gpio_sw_tx_pa, XPAR_AXI_GPIO_PA_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_sw_tx_pa, 1, 1+2+4+8+16);

    XGpio_Initialize(&gpio_btn, XPAR_AXI_GPIO_BUTTON_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_btn, 1, 1);

    pUartPsConfig = XUartPs_LookupConfig(XPAR_PS7_UART_1_DEVICE_ID);
	if (NULL == pUartPsConfig) {
		return XST_FAILURE;
	}
	status = XUartPs_CfgInitialize(&uartPs, pUartPsConfig, pUartPsConfig->BaseAddress);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	XUartPs_SetBaudRate(&uartPs, 115200);

	return XST_SUCCESS;
}






