// Download to arduino port first, then switch to Serial port

/*
#include <SoftwareSerial.h>

#define RX 10
#define TX 11

SoftwareSerial Serial(RX, TX);
*/
const int flexSensorPin = A0; //analog pin 0
const int fsp2 = A1;
const int fsp3 = A2;
const int fsp4 = A3;

void setup() {
  Serial.begin(115200);
}

void loop() {
  
  int fsr[4];                              //refers to color of heat shrink
  fsr[0] = analogRead(flexSensorPin);   //red - right thumb
  fsr[1] = analogRead(fsp2);            //green - index right / ring left
  fsr[2] = analogRead(fsp3);            //blue - ring right / index left
  fsr[3] = analogRead(fsp4);            //white - thumb left
  
   int mapped[4];                         //mapped values (0-90) for each

   mapped[0] = map(fsr[0], 420, 328, 0, 90);//index right
   mapped[1] = map(fsr[1], 190, 118, 0, 90); // thumb right
   mapped[2] = map(fsr[2], 427, 264, 0, 90);//ring right
   mapped[3] = map(fsr[3], 230, 140, 0, 90);//pinky right

   int constrained[4];
   for(int ii = 0; ii < 4; ii++){
     constrained[ii] = constrain(mapped[ii], 0, 90);
     }


   for(int i = 0; i < 4; i++){
     Serial.print(constrained[i]);
     Serial.print(" ");
     }

     Serial.println(" ");
  delay(20); //just here to slow down the output for easier reading
}
