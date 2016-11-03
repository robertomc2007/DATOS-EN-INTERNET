/**
 * Tests de la API thinkspeak leyendo un valor 
 * en el campo field8
 */

import processing.serial.*;
import processing.net.*;
import static javax.swing.JOptionPane.*;

//CONFIGURATION
String APIKEY = "SF41SOFN5D31WMV6"; //INGRESAR write api key
String FIELD = "field1";
String CHANNEL ="177724";

int PORTNUM = 0; //Indice del port arduino
//END CONFIGURATION

Serial arduino;
Client c;
String data;
float number; //valor leido desde arduino

void setup() {
  size(600, 400);
  println("INICIA GATEWAY");
  try {
    //setup the serial port
    // Lista los puertos serie:
    println(Serial.list());
    // Conexion al puerto serie
    arduino = new Serial(this, Serial.list()[PORTNUM], 9600);
    println("OpenOK");
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
      arduino.write(data);
    }
  }

  //Espera por \n para enviar el valor a thingspeak
  String ln;
  if ( (ln = arduino.readStringUntil('\n')) != null) {
    println(ln);
    if (ln == "g")
    {
      println("Inicia lectura...");
      getValor();
    } else {
      try {
        number = new Float(trim(ln));
        println("Enviando " + number);
        sendNumber(number);
      }
      catch(Exception ex) {
        println("Error:", ex);
      }
    }
  }
}

//https://api.thingspeak.com/channels/177724/fields/8/last.txt
void getValor() {
  c = new Client(this, "api.thingspeak.com", 80); //Conecta con servidor en port 80
  c.write("GET /channels/"+CHANNEL+"/fields/8/last.txt HTTP/1.1\n");
  c.write("Host: my_domain_name.com\n\n"); // termina envio
}

//https://api.thingspeak.com/update?api_key=XXXXXXXXXXXXXXXX&field1=73.81
void sendNumber(float num) {
  c = new Client(this, "api.thingspeak.com", 80); //Conecta con servidor en port 80
  c.write("GET /update?key="+APIKEY+"&"+FIELD+"=" + num + " HTTP/1.1\n");
  c.write("Host: my_domain_name.com\n\n"); // termina envio
}