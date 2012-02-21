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
  int varGPG = 0;
  int Estado = 0;
  
  
  // Buffers for data input
  char inBuffer[300] = "";
  char TramaGPG[100];

 
  
  
  void setup() {
  
  Serial.begin(9600);                                                        // Arduino serial port configuration
  delay(1000);
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);   // apagamos el led hasta tener señal satelite
  Serial.println("--------------------------------------");
  Serial.println("|---Cargando Configuracion Inicial---|");
  Serial.println("|-------Stirner GPS Loader 1.0-------|");
  Serial.println("|-Tiempo Aproximado para la conexion-|");
  Serial.println("|-------------10 minutos-------------|");
  Serial.println("--------------------------------------");
  delay(5000);
  Serial.flush();                                                            // Clear serial buffer
  pinMode(rxPin, INPUT);
  pinMode(txPin, OUTPUT);
  gps.begin(4800);
  
  }
  void loop() {
  memset(inBuffer,0,sizeof(inBuffer));//inicializa a cero la cadena para eliminar restos no deseados de lecturas anteriores
  memset(TramaGPG, 0, sizeof(TramaGPG));         //inicializa a cero la cadena para eliminar restos no deseados de lecturas anteriores
  byteGPS = 0;
  byteGPS = gps.read();
  //buscamos la cadena original
  
    while(byteGPS != '$'){
      byteGPS = gps.read();
    }
   
  
  i=1;
  TramaGPG[0] = '$';
  while(byteGPS != '*' ){
  byteGPS = gps.read();
  TramaGPG[i]=byteGPS;
  i++;
  }
  TramaGPG[i]='\0';
  //Serial.println(TramaGPG);
  valores();
  }
