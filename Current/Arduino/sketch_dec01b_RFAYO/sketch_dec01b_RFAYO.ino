#include <RFduinoGZLL.h> // include rfduino library
device_t role = DEVICE4; // set Device name... DEVICE2 to DEVICE7 / HOST
String inputString = "";         // a string to hold incoming data
boolean stringComplete = false;  // whether the string is complete
void setup() {
  // initialize serial:
  Serial.begin(115200);
  // reserve 200 bytes for the inputString:
  inputString.reserve(200);
  RFduinoGZLL.txPowerLevel = 0;
  RFduinoGZLL.begin(role); // begin BLE communications
}
void loop() {
  Serial.println("A");
  delay(25);
  serialEvent(); //call the function
  // print the string when a newline arrives:
  char mydata[25]; // declare mydata array+
  if (stringComplete) {
    Serial.println(inputString);
    inputString.toCharArray(mydata, 25);
    RFduinoGZLL.sendToHost(mydata, 25); // send buffer to host other rfduino
    // clear the string:
    inputString = "";
    stringComplete = false;
  }
}

void serialEvent() {
  while (Serial.available()) {
    // get the new byte:
    char inChar = (char)Serial.read();
    if (inChar == '\n') {
      stringComplete = true;
    }
    else     inputString += inChar;
  }
}
void RFduinoGZLL_onReceive(device_t device, int rssi, char *data, int len) // this function receives BLE communications
{

}
