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

int SetupPeripherals( void );

int main()
{
    int aliveLed = 0;
    static int BlinkCount = 0;
    init_platform();
    if(SetupPeripherals() != XST_SUCCESS)
    	return -1;

    if ( Chilipepper_Initialize() != 0 )
    	return -1;

    Chilipepper_SetPA( 1 );
    Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive
    while (1)
    {
	   Chilipepper_ControlAgc(); //update the Chilipepper AGC
	   BlinkCount += 1;
	   if (BlinkCount > 100000)
	   {
		 if (aliveLed == 0)
			aliveLed = 1;
		 else
			aliveLed = 0;
		 BlinkCount = 1;
		 XGpio_DiscreteWrite(&gpio_blinky, 2, aliveLed);  //blink LEDs
		 XGpio_DiscreteWrite(&gpio_blinky, 1, ~aliveLed);
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
