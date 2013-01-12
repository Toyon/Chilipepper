#include <stdio.h>

int main()
{
	// mcu registers
	int *chili_init_done, *chili_pa_en, *chili_tr_sw;
	int *chili_mcu_reset, *chili_rx_en, *chili_tx_en;

	// MCU core
    chili_init_done = (int *)(0x61600000 + 0x800);
    chili_pa_en = (int *)(0x61600000 + 0x800);
    chili_tr_sw = (int *)(0x61600000 + 0x804);
    chili_mcu_reset = (int *)(0x61600000 + 0x808);
    chili_rx_en = (int *)(0x61600000 + 0x80C);
    chili_tx_en = (int *)(0x61600000 + 0x810);

    // enable Tr/Rx cores in the RFIC
    *chili_rx_en = 1;
    *chili_tx_en = 1;

    // toggle reset on MCU - active low
    *chili_mcu_reset = 1;
    *chili_mcu_reset = 0;
    *chili_mcu_reset = 1;

    // wait for the MCU to finish calibration
    while(*chili_init_done == 0)
    	;

    // put RF front-end in state for receive
    *chili_pa_en = 0; // active high
    *chili_tr_sw = 1; // 0- transmit, 1-receive

    while (1);

    return 0;
}
