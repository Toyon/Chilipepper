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

void print(char *str);

int main()
{

	int i1;

    init_platform();

	if ( Chilipepper_Initialize() != 0 )
		return -1;

	// Continuously send out packets (do it once and then stall for a bit)
	while(1)
	{
		for (i1=0; i1<5000; i1++)
		{
			if (i1 == 0)
			{
				//XGpio_DiscreteWrite(&gpio_blinky, 1, 1);
				Chilipepper_WriteTestPacket( 1 );
				//XGpio_DiscreteWrite(&gpio_blinky, 1, 0);
			}
		}
	}
	// flip the LED1 so the user knows the processor is alive
/*
	testBlinkCount += 1;
	if (testBlinkCount > 2000)
	{
		if (aliveLed == 0)
			aliveLed = 1;
		else
			aliveLed = 0;
		testBlinkCount = 1;
		//XGpio_DiscreteWrite(&gpio_blinky, 2, aliveLed);
	}
*/
    cleanup_platform();

    return 0;
}
