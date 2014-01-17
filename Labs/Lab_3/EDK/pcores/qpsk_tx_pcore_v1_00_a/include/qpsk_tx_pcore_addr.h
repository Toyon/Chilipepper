/*
 * File Name:         codegen\ipcore\qpsk_tx_pcore_v1_00_a\include\qpsk_tx_pcore_addr.h
 * Description:       C Header File
 * Created:           2013-11-18 19:08:10
*/

#ifndef QPSK_TX_PCORE_H_
#define QPSK_TX_PCORE_H_

#define  IPCore_Reset_qpsk_tx_pcore         0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_qpsk_tx_pcore        0x4  //enabled (by default) when bit 0 is 0x1
#define  clear_fifo_in_Data_qpsk_tx_pcore   0x100  //data register for port clear_fifo_in
#define  tx_en_in_Data_qpsk_tx_pcore        0x104  //data register for port tx_en_in
#define  tx_done_out_Data_qpsk_tx_pcore     0x108  //data register for port tx_done_out

#endif /* QPSK_TX_PCORE_H_ */
