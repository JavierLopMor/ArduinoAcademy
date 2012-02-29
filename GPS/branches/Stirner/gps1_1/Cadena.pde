  char *pch;                              // creamos un puntero de char
  char *GGA[15];                          // y un array de punteros de char

  void valores(){
    i=0;                                  // inicializamos el contador 
    memset(GGA, 0, sizeof(GGA));          // limpiamos la cadena GGA introduciendo en ellla todo ceros
    
     pch = strtok (TramaGPG,",");         // tokenizamos la cadena que tenemos en TramaGPG y el primer intervalo 
                                          // lo guardamos en pch
                                          // NOTA: strtok trocea la cadena que devuelve
    if (strcmp(pch,"$GPGGA")==0){         // cuando la cadena que tenemos dentro de pch sera igual a $GPGGA continuaremos 
      while (pch != NULL)                 // mientras el dato sea diferente de ,, (no valido o NULL)
        {
          pch = strtok (NULL, ",");       // donde estabamos sigue cortando en comas y guardandolo en pch
          GGA[i]=pch;                     // guardamos el valor de pch en el array GGA
          if(pch!=NULL){                  // y si el valor que guardamos no es NULL incrementamos en uno el contador
            i++;                          // incrementamos el contador/acumulador
          }
        }
        
     representa(GGA,i,"$GPGGA");          // llamamos a la funcion que nos va a mostrar los datos, bien por serial o por LCD
                                          // a esta funcion se le pasan tres paramtros 1º el array de chars, 2º el contador anterior, 3º la cadena a comparar
    }    
  }
