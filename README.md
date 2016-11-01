# DATOS EN INTERNET

## Resumen Uso de un GATEWAY para subir datos a la nube

Servicio gratuito [THINGSPEAK](https://thingspeak.com/)

### Agregar un valor numerico a un campo: 

https://api.thingspeak.com/update?api_key=XXXXXXXXXXXXXXXX&field1=73.81

### Agregar un texto a un campo: 

https://api.thingspeak.com/update?api_key=XXXXXXXXXXXXXXXX&field3=algun_texto

### Obtener el ultimo valor de un campo: 

Canal PUBLICO

https://api.thingspeak.com/channels/141411/fields/3/last.txt

Canal PRIVADO

https://api.thingspeak.com/channels/141411/fields/3/last.txt?api_key=XXXXXXXXXXXXXX

Programa escrito con [PROCESSING](https://processing.org/) para interpretar el texto en el puerto serie y ajustarlo a la API del servicio de datos
