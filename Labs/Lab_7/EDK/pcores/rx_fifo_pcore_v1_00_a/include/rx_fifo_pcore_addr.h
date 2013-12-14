/*
 * File Name:         codegen\ipcore\rx_fifo_pcore_v1_00_a\include\rx_fifo_pcore_addr.h
 * Description:       C Header File
 * Created:           2013-12-13 15:25:43
*/

#ifndef RX_FIFO_PCORE_H_
#define RX_FIFO_PCORE_H_

#define  IPCore_Reset_rx_fifo_pcore           0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_rx_fifo_pcore          0x4  //enabled (by default) when bit 0 is 0x1
#define  get_byte_Data_rx_fifo_pcore          0x100  //data register for port get_byte
#define  reset_fifo_Data_rx_fifo_pcore        0x104  //data register for port reset_fifo
#define  dout_Data_rx_fifo_pcore              0x108  //data register for port dout
#define  empty_Data_rx_fifo_pcore             0x10C  //data register for port empty
#define  byte_ready_Data_rx_fifo_pcore        0x110  //data register for port byte_ready
#define  bytes_available_Data_rx_fifo_pcore   0x114  //data register for port bytes_available

#endif /* RX_FIFO_PCORE_H_ */
