/**
 * Tests the thinkspeak channel by sending any numeric 
 * keypress using the specified APIKEY and FIELD
 */

import processing.serial.*;
import processing.net.*;
import static javax.swing.JOptionPane.*;

//CONFIGURATION
String APIKEY = "XXXXXXXXXXXXXXXX"; //your api key
String FIELD = "field1";
int PORTNUM = 0; //Indice del port arduino
//END CONFIGURATION

Serial arduino;
Client c;
String data;
float number; //read from arduino

void setup() {
  size(600, 400);
  try {
    //setup the serial port
    // List all the available serial ports:
    println(Serial.list());
    //Init the Serial object
    arduino = new Serial(this, Serial.list()[PORTNUM], 9600);
  }
  catch (Exception e)
  { //Muestra el error
    showMessageDialog(frame, "COM no disponible");
    println("Error:", e);
    exit();
  }
}

void draw() {
  background(50);
  fill(255);
  text("ThinkSpeak GATEWAY", 10, 20);

  fill(0, 255, 0);
  text("Valor leido:  " + number, 10, 40);

  if ( data != null ) {
    fill(0, 255, 0);
    text("Respuesta del servidor:", 10, 60);
    fill(200);
    text(data, 10, 80);
  }
  if (c != null) {
    if (c.available() > 0) { // Muestra la respuesta del servidor...
      data = c.readString();
      println(data);
    }
  }

  //Espera por \n para enviar el valor a thingspeak
  String ln;
  if ( (ln = arduino.readStringUntil('\n')) != null) {
    try {
      number = new Float(trim(ln));
      //if (number < 1025) {
      println("Enviando " + number);
      sendNumber(number);
      //}
    }
    catch(Exception ex) {
      println("Error:", ex);
    }
  }
}

void sendNumber(float num) {
  c = new Client(this, "api.thingspeak.com", 80); //Conecta con servidor en port 80
  c.write("GET /update?key="+APIKEY+"&"+FIELD+"=" + num + " HTTP/1.1\n");
  c.write("Host: my_domain_name.com\n\n"); // termina envio
}
