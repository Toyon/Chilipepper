#ifndef CHILIPEPPER_H_
#define CHILIPEPPER_H_

int Chilipepper_Initialize( void );
int Chilipepper_InitDone( void );
void Chilipepper_Reset( void );

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

#endif /* CHILIPEPPER_H_ */
