
//Añadimos libreria SD
#include <SD.h>

//Creamos un objeto
File misCoordenadas;
File misMensajes;
char mensaje[55];

//Pin para alimentacion
#define Pow 8

void setup()
{
 //Configuramos puerto serie 
 Serial.begin(9600);
 Serial.println("Iniciando tarjeta SD...\n");
 
 //Alimentamos shield SD
 pinMode(Pow, OUTPUT);
 digitalWrite(Pow, HIGH);
 
 //Verificamos que por el pin 10 nos devuelve que la tarjeta esta bien cargada
 if (!SD.begin(10))
   {
      Serial.println("Fallo al iniciar tarjeta SD!!\n");
      return;
   }
  
 Serial.println("Tarjeta SD correcta\n");
 Serial.println("######################################################\n");
 
 //pa probar solo
 cargarMensaje();

 guardarCoordenadas();

}

void loop()
{


}




