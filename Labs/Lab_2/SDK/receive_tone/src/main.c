#include <stdio.h>
#include "platform.h"
#include "chilipepper.h"

int main()
{
    init_platform();

	if ( Chilipepper_Initialize() != 0 )
		return -1;

	// by default we are in transmit
	Chilipepper_SetPA( 0 );
	Chilipepper_SetTxRxSw( 1 ); // 0- transmit, 1-receive

    while (1)
    {}

    cleanup_platform();

    return 0;
}
