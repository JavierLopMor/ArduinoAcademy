
void representa(char **GGAPrint,int sentencias, char *trama){
  int n=1;
  Estado=atoi(GGAPrint[5]);

  if(trama=="$GPGGA" && Estado==1){
  digitalWrite(13, HIGH);// indicamos que hay conexion satelite
  Serial.println("");
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
  /*for(n=0;n<sentencias;n++){
     Serial.println(GGAPrint[n]); 
    }*/
  }else{
   Serial.println("---------------------------------");
     Serial.print("| Seraching GPS satellites-->");
     Serial.print(GGAPrint[6]);
     Serial.println(" |");
   Serial.println("|----Waiting for 5 satellites---|");
   Serial.println("---------------------------------");  
  }
  
  

}
