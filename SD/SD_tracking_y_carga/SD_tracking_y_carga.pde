
//Añadimos libreria SD
#include <SD.h>

//Creamos un objeto
File misCoordenadas;
File misMensajes;

//Pin para alimentacion
#define Pow 8

void setup()
{
 //Configuramos puerto serie 
 Serial.begin(9600);
 Serial.print("Iniciando tarjeta SD...");
 
 //Alimentamos shield SD
 pinMode(Pow, OUTPUT);
 digitalWrite(Pow, HIGH);
 
 //Verificamos que por el pin 10 nos devuelve que la tarjeta esta bien cargada
 if (!SD.begin(10))
   {
      Serial.println("Fallo al iniciar tarjeta SD!!");
      return;
   }
  
 Serial.println("Tarjeta SD correcta");
}

void loop()
{
cargarMensaje();
delay(2000);
guardarCoordenadas();
delay(2000);

}




