/*
 * File Name:         codegen\ipcore\dc_offset_pcore_v1_00_a\include\dc_offset_pcore_addr.h
 * Description:       C Header File
 * Created:           2013-12-31 17:34:21
*/

#ifndef DC_OFFSET_PCORE_H_
#define DC_OFFSET_PCORE_H_

#define  IPCore_Reset_dc_offset_pcore             0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_dc_offset_pcore            0x4  //enabled (by default) when bit 0 is 0x1
#define  gain_en_in_Data_dc_offset_pcore          0x100  //data register for port gain_en_in
#define  rssi_low_goal_in_Data_dc_offset_pcore    0x104  //data register for port rssi_low_goal_in
#define  rssi_high_goal_in_Data_dc_offset_pcore   0x108  //data register for port rssi_high_goal_in
#define  rx_en_in_Data_dc_offset_pcore            0x10C  //data register for port rx_en_in
#define  rssi_out_Data_dc_offset_pcore            0x110  //data register for port rssi_out
#define  rssi_en_out_Data_dc_offset_pcore         0x114  //data register for port rssi_en_out
#define  dir_out_Data_dc_offset_pcore             0x118  //data register for port dir_out
#define  dir_en_out_Data_dc_offset_pcore          0x11C  //data register for port dir_en_out

#endif /* DC_OFFSET_PCORE_H_ */
