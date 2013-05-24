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

XGpio gpio_blinky;
XUartPs uartPs;
XUartPs_Config *pUartPsConfig;

int DebouncButton( void );
int SetupPeripherals( void );
void WriteLedGain( int gain );

int main()
{
	int gain;
    int aliveLed = 0;
	int sentCount;
	int numBytes;
    static int BlinkCount = 0;
    unsigned char id;
    unsigned char curValue;
    unsigned char rxBuf[256];

    init_platform();
    if(SetupPeripherals() != XST_SUCCESS)
    	return -1;

    if ( Chilipepper_Initialize() != 0 )
    	return -1;

    Chilipepper_SetPA( 1 );
    Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive

    while (1)
    {
    	gain = Chilipepper_ControlAgc(); //update the Chilipepper AGC
		// main priority is to parse OTA packets
		numBytes = Chilipepper_ReadPacket( rxBuf, &id );

		if (numBytes > 0)
			XGpio_DiscreteWrite(&gpio_blinky, 1, 1);

		// This is a normal receive situation.
		// We get a packet, write it to UART.
		if (numBytes > 0)
		{
			sentCount = 0;
			while (sentCount < numBytes)
			{
				curValue = rxBuf[sentCount+4];
				sentCount += XUartPs_Send(&uartPs, &curValue, 1);
			}
		}

		// flip the LED1 so the user knows the processor is alive
	   if (BlinkCount > 500000)
	   {
		 if (aliveLed == 0)
			aliveLed = 1;
		 else
			aliveLed = 0;
		 BlinkCount = 1;
		 XGpio_DiscreteWrite(&gpio_blinky, 2, aliveLed);  //blink LED
	   }
    }
    cleanup_platform();
    return 0;
}

int SetupPeripherals( void )
{
	int status;

    XGpio_Initialize(&gpio_blinky, XPAR_AXI_GPIO_LED_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_blinky, 2, 0);
    XGpio_SetDataDirection(&gpio_blinky, 1, 0);
	XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
	XGpio_DiscreteWrite(&gpio_blinky, 2, 0);

	//Setup UART for serial port communication
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
