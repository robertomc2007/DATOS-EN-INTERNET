#include <RBD_Timer.h>

/*
   Captura comandos desde THINGSPEAK
*/
RBD::Timer timer;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  pinMode(LED_BUILTIN, OUTPUT);
  
  Serial.println(F("INICIA GATEWAY READ"));

  timer.setTimeout(3000);
  timer.restart();
}

void loop() {

  // put your main code here, to run repeatedly:
  while (Serial.available()) {
    // read the most recent byte
    char cmd = Serial.read();
    switch (cmd) {
      case 'o': //led on
        digitalWrite(LED_BUILTIN, HIGH);
        break;
      case 'f': //led off
        digitalWrite(LED_BUILTIN, LOW);
        break;
    }
  }

  if (timer.onRestart()) {
    Serial.println("g");
  }

}
