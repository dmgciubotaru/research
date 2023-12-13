#include <I2C_eeprom.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BMP085_U.h>

Adafruit_BMP085_Unified bmp = Adafruit_BMP085_Unified(10085);
I2C_eeprom mem(0x50, I2C_DEVICESIZE_24LC256);

void setup() {
  Serial.begin(9600);
  bmp.begin();
  mem.begin();
  Serial.println("t: Temp\np: pressure\nr: flash read\nw: flash write");
}

void loop() 
{
  if (Serial.available() > 0)
  {
    String command = Serial.readStringUntil('\n');
    // Process the command
    if (command == "t") 
    {
      float temp;
      bmp.getTemperature(&temp);
      Serial.println(temp);
    } 
    else if (command == "p") 
    {
        float pressure;
        bmp.getPressure(&pressure);
        Serial.println(pressure);
    }
    else if (command == "r") 
    {
        byte valueByte;
        word valueWord;
        valueByte = mem.readByte(0x10);
        mem.readBlock(0x20, (byte *)&valueWord, 2);
        Serial.print(valueByte, HEX);
        Serial.print(" ");
        Serial.println(valueWord, HEX);
    }
    else if (command == "w") 
    {
        byte valueByte = 0x14;
        word valueWord = 0xAA22;
        valueByte = mem.writeByte(0x10, valueByte);
        mem.writeBlock(0x20, (byte *)&valueWord, 2);
        Serial.println("Done");
    }
    else 
    {
      Serial.println("Invalid command");
    }
  }
}
