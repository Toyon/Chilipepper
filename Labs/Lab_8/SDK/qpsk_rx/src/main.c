#include <stdio.h>
#include "platform.h"
#include "chilipepper.h"
#include "xuartps.h"

XUartPs uartPs;
XUartPs_Config *pUartPsConfig;

int SetupPeripherals( void );

int main()
{
	int sentCount;
	int numBytes;
    unsigned char id;
    unsigned char curValue;
    unsigned char rxBuf[256];

    init_platform();
    if(SetupPeripherals() != XST_SUCCESS)
    	return -1;

    if ( Chilipepper_Initialize() != 0 )
    	return -1;

    Chilipepper_SetPA( 0 );
    Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive

    while (1)
    {
    	Chilipepper_ControlAgc(); //update the Chilipepper AGC
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
		}
    }
    cleanup_platform();
    return 0;
}

int SetupPeripherals( void )
{
	int status;

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
