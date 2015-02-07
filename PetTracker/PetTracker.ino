#include <Time.h>

  const int pressure_sensor = A0;
  const int led_pin = 6;
  const int CONST_THRESHOLD = 10;
  

  

void setup(){
    Serial.begin(9600);
}

void loop(){
  // TIM: connect to bluetooth and do some shit here
  while(abs(lastread - analogRead(pressureSensor)) > CONST_THRESHOLD){
    lastread = analogRead(pressureSensor);
    wait(5000);
}  
// TIM: write value of pressure sensor here

 }
Serial.print(analogRead(pressure_sensor));
Serial.println();
delay(300);

}
