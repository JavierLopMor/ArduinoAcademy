char *pch;
char GGA[25];
char cadena;

void valores(){
  i=0;
  memset(GGA, 0, sizeof(GGA));
  //pch = strtok (NULL, ",");
   pch = strtok (TramaGGA,",");
  if (strcmp(pch,"GPGGA")==0){
      cadena=pch;
    Serial.print(cadena);
       
  }
}
