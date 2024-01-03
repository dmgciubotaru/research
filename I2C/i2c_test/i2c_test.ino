#include <I2C_eeprom.h>
#include <Wire.h>

void setup() {
  Serial.begin(9600);
  Wire.setClock(10000);
  Wire.begin();

  //mem.begin();
  Serial.println("r: flash read\nw: flash write");
}

byte readEEPROM(int deviceaddress, unsigned int eeaddress) {
  byte rdata = 0xFF;

  Wire.beginTransmission(deviceaddress);
  Wire.write((int)(eeaddress >> 8)); // MSB
  Wire.write((int)(eeaddress & 0xFF)); // LSB
  Wire.endTransmission();

  Wire.requestFrom(deviceaddress, 1);

  if (Wire.available()) rdata = Wire.read();

  return rdata;
}

void loop()
{
  byte data = readEEPROM(0x50, 0x10);
  Serial.println(data, HEX);
  delay(500); // Wait for 10 seconds before reading again
}
