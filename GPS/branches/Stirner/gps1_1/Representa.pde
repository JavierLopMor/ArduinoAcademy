
void representa(char **GGAPrint,int sentencias, char *trama){              // capturamos los datos pasados en la funcion
  int n=1;                                                                 // inicializamos n a 1
  Estado=atoi(GGAPrint[5]);                                                // transformamos el char que contiene el estado de la conexion a un entero

  if(trama=="$GPGGA" && Estado==1){                                        // si la trama que tenemos es $GPGGA y el estado esta a 1 (conectado) 
      if(menu==1){                                                         // mostrara toda la informacion de la pantalla correspondiente
        LongLat(GGAPrint[3],GGAPrint[4],GGAPrint[1],GGAPrint[2]);          // impmrime latitud y longitud en display
      }
      if(menu==2){   
        altitud(GGAPrint[8],GGAPrint[9]);                                  // imprime altitud en el LCD  
        reloj(GGAPrint[0]);                                                // imprime la hora en formato UTC
      }
      digitalWrite(13, HIGH);                                              // indicamos que hay conexion satelite encendiendo el led
      Serial.println("");                                                  // e imprimimos todos los datos formateados para ser representados por el serial
      Serial.println("----------------------------------------------");
      Serial.print("hhmmss.ss ->");
      Serial.println(GGAPrint[0]);
      Serial.print("latitude of position ->");
      Serial.print(GGAPrint[1]);
      Serial.println(GGAPrint[2]);
      Serial.print("Longitude of position->");
      Serial.print(GGAPrint[3]);
      Serial.println(GGAPrint[4]);
      Serial.print("GPS Quality indicator (0=no fix, 1=GPS fix)->");
      Serial.println(GGAPrint[5]);
      Serial.print("number of satellites in use->");
      Serial.println(GGAPrint[6]);
      Serial.print("horizontal dilution of precision->");
      Serial.println(GGAPrint[7]);
      Serial.print("Antenna altitude above mean-sea-level->");
      Serial.print(GGAPrint[8]);
      Serial.println(GGAPrint[9]);
      Serial.print("Geoidal separation");
      Serial.print(GGAPrint[10]);
      Serial.println(GGAPrint[11]);
      Serial.println("----------------------------------------------");
      Serial.println("");
   
  }else{                                                                   // si no ha conexion satelite 
    
    digitalWrite(13, LOW);                                                 // apagamos el led de conectado
    esperaGPS(GGAPrint[6]);                                                // llamamos a la funcion de LCD que representa el numero de satelites conectados
    
   Serial.println("---------------------------------");                    // e imprimimos por el serial un banner con el numero de satelites conectados
   Serial.print("| Seraching GPS satellites-->");
   Serial.print(GGAPrint[6]);
   Serial.println(" |");
   Serial.println("|----Waiting for 5 satellites---|");
   Serial.println("---------------------------------");  
  }
  
  

}
