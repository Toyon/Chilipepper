#include "xuartps.h"

#ifndef CHILIPEPPER_H_
#define CHILIPEPPER_H_

int Chilipepper_Initialize( void );
int Chilipepper_InitDone( void );
void Chilipepper_Reset( void );
void mcu_latch_registers( void );

void Chilipepper_SetTxRxSw( int zeroTxOneRx );

void Chilipepper_SetPA(int onOff);
void Chilipepper_TxEnable(int onOff);
void Chilipepper_RxEnable(int onOff);

int Chilipepper_ReadRssi( void );
void Chilipepper_SetLed( int onOff );
int Chilipepper_ReadPacket( unsigned char *rxBuf, unsigned char *id );
void Chilipepper_WritePacket( unsigned char *txBuf, int numPayloadBytes, unsigned char packetID );
int Chilipepper_CheckCrc( unsigned char *rxBuf, int numBytes );
void Chilipepper_AppendCrc( unsigned char *buf, int msgLength );
void Chilipepper_WriteTestPacket( unsigned char count );
int Chilipepper_WriteTestPacketWithAck( unsigned char *rxBuf );
int Chilipepper_WritePacketWithAck(  unsigned char *txBuf, int numPayloadBytes, unsigned char *rxBuf );
void Chilipepper_WriteAckPacket( unsigned char *txBuf, unsigned char id );

int Chilipepper_ControlAgc( void );

void Chilipepper_SetTxGain( int dB );
void Chilipepper_SetRxGain( int dB );
void Chilipepper_SetRegister( void );

void Chilipepper_FlushRxFifo( void );

void Chilipepper_Delay();
void Chilipepper_printf(XUartPs *InstancePtr, unsigned char * str);
void Chilipepper_printf_wl(unsigned char * uartPs, const char * str, int len);
void Chilipepper_SetFreq(int total, int RXTXswitch);
void Chilipepper_SetBand(int total, int RXTXswitch);
void clear_uart_buffer(XUartPs *InstancePtr);
int Chilipepper_cin(XUartPs *InstancePtr, unsigned char * Buf);
void Chilipepper_DeltaFreq(int RXTXswitch, int IncDecswitch);
int checkEscapeValues(char hexData[], int RXTXswitch, void (*sendEscape)(char[], int));

int hex_decimal(char hex[]);

#endif /* CHILIPEPPER_H_ */
