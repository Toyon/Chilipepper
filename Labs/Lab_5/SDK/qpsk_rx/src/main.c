#include <stdio.h>
#include "platform.h"
#include "chilipepper.h"
#include "xuartps.h"

XUartPs uartPs;
XUartPs_Config *pUartPsConfig;

int main()
{

    init_platform();

    if ( Chilipepper_Initialize() != 0 )
    	return -1;

    Chilipepper_SetPA( 0 );
    Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive
    Chilipepper_SetDCOC(1);		// enable dc offset correction

    while (1)
    {
    	Chilipepper_ControlAgc(); //update the Chilipepper AGC
    }
    cleanup_platform();
    return 0;
}
