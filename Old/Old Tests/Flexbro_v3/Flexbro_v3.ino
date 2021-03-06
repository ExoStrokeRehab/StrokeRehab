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
const int fsp4 = A4;

void setup(){
  Serial.begin(115200);
}

void loop(){
 
  int fsr[3];                              //refers to color of heat shrink
    fsr[0] = analogRead(flexSensorPin);   //red - right thumb
    fsr[1] = analogRead(fsp2);            //green - index right / ring left
    fsr[2] = analogRead(fsp3);            //blue - ring right / index left
    fsr[3] = analogRead(fsp4);            //white - thumb left
    
    int mapped[3];                         //mapped values (0-90) for each

    mapped[0] = map(fsr[0], 480, 380, 0, 90);
    mapped[1] = map(fsr[1], 664, 590, 0, 90);
    mapped[2] = map(fsr[2], 655, 520, 0, 90);
    mapped[3] = map(fsr[3], 480, 380, 0, 90);

    int constrained[3];
    for(int ii = 0; ii < 4; ii++){
      constrained[ii] = mapped[ii];
      }
    

    for(int i = 0; i < 4; i++){
      Serial.print(constrained[i]);
      Serial.print(" ");
      }
      
      Serial.println(" ");

    
      
      for(int i = 0; i < 4; i++){
        Serial.print(fsr[i]);
        Serial.print(" ");
        }
    
        Serial.println(" ");
    
       
       

     
  //In my tests I was getting a reading on the arduino between 512, and 614. 
  //Using map(), you can convert that to a larger range like 0-100.
//  int flex0to100 = map(flexSensorReading, 480, 340, 0, 90);
//  Serial.println(flex0to100);


  delay(100); //just here to slow down the output for easier reading
}
