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

XGpio gpio_blinky;

int SetupPeripherals( void );

int main()
{
	int aliveLed = 0;
	static int testBlinkCount;

    init_platform();

    if(SetupPeripherals() != XST_SUCCESS)
    	return -1;

	if ( Chilipepper_Initialize() != 0 )
		return -1;

	// by default we are in receive
	Chilipepper_SetPA( 1 );
	Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive

	while(1){
		testBlinkCount += 1;
    	if (testBlinkCount > 100000)
    	{
    		if (aliveLed == 0)
    			aliveLed = 1;
    		else
    			aliveLed = 0;
    		testBlinkCount = 1;
    		//XGpio_DiscreteWrite(&gpio_blinky, 2, aliveLed);
    	}
	}

	cleanup_platform();

    return 0;
}

int SetupPeripherals( void )
{

    XGpio_Initialize(&gpio_blinky, XPAR_AXI_GPIO_LED_DEVICE_ID);
    XGpio_SetDataDirection(&gpio_blinky, 2, 0);
    XGpio_SetDataDirection(&gpio_blinky, 1, 0);
	XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
	XGpio_DiscreteWrite(&gpio_blinky, 2, 0);

	return XST_SUCCESS;
}
