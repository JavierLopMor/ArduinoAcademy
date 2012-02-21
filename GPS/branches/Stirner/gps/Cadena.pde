  char *pch;
  char *GGA[15];

  void valores(){
    i=0;
    memset(GGA, 0, sizeof(GGA));
     pch = strtok (TramaGGA,",");
    if (strcmp(pch,"GPGGA")==0){
      while (pch != NULL)
        {
          pch = strtok (NULL, ",");
          GGA[i]=pch;
          i++;
        Serial.print(pch);
        Serial.print(" -->"); 
        Serial.println(i);
        }
        
     //representa(GGA,i);   
    }
    
  }
