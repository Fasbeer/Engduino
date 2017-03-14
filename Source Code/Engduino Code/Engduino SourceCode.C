#include <EngduinoThermistor.h>
#include <EngduinoLEDs.h>

void setup() {
     EngduinoThermistor.begin(); //Starts the thermister
     EngduinoLEDs.begin(); //Starts the LEDs
     }
	 


void loop() {
     
	 float T; //initiate variable T
     T = EngduinoThermistor.temperature(); //assign variable
     
	 Serial.println(T); //Print variable
     delay(500);
     
	 if (T < 24.99 && T > 23.99 ){
          EngduinoLEDs.setAll(YELLOW); //sets LED to Yellow at Room Temperature
          delay(500);
       }
     else if(T > 24.99){
          EngduinoLEDs.setAll(RED); //sets LED to RED above room Temperature
          delay(500);
       }
     else if(T < 23.99){
          EngduinoLEDs.setAll(BLUE); //sets LED to Blue below room Temperature
          delay(500);
       }
	 }