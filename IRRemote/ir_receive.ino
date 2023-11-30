// Define IR data pin
const int dataPin = 8;

void setup() 
{
  // Initialize the Serial communication
  Serial.begin(9600);
  
  // Initialize the data pin as an input
  pinMode(dataPin, INPUT);
}

void loop() 
{
  // Array to store the received data
  byte data[4];

  // Buffer used for string formatting
  char buff[100];
  
  // Wait for a LOW pulse on data
  // The start signal should have arount 9 ms
  unsigned long duration = pulseIn(dataPin, LOW);
  if(abs(duration - 9000) < 1000)
  {
    // after the START / SYNC signal is detected, data should be parsed
    // There are 4 bytes of data
    for(int i=0; i<4; i++)
    {
      // 8 bits each
      for(int j=0; j<8; j++)
      {
        // measure the gap
        duration = pulseIn(dataPin, HIGH);
        // depending on the gap size, an 0 or 1 is transmitted
        data[i] = (data[i] << 1) + (duration > 1000);
      }     
    }

    sprintf(buff, "%02x%02x%02x%02x", data[0], data[1], data[2], data[3]);
    Serial.println(buff); 
  }
}