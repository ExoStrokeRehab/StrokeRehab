/*
This sketch demonstrates how to send data from a Device
to a Host in a Gazell network.

The host and upto 3 devices should have the RGB shield
attached.  When Button A on a Device is pressed, the
associated led on the Host will toggle.  Device1 is
associated with the Red led, Device2 with the Green led
and Device3 with the Blue led.

The Green led on the Device will blink to indicate
that an acknowledgement from the Host was received.
*/

#include <RFduinoGZLL.h>
/*
device_t role = HOST;

// pin for the Green Led
String sstr1, sstr2, sstr3;

void setup()
{
Serial.begin(115200);
  // start the GZLL stack  
  RFduinoGZLL.begin(role);
}

void loop()
{
  Serial.flush();

  if(sstr1!="")  Serial.println(sstr1);
  if(sstr2!="")  Serial.println(sstr2);
  if(sstr3!="")  Serial.println(sstr3);
  sstr1="";
  sstr2="";
  sstr3="";
}

void RFduinoGZLL_onReceive(device_t device, int rssi, char *data, int len)
{
  if(device== DEVICE2)
  {
  sstr1=data;
  }
  else if(device== DEVICE3)
  {
    sstr2=data;
  }
  else if(device== DEVICE4)
  {
    sstr3=data;
  }
}*/
