#include <Arduino.h>

#define SDA 8
#define SCL 7

#define POS(x) (x[1] == x[0] == 1) 
#define NEG(x) (x[1] == x[0] == 0) 
#define NEG_EDGE(x) (x[1] == 1 && x[0] == 0)
#define POS_EDGE(x) (x[1] == 0 && x[0] == 1)

#define STATE_START 0
#define STATE_DATA 1
#define STATE_ACK 2


int sda[2];
int scl[2];
word data[100];
int bitcnt = 0;
int state = STATE_START;

void setup() 
{
	pinMode(SDA, INPUT);
	pinMode(SCL, INPUT);

	sda[1] = digitalRead(SDA);
	scl[1] = digitalRead(SCL);

	Serial.begin(9600);
}


void loop()
{
	sda[0] = digitalRead(SDA);
	scl[0] = digitalRead(SCL);

	if (POS(scl))
	{
		if (NEG_EDGE(sda))
		{
			// START condition
			state = STATE_DATA;
			bitcnt = 0;
		}
		else if (POS_EDGE(sda))
		{
			// STOP condition
			for (int i = 0; i < bitcnt / 9; i++)
			{

			}
		}
	}
	else if (POS_EDGE(scl))
	{
		
	}
		
	


}
