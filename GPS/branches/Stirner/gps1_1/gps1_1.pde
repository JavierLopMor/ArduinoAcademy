  #include <SoftwareSerial.h>
  #include <LiquidCrystal_I2C.h>
  #include <Wire.h>
  #include <string.h>
  #include <stdio.h>
  #include <stdlib.h>
  
  // Constants
  #define rxPin 9      //rx pin in gps connection
  #define txPin 8      //tx pin in gps connection
  // set up the serial port
  
  SoftwareSerial gps = SoftwareSerial(rxPin, txPin);
  LiquidCrystal_I2C lcd(0x27,16,2);  // set the LCD address to 0x27 for a 16 chars and 2 line display

  
  // variables
  byte byteGPS = 0;
  int i = 0;
  int varGPG = 0;
  int Estado = 0;
  int menu = 1;
  int inPin = 7;                 // PIN del pulsador
  int value = 0;                 // estado del pulsador de menu
  
  // Buffers for data input
  //char inBuffer[300] = "";
  char TramaGPG[100];
  
  void setup() {
  Serial.begin(9600);   // Arduino serial port configuration
  lcd.init();                      // initialize the lcd 
  lcd.backlight();
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);   // apagamos el led hasta tener señal satelite
  pinMode(inPin, INPUT);    // Inicializa el pin 10 como entrada digital
  
  inicio();
  
  Serial.println("--------------------------------------");
  Serial.println("|-------Stirner GPS Loader 1.0-------|");
  Serial.println("|-Tiempo Aproximado para la conexion-|");
  Serial.println("|-------------10 minutos-------------|");
  Serial.println("--------------------------------------");
  Serial.flush();                                                            // Clear serial buffer
  pinMode(rxPin, INPUT);
  pinMode(txPin, OUTPUT);
  gps.begin(4800);
  gps.println("$PSTMINITGPS,4138.39329,N,00053.28085,W,272,23,02,2012,17,23,00");
  }
  void loop() {
  value = digitalRead(inPin);
  if(value==1){ //controlamos la pantalla de menu
    menu++;
    lcd.clear();
    if (menu==3){
      menu=1;
    }
  }
  //memset(inBuffer,0,sizeof(inBuffer));//inicializa a cero la cadena para eliminar restos no deseados de lecturas anteriores
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
