  #include <SoftwareSerial.h>
  #include <Wire.h>
  #include <string.h>
  #include <stdio.h>
  
  // Constants
  #define rxPin 9      //rx pin in gps connection
  #define txPin 8      //tx pin in gps connection
  
  // set up the serial port
  
  SoftwareSerial gps = SoftwareSerial(rxPin, txPin);
  
  // variables
  byte byteGPS = 0;
  int i = 0;
  int h = 0;
  int PosLetra = 0;
  int varGPGGA = 0;
  
  
  // Buffers for data input
  char inBuffer[300] = "";
  char TramaGGA[100];
 
  
  
  void setup() {
  
  Serial.begin(9600);                                                        // Arduino serial port configuration
  delay(1000);
  
  Serial.println("--Cargando Configuracion Inicial--");
  Serial.flush();                                                            // Clear serial buffer
  pinMode(rxPin, INPUT);
  pinMode(txPin, OUTPUT);
  gps.begin(4800);
  }
  void loop() {
  memset(inBuffer,0,sizeof(inBuffer));//inicializa a cero la cadena para eliminar restos no deseados de lecturas anteriores
  memset(TramaGGA, 0, sizeof(TramaGGA));         //inicializa a cero la cadena para eliminar restos no deseados de lecturas anteriores
  byteGPS = 0;
  PosLetra = 0;
  byteGPS = gps.read();
  //buscamos la cadena original
  do
  {
    while(byteGPS != 'G'){
      byteGPS = gps.read();
    }
    byteGPS = gps.read();
  }
  while(byteGPS != 'A');
  varGPGGA = 1;
  
  TramaGGA[0]='G';
  TramaGGA[1]='P';
  TramaGGA[2]='G';
  TramaGGA[3]='G';
  TramaGGA[4]='A';
  
  i = 5;
  while(byteGPS != '*' && varGPGGA == 1){
  byteGPS = gps.read();
  TramaGGA[i]=byteGPS;
  i++;
  }
  TramaGGA[i]='\0';
  varGPGGA = 0;
  valores();
  /*
  // print the GGA sentence to USB
  Serial.print(i);
  Serial.print(" GGA sentence: ");
  h = 0;
  while(TramaGGA[h] != '\0'){
  Serial.print(TramaGGA[h],BYTE);
  
  h++;
  }
  Serial.print(h);
  Serial.println();
  */
  
  }
