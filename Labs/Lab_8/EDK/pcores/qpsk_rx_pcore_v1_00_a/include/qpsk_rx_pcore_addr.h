/*
 * File Name:         codegen\ipcore\qpsk_rx_pcore_v1_00_a\include\qpsk_rx_pcore_addr.h
 * Description:       C Header File
 * Created:           2014-03-15 11:16:46
*/

#ifndef QPSK_RX_PCORE_H_
#define QPSK_RX_PCORE_H_

#define  IPCore_Reset_qpsk_rx_pcore           0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_qpsk_rx_pcore          0x4  //enabled (by default) when bit 0 is 0x1
#define  mcu_rx_ready_in_Data_qpsk_rx_pcore   0x100  //data register for port mcu_rx_ready_in
#define  num_bytes_ready_Data_qpsk_rx_pcore   0x104  //data register for port num_bytes_ready

#endif /* QPSK_RX_PCORE_H_ */
