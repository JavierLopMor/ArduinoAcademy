char *pch;
  char *GGA[15];

  void valores(){
    i=0;
    memset(GGA, 0, sizeof(GGA));
    
     pch = strtok (TramaGPG,",");
     
     //Trocea la cadena que devuelve
    if (strcmp(pch,"$GPGGA")==0){
      while (pch != NULL) //cuando el dato sea diferente de ,, (valido, no null)
        {
          pch = strtok (NULL, ","); //donde estabamos sigue cortando en comas
          GGA[i]=pch;
          if(pch!=NULL){
            i++;
          }
        }
        
     representa(GGA,i,"$GPGGA");
    }
    memset(GGA, 0, sizeof(GGA));
    i=0;
    if(strcmp(pch,"$GPGSV")==0){
      //Serial.println("Satelites detectados");
      //representa(GGA,i,"$GPGSV");
    }
    i=0;
    memset(GGA, 0, sizeof(GGA));
    if(strcmp(pch,"$GPVTG")==0){
      //Serial.println("Track made good and ground speed");
      //representa(GGA,i,"$GPVTG");
    }
    i=0;
    memset(GGA, 0, sizeof(GGA));
    if(strcmp(pch,"$GPGSA")==0){
      //Serial.println("GPS DOP and active satellites");
      //representa(GGA,i,"$GPGSA");
    }
    i=0;
    memset(GGA, 0, sizeof(GGA));
    if(strcmp(pch,"$GPGLL")==0){
      //Serial.println("Geographic position, latitude / longitude");
      //representa(GGA,i,"$GPGLL");
    }
    i=0;
    memset(GGA, 0, sizeof(GGA));
    
  }
