#ifndef CHILIPEPPER_H_
#define CHILIPEPPER_H_

int Chilipepper_Initialize( void );
void Chilipepper_AppendCrc( unsigned char *buf, int msgLength );
void Chilipepper_WriteTestPacket( unsigned char count );

#endif /* CHILIPEPPER_H_ */
