#include <stdio.h>
#include "platform.h"
#include "xbasic_types.h"
#include "xgpio.h"
#include "xparameters.h"
#include "xstatus.h"
#include "chilipepper.h"
#include "xil_printf.h"
#include "xscugic.h"
#include "xil_exception.h"

#define TX 0
#define RX 1

// cordic
Xuint32 *freq_sel;

XGpio gpio_blinky, gpio_sw_test, gpio_btn, gpio_gain, gpio_sw_tx_pa;
XUartPs uartPs;
XUartPs_Config *pUartPsConfig;

void Toggle_freq(int myFreq);
int InputToKHz(u8[]);
int DebouncButton(void);
int SetupPeripherals(void);
void WriteLedGain(int gain);
void Chilipepper_BlinkLed4();
void Chilipepper_BlinkLed5();

int main() {
	freq_sel = (Xuint32 *) XPAR_CORDIC_AXIW_0_MEMMAP_FREQ_SEL;
	*freq_sel = 1;
	int aliveLed = 0, myFreq = 0, totalInput = 0;
	int i, total, num, multiplier;
	static int testBlinkCount;
	u8 myInput[256];
	int toggle = 0;

	init_platform();

	if (SetupPeripherals() != XST_SUCCESS)
		return -1;

	if (Chilipepper_Initialize() != 0)
		return -1;

	// by default we are in receive
	 Chilipepper_SetPA(1);     // (for mode 1 (TDD) only, comment out if using mode 2 or 3)
	 Chilipepper_SetTxRxSw(0); // 0- transmit, 1-receive (for mode 1 (TDD) only, comment out if using mode 2 or 3)

	// enable the Chilipepper LED to indicate we are operational
	//Chilipepper_SetLed(1);

	clear_uart_buffer(&uartPs);
	clear_uart_buffer(&uartPs);

	while (1) {

		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n\r\nWelcome to Toyon's Chilipepper Menu\r\n\r\n");
		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\nSelect from the following Menu Options\r\n");
		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n0 - Print Hello World\r\n");
		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n1 - Toggle BaseBand Frequency (1,2, or 4 MHz)\r\n");
		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n2 - Toggle LED\r\n");
		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n3 - Set TX Frequency\r\n");
		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n4 - Set RX Frequency\r\n");
		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n5 - Set TX Bandwidth\r\n");
		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n6 - Set RX Bandwidth\r\n");
		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n7 - Increment/Decrement TX (100 KHz)\r\n");
		Chilipepper_printf(&uartPs,
				(unsigned char *)"\r\n8 - Increment/Decrement RX (100 KHz)\r\n");

		totalInput = Chilipepper_cin(&uartPs,myInput);

		if (totalInput == 2){
			switch ((int) myInput[0]) {
				case '0':
					Chilipepper_printf(&uartPs, (unsigned char *)"\r\nHello World! ");
					break;
				case '1':
					myFreq++;
					if (myFreq == 4)
						myFreq=1;

					Toggle_freq(myFreq);
					break;
				case '2':  // Not Implemented
					Chilipepper_SetLed(toggle);
					toggle = (toggle == 0) ? 1 : 0;
					break;
				case '3':
					Chilipepper_printf(&uartPs, (unsigned char *)"\r\nEnter a Frequency in KHz\r\n");
					totalInput = Chilipepper_cin(&uartPs, myInput);

					Chilipepper_printf(&uartPs, (unsigned char*)"\r\nSetting TX frequency to ");
					for (i = 0;i<totalInput; i++){
						XUartPs_Send(&uartPs, myInput + i, 1);
					}
					Chilipepper_printf(&uartPs, (unsigned char*)"KHz\r\n");

					total=InputToKHz(myInput);
					Chilipepper_SetFreq(total, TX);
					break;
				case '4':
					Chilipepper_printf(&uartPs, (unsigned char *)"\r\nEnter a Frequency in KHz\r\n");
					totalInput = Chilipepper_cin(&uartPs, myInput);

					Chilipepper_printf(&uartPs, (unsigned char*)"\r\nSetting RX frequency to ");
					for (i = 0;i<totalInput; i++){
						XUartPs_Send(&uartPs, myInput + i, 1);
					}
					Chilipepper_printf(&uartPs, (unsigned char*)"KHz\r\n");

					total=InputToKHz(myInput);
					Chilipepper_SetFreq(total, RX);
					break;
				case '5':
					Chilipepper_printf(&uartPs, (unsigned char *)"\r\nEnter a Bandwidth in KHz\r\n");
					totalInput = Chilipepper_cin(&uartPs, myInput);

					Chilipepper_printf(&uartPs, (unsigned char*)"\r\nSetting TX bandwidth to ");
					for (i = 0;i<totalInput; i++){
						XUartPs_Send(&uartPs, myInput + i, 1);
					}
					Chilipepper_printf(&uartPs, (unsigned char*)"KHz\r\n");

					//convert to KHz value
					total=InputToKHz(myInput);
					Chilipepper_SetBand(total, TX);
					break;
				case '6':
					Chilipepper_printf(&uartPs, (unsigned char *)"\r\nEnter a Bandwidth in KHz\r\n");
					totalInput = Chilipepper_cin(&uartPs, myInput);

					Chilipepper_printf(&uartPs, (unsigned char*)"\r\nSetting RX bandwidth to ");
					for (i = 0;i<totalInput; i++){
						XUartPs_Send(&uartPs, myInput + i, 1);
					}
					Chilipepper_printf(&uartPs, (unsigned char*)"KHz\r\n");

					total=InputToKHz(myInput);
					Chilipepper_SetBand(total, RX);
					break;
				case '7':
					Chilipepper_printf(&uartPs, (unsigned char *)"\r\n\r\n0 - Increment\r\n\r\n");
					Chilipepper_printf(&uartPs, (unsigned char *)"\r\n\r\n1 - Decrement\r\n\r\n");
					Chilipepper_cin(&uartPs,myInput);
					if ((int) myInput[0] == '0' || (int) myInput[0] == '1')
						Chilipepper_DeltaFreq(TX,(int) myInput[0]);
					else
						Chilipepper_printf(&uartPs, (unsigned char *)"\r\nInvalid Input ");
					break;
				case '8':
					Chilipepper_printf(&uartPs, (unsigned char *)"\r\n\r\n0 - Increment\r\n\r\n");
					Chilipepper_printf(&uartPs, (unsigned char *)"\r\n\r\n1 - Decrement\r\n\r\n");
					Chilipepper_cin(&uartPs,myInput);
					if ((int) myInput[0] == '0' || (int) myInput[0] == '1')
						Chilipepper_DeltaFreq(RX,(int) myInput[0]);
					else
						Chilipepper_printf(&uartPs, (unsigned char *)"\r\nInvalid Input ");
					break;
				default:
					Chilipepper_printf(&uartPs, (unsigned char *)"\r\nInvalid Input ");
					break;
			}
		}
		else{
			Chilipepper_printf(&uartPs, (unsigned char *)"\r\nInvalid Input ");
		}

		testBlinkCount += 1;
		if (testBlinkCount > 100000) {
			if (aliveLed == 0)
				aliveLed = 1;
			else
				aliveLed = 0;
			testBlinkCount = 1;
			XGpio_DiscreteWrite(&gpio_blinky, 2, aliveLed);
		}
	}

	cleanup_platform();

	return 0;
}

void Toggle_freq(int myFreq){

	if (myFreq == 3)
		myFreq = 1;
	else
		myFreq = myFreq + 1;

	*freq_sel = myFreq;
	return;
}

int InputToKHz(u8 myInput[256]){
	int i,num;
	int total = 0;
	int multiplier = 1;
	for (i=strlen((char*)myInput);i>0;i--){
		num = myInput[i-1] - '0';
		total = total + num*multiplier;
		multiplier = multiplier*10;
	}
	return total;
}

int SetupPeripherals(void) {
	int status;

	XGpio_Initialize(&gpio_blinky, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&gpio_blinky, 2, 0);
	XGpio_SetDataDirection(&gpio_blinky, 1, 0);
	XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
	XGpio_DiscreteWrite(&gpio_blinky, 2, 0);

	XGpio_Initialize(&gpio_btn, XPAR_AXI_GPIO_BUTTON_DEVICE_ID);
	XGpio_SetDataDirection(&gpio_btn, 1, 1);

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
