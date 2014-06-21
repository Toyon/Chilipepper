#include <stdio.h>
#include "platform.h"
#include "xgpio.h"
#include "chilipepper.h"
#include "xuartps.h"

XGpio gpio_blinky;
XUartPs uartPs;
XUartPs_Config *pUartPsConfig;

int SetupPeripherals( void );

int main()
{
	int sentCount;
	int aliveLed = 0, statusLed = 0;
	int numBytes;
	int sw, i1;
	static int BlinkCount;
	int txCount = 0, txTryCount = 0;
	unsigned char numUartRead, curValue, id;
	unsigned char rxBuf[256], txBuf[256];

	init_platform();

	if(SetupPeripherals() != XST_SUCCESS)
		return -1;

	if ( Chilipepper_Initialize() != 0 )
		return -1;

	// by default we are in receive
	Chilipepper_SetPA( 1 );
	Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive
	Chilipepper_SetDCOC(1);		// enable dc offset correction

	// enable the Chilipepper LED to indicate we are operational
	Chilipepper_SetLed( 1 );

	Chilipepper_printf(&uartPs, "\r\n\r\nWelcome to Toyon's Chilipepper QPSK demo. This demo was written in MATLAB using Mathworks HDL Coder.\r\n\r\n");

	while (1)
	{
		Chilipepper_ControlAgc();
		// main priority is to parse OTA packets
		numBytes = Chilipepper_ReadPacket( rxBuf, &id );

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
			statusLed = ~statusLed;
			XGpio_DiscreteWrite(&gpio_blinky, 1, statusLed);
		}

		// flip the LED1 so the user knows the processor is alive
		BlinkCount += 1;
		if (BlinkCount > 200000)
		{
			aliveLed = ~aliveLed;
			BlinkCount = 1;
			XGpio_DiscreteWrite(&gpio_blinky, 2, aliveLed);
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
