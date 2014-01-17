#include <stdio.h>
#include "platform.h"
#include "xil_types.h"
#include "xparameters.h"
#include "xuartps.h"

void mcu_latch_registers (void);
int Chilipepper_InitDone( void );

// mcu registers
u32 chili_init_done, chili_pa_en, chili_tr_sw,
		chili_mcu_reset, chili_rx_en, chili_tx_en;
u32 chili_mcu_latch, chili_mcu_reg_reset,
		chili_latch_done, chili_reg_reset_done;

// DAC register
u32 dac_en;

int main()
{
    init_platform();

    // MCU core
	chili_mcu_reset = 		XPAR_MCU_DRIVER_S_AXI_BASEADDR + 0x100; // write
	chili_tr_sw = 			XPAR_MCU_DRIVER_S_AXI_BASEADDR + 0x104; // write
	chili_pa_en = 			XPAR_MCU_DRIVER_S_AXI_BASEADDR + 0x108; // write
	chili_tx_en = 			XPAR_MCU_DRIVER_S_AXI_BASEADDR + 0x10C; // write
	chili_rx_en = 			XPAR_MCU_DRIVER_S_AXI_BASEADDR + 0x110; // write
    chili_mcu_latch = 		XPAR_MCU_DRIVER_S_AXI_BASEADDR + 0x114; // write
    chili_mcu_reg_reset = 	XPAR_MCU_DRIVER_S_AXI_BASEADDR + 0x118; // write

    chili_init_done = 		XPAR_MCU_DRIVER_S_AXI_BASEADDR + 0x11C; // read
    chili_latch_done = 		XPAR_MCU_DRIVER_S_AXI_BASEADDR + 0x120; // read
    chili_reg_reset_done = 	XPAR_MCU_DRIVER_S_AXI_BASEADDR + 0x124; // read

    // DAC core
    dac_en = 				XPAR_DAC_DRIVER_S_AXI_BASEADDR + 0x100; // write

    Xil_Out32(chili_tr_sw, 0);
    Xil_Out32(chili_pa_en, 1);

    //start Initialization
    Xil_Out32(dac_en, 0);

    //enable physical DAC and ADC
    Xil_Out32(chili_tx_en, 1);
    Xil_Out32(chili_rx_en, 1);

	// reset Chilipepper
	Xil_Out32(chili_mcu_reset, 1);
	mcu_latch_registers();
	Xil_Out32(chili_mcu_reset, 0);
	mcu_latch_registers();
	Xil_Out32(chili_mcu_reset, 1);
	mcu_latch_registers();

	// don't continue until we get a valid init back from Chilipepper.
	while (Chilipepper_InitDone() == 0)
		;

    Xil_Out32(dac_en, 1);

    while (1);

    cleanup_platform();

    return 0;
}

void mcu_latch_registers (void){
	Xil_Out32(chili_mcu_latch, 1);
	while(chili_latch_done == 0)
		;
	Xil_Out32(chili_mcu_latch, 0);
	while(chili_latch_done == 1)
		;
}

int Chilipepper_InitDone( void )
{
	int done;
	done = Xil_In32(chili_init_done);
	return done;
}
