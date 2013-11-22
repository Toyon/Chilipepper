/*
 * File Name:         codegen\ipcore\dac_driver_pcore_v1_00_a\include\dac_driver_pcore_addr.h
 * Description:       C Header File
 * Created:           2013-11-15 16:36:38
*/

#ifndef DAC_DRIVER_PCORE_H_
#define DAC_DRIVER_PCORE_H_

#define  IPCore_Reset_dac_driver_pcore    0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_dac_driver_pcore   0x4  //enabled (by default) when bit 0 is 0x1
#define  dac_en_Data_dac_driver_pcore     0x100  //data register for port dac_en

#endif /* DAC_DRIVER_PCORE_H_ */
