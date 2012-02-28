  char *pch;
  char *GGA[15];


  void valores(){
    i=0;
    memset(GGA, 0, sizeof(GGA));

    
     pch = strtok (TramaGPG,"*"); //buscamos el * y lo tokenizamos a nuestra ecesidad 
     pch = strcat (pch, ",*"); //y añadimos el token necesitado
     //comenzamos con la tokenizacion
     pch = strtok (pch, ",");
     //Trocea la cadena que devuelve
    if (strcmp(pch,"$GPGGA")==0 && menu < 3){
      while (strcmp(pch,"*")!=0) //cuando el dato sea diferente de *
        {
          pch = strtok (NULL, ","); //donde estabamos sigue cortando en comas
          GGA[i]=pch;
          i++;
        }
     representa(GGA,i,"$GPGGA");
    }
    if (strcmp(pch,"$GPRMC")==0 && menu == 3){
      while (strcmp(pch,"*")!=0) //cuando el dato sea diferente de *
        {
          pch = strtok (NULL, ","); //donde estabamos sigue cortando en comas
          GGA[i]=pch;
          i++;
        }
     representa(GGA,i,"$GPRMC");
    }

    
  }
