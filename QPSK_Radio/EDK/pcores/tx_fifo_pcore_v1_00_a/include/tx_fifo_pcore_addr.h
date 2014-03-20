/*
 * File Name:         codegen\ipcore\tx_fifo_pcore_v1_00_a\include\tx_fifo_pcore_addr.h
 * Description:       C Header File
 * Created:           2014-01-02 13:50:14
*/

#ifndef TX_FIFO_PCORE_H_
#define TX_FIFO_PCORE_H_

#define  IPCore_Reset_tx_fifo_pcore           0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_tx_fifo_pcore          0x4  //enabled (by default) when bit 0 is 0x1
#define  reset_fifo_Data_tx_fifo_pcore        0x100  //data register for port reset_fifo
#define  store_byte_Data_tx_fifo_pcore        0x104  //data register for port store_byte
#define  byte_in_Data_tx_fifo_pcore           0x108  //data register for port byte_in
#define  bytes_available_Data_tx_fifo_pcore   0x10C  //data register for port bytes_available
#define  byte_received_Data_tx_fifo_pcore     0x110  //data register for port byte_received

#endif /* TX_FIFO_PCORE_H_ */
