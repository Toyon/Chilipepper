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

XGpio gpio_blinky, gpio_sw_test, gpio_btn;

int DebouncButton( void );
int SetupPeripherals( void );

int main()
{
	int i1;
	int aliveLed = 0, statusLed = 0;;
	int sw;
	static int testBlinkCount;

    init_platform();

    if(SetupPeripherals() != XST_SUCCESS)
    	return -1;

	if ( Chilipepper_Initialize() != 0 )
		return -1;

	// by default we are in transmit
	Chilipepper_SetPA( 1 );
	Chilipepper_SetTxRxSw( 0 ); // 0- transmit, 1-receive

    while (1)
    {

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

        sw = XGpio_DiscreteRead(&gpio_sw_test, 1);
    	switch (sw)
    	{
		case 0:

		// Continuously send out packets (do it once and then stall for a bit)
			for (i1=0; i1<50000; i1++)
			{
				if (i1 == 0)
				{
					Chilipepper_WriteTestPacket( 1 );
				}
			}
			break;
    	case 1: // initiate packet transmission with a button press

    		if (DebouncButton() == 0)
    			break;

    		if (statusLed == 0)
    			statusLed = 1;
			else
				statusLed = 0;

			XGpio_DiscreteWrite(&gpio_blinky, 1, statusLed);
        	Chilipepper_WriteTestPacket( 1 );

    		break;
    	default:
    		break;
    	}

    }
    cleanup_platform();

    return 0;
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
    XGpio_Initialize(&gpio_blinky, XPAR_AXI_GPIO_LED_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_blinky, 2, 0);
    XGpio_SetDataDirection(&gpio_blinky, 1, 0);
	XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
	XGpio_DiscreteWrite(&gpio_blinky, 2, 0);

    XGpio_Initialize(&gpio_sw_test, XPAR_AXI_GPIO_SWITCH_TEST_MODES_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_sw_test, 1, 3);

    XGpio_Initialize(&gpio_btn, XPAR_AXI_GPIO_BUTTON_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_btn, 1, 1);

	return XST_SUCCESS;
}
