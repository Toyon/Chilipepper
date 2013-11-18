/*
 * File Name:         codegen\ipcore\mcu_driver_pcore_v1_00_a\include\mcu_driver_pcore_addr.h
 * Description:       C Header File
 * Created:           2013-11-18 13:30:51
*/

#ifndef MCU_DRIVER_PCORE_H_
#define MCU_DRIVER_PCORE_H_

#define  IPCore_Reset_mcu_driver_pcore          0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_mcu_driver_pcore         0x4  //enabled (by default) when bit 0 is 0x1
#define  mcu_reset_in_Data_mcu_driver_pcore     0x100  //data register for port mcu_reset_in
#define  tr_sw_reg_Data_mcu_driver_pcore        0x104  //data register for port tr_sw_reg
#define  pa_en_reg_Data_mcu_driver_pcore        0x108  //data register for port pa_en_reg
#define  tx_en_reg_Data_mcu_driver_pcore        0x10C  //data register for port tx_en_reg
#define  rx_en_reg_Data_mcu_driver_pcore        0x110  //data register for port rx_en_reg
#define  latch_Data_mcu_driver_pcore            0x114  //data register for port latch
#define  mcu_reg_reset_Data_mcu_driver_pcore    0x118  //data register for port mcu_reg_reset
#define  init_done_reg_Data_mcu_driver_pcore    0x11C  //data register for port init_done_reg
#define  latch_done_Data_mcu_driver_pcore       0x120  //data register for port latch_done
#define  reg_reset_done_Data_mcu_driver_pcore   0x124  //data register for port reg_reset_done

#endif /* MCU_DRIVER_PCORE_H_ */
