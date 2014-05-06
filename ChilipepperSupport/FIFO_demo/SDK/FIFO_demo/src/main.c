#include <stdio.h>
#include "platform.h"
#include "xil_types.h"
#include "xparameters.h"
#include "xstatus.h"
#include "chilipepper.h"
#include "xil_printf.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xuartps.h"

#define TX 0
#define RX 1

XUartPs uartPs;
XUartPs_Config *pUartPsConfig;

u8 txFIFOBuf[30];
u8 rxFIFOBuf[30];
u8 bytesAvail[2];
int NumInputBytes;
int i1;
u32 value;

extern u32 tx_fifo_byte_in;
extern u32 tx_fifo_store_byte;
extern u32 tx_fifo_byte_received;

extern u32 rx_fifo_get_byte;
extern u32 rx_fifo_byte_ready;
extern u32 rx_fifo_dout;

extern u32 tx_fifo_get_byte;
extern u32 rx_fifo_store_byte;
extern u32 tx_fifo_empty;
extern u32 rx_fifo_empty;

extern u32 tx_fifo_bytes_available;
extern u32 rx_fifo_reset_fifo;
extern u32 tx_fifo_reset_fifo;
extern u32 rx_fifo_bytes_available;

extern u32 tx_fifo_enable;

u32 testval;

int SetupPeripherals(void);

int main() {
	init_platform();

	if (SetupPeripherals() != XST_SUCCESS)
		return -1;

	if (Chilipepper_Initialize() != 0)
		return -1;

	while (1){

		clear_uart_buffer(&uartPs);
		clear_uart_buffer(&uartPs);

		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n\r\nWelcome to Toyon's ChiliPepper FIFO Demo\r\n\r\n");


		//TX Init
		Xil_Out32(tx_fifo_store_byte, (u32) 0);
		Xil_Out32(tx_fifo_get_byte, (u32) 0);
		Xil_Out32(tx_fifo_reset_fifo, (u32) 1);

		//RX Init
		Xil_Out32(rx_fifo_store_byte, (u32) 0);
		Xil_Out32(rx_fifo_get_byte, (u32) 0);
		Xil_Out32(rx_fifo_reset_fifo, (u32) 1);

		Chilipepper_Delay();

		Xil_Out32(tx_fifo_reset_fifo, (u32) 0);
		Xil_Out32(rx_fifo_reset_fifo, (u32) 0);

		NumInputBytes = Chilipepper_cin(&uartPs,txFIFOBuf);
		//NumInputBytes = scanf("%s",)
		Chilipepper_printf(&uartPs,	(unsigned char *)"\r\n");

		///////////////////////////////////////////////////////////////////////////////////
		// send Bytes to TX_FIFO
		for (i1=0; i1<NumInputBytes-1; i1++){
			value = txFIFOBuf[i1];
			Xil_Out32(tx_fifo_byte_in, value);
			Xil_Out32(tx_fifo_store_byte, (u32) 1);
			Xil_Out32(tx_fifo_store_byte, (u32) 0);
		}
		///////////////////////////////////////////////////////////////////////////////////
		// verify bytes sent
		sprintf(bytesAvail, "%u", Xil_In32(tx_fifo_bytes_available));
		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n\r\nSeccesfully put ");
		Chilipepper_printf(&uartPs, bytesAvail);
		Chilipepper_printf(&uartPs,
				(unsigned char *)" bytes into the tx_fifo\r\n\r\n");

		///////////////////////////////////////////////////////////////////////////////////
		// transfer to other FIFO
		while (Xil_In32(tx_fifo_empty) == 0){
			Chilipepper_Delay();
			Xil_Out32(tx_fifo_get_byte, (u32) 1);
			Chilipepper_Delay();
			Xil_Out32(tx_fifo_get_byte, (u32) 0);
			Chilipepper_Delay();
			Xil_Out32(rx_fifo_store_byte, (u32) 1);
			Chilipepper_Delay();
			Xil_Out32(rx_fifo_store_byte, (u32) 0);
		};
		///////////////////////////////////////////////////////////////////////////////////
		// verify bytes received
		sprintf(bytesAvail, "%u", Xil_In32(rx_fifo_bytes_available));
		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n\r\nSeccesfully put ");
		Chilipepper_printf(&uartPs, bytesAvail);
		Chilipepper_printf(&uartPs,
				(unsigned char *)" bytes into the rx_fifo\r\n\r\n");
		///////////////////////////////////////////////////////////////////////////////////
		// get Bytes from RX_FIFO
		int numBytesRecvd = Xil_In32(rx_fifo_bytes_available);
		for (i1=0; i1<numBytesRecvd; i1++){
			Chilipepper_Delay();
			Xil_Out32(rx_fifo_get_byte, (u32) 1);
			Chilipepper_Delay();
			Xil_Out32(rx_fifo_get_byte, (u32) 0);
			Chilipepper_Delay();
			value = Xil_In32(rx_fifo_dout);
			Chilipepper_Delay();
			rxFIFOBuf[i1] = value;
		}
		XUartPs_Send(&uartPs, rxFIFOBuf, numBytesRecvd);
		Chilipepper_printf(&uartPs,	(unsigned char *)"\r\n");
	}


	cleanup_platform();

	return 0;

}

int SetupPeripherals(void) {
	int status;

	pUartPsConfig = XUartPs_LookupConfig(XPAR_PS7_UART_1_DEVICE_ID);
	if (NULL == pUartPsConfig) {
		return XST_FAILURE;
	}
	status = XUartPs_CfgInitialize(&uartPs, pUartPsConfig,
			pUartPsConfig->BaseAddress);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	XUartPs_SetBaudRate(&uartPs, 115200);

	return XST_SUCCESS;
}
