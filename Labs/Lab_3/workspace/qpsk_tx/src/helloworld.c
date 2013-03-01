/*
 * Copyright (c) 2009 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 */

#include <stdio.h>
#include "platform.h"
#include "Chilipepper.h"
#include "xgpio.h"

XGpio gpio_blinky, gpio_sw_mode, gpio_btn;

int DebouncButton( void );
int SetupPeripherals( void );

int main()
{

	int i1;
	int sw;
	int aliveLed = 0;
	static int testBlinkCount;

    init_platform();

//	if ( Chilipepper_Initialize() != 0 )
//		return -1;

    if(SetupPeripherals() != XST_SUCCESS)
    	return -1;

	if ( Chilipepper_Initialize() != 0 )
		return -1;

	while(1)
	{
	sw = XGpio_DiscreteRead(&gpio_sw_mode, 1);

		switch (sw)
		{
		case 0:

		// Continuously send out packets (do it once and then stall for a bit)
			for (i1=0; i1<5000; i1++)
			{
				if (i1 == 0)
				{
					Chilipepper_WriteTestPacket( 1 );
				}
			}
			break;
		case 1:
        	// flip the LED1 so the user knows the processor is alive
    		testBlinkCount += 1;
        	if (testBlinkCount > 2000000)
        	{
        		if (aliveLed == 0)
        			aliveLed = 1;
        		else
        			aliveLed = 0;
        		testBlinkCount = 1;
        		XGpio_DiscreteWrite(&gpio_blinky, 2, aliveLed);
        		XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
        	}

        	if (DebouncButton() == 0)
    			break;

			XGpio_DiscreteWrite(&gpio_blinky, 1, 1);
        	Chilipepper_WriteTestPacket( 1 );
			//XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
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

    XGpio_Initialize(&gpio_sw_mode, XPAR_AXI_GPIO_SWITCH_MODE_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_sw_mode, 1, 3);

    XGpio_Initialize(&gpio_btn, XPAR_AXI_GPIO_BUTTON_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_btn, 1, 1);

	return XST_SUCCESS;
}
