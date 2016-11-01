# DATOS EN INTERNET

Resumen Uso de un GATEWAY para subir datos a la nube (API THINGSPEAK)

## A) Servicio gratuito [THINGSPEAK](https://thingspeak.com/)

### Agregar un valor numerico a un campo:  [Update a Channel Feed](https://www.mathworks.com/help/thingspeak/update-channel-feed.html)

https://api.thingspeak.com/update?api_key=XXXXXXXXXXXXXXXX&field1=73.81

NOTA: api_key = WRITE API KEY

### Agregar un texto a un campo: 

https://api.thingspeak.com/update?api_key=XXXXXXXXXXXXXXXX&field3=algun_texto

### Obtener el ultimo valor de un campo: [Get Last Entry in a Field Feed](https://www.mathworks.com/help/thingspeak/get-channel-field-feed.html#field_last_data)

Canal PUBLICO

https://api.thingspeak.com/channels/141411/fields/3/last.txt

Canal PRIVADO

https://api.thingspeak.com/channels/141411/fields/3/last.txt?api_key=XXXXXXXXXXXXXX

NOTA: api_key = READ API KEY

## B) Programa escrito con [PROCESSING](https://processing.org/overview/) para interpretar el texto en el puerto serie y ajustarlo a la API del servicio de datos
