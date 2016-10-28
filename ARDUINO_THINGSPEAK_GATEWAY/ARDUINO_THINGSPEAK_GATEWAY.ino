void setup(){
  Serial.begin(9600);
}

void loop(){
  int valordigital=analogRead(0);
  Serial.println(valordigital*5.0/1023.0);
  delay(20000);
}
