
void representa(char **GGAPrint,int sentencias, char *trama){
  int n=1;
  
  if (strcmp(trama,"$GPGGA")==0 && sentencias > 8){ //si el numero de sentencias mandadas por el GPS es mas de 8 eso significa que hay establecida conexion con el satelite
    Estado = atoi(GGAPrint[5]);
  }else{
    Estado = atoi(GGAPrint[2]);;
  }
  
  if(strcmp(trama,"$GPRMC")==0 && strcmp((GGAPrint[1]),"A")==0 ){
    debugerGPRMC(GGAPrint,sentencias,trama);//salida por Serial
      if(menu==3){
        fecha(GGAPrint[8]);
        reloj(GGAPrint[0]);
      }
  }
  
  if(strcmp(trama,"$GPGGA")==0 && Estado==1 && sentencias > 8  ){
      
      if(menu==1){
        LongLat(GGAPrint[3],GGAPrint[4],GGAPrint[1],GGAPrint[2]);  //impmrime latitud y longitud en display
      }
      if(menu==2){   
        altitud(GGAPrint[8],GGAPrint[9]);   //imprime la altitud y la hora   
        reloj(GGAPrint[0]);
      }

      digitalWrite(13, HIGH);// indicamos que hay conexion satelite
      debuger(GGAPrint,sentencias,trama);//salida por Serial 
  }else{
    if(strcmp(trama,"$GPGGA")==0){
      digitalWrite(13, LOW);
      esperaGPS(GGAPrint[2]); //numero de satelites conectados
      debugerEspera(GGAPrint[2]);//salida por Serial
    }
  }

  

}
