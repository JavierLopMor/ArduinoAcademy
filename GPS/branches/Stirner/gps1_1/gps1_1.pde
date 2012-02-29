  #include <SoftwareSerial.h>
  #include <LiquidCrystal_I2C.h>
  #include <Wire.h>
  #include <string.h>
  #include <stdio.h>
  #include <stdlib.h>
  
  // Constants
  #define rxPin 7      //rx pin in gps connection
  #define txPin 6      //tx pin in gps connection
  // set up the serial port
  
  SoftwareSerial gps = SoftwareSerial(rxPin, txPin); //llamada a la libreria SoftwareSerial para configurar los pines RX TX
  LiquidCrystal_I2C lcd(0x27,16,2);  // establecer la dirección de LCD 0x27 por 16 caracteres y 2 líneas

  
  // variables
  byte byteGPS = 0;              // donde guardaremos cada byte que leamos del gps
  int i = 0;                     // variable que utilizaremos como acumulador
  int Estado = 0;                // nos guardamos el estado de la conexion
  int menu = 1;
  int inPin = 5;                 // PIN del pulsador
  int value = 0;                 // estado del pulsador de menu
  char TramaGPG[100];            // aqui iremos almacenando los bytes leidos del GPS 
  
  void setup() {
      Serial.begin(9600);        // Configuracion del puerto de arduino
      lcd.init();                // inicializamos el LCD 
      lcd.backlight();           // encendemos la iluminacion trasera del LDCD
      pinMode(13, OUTPUT);       // configuramos el pin 13 para el LED de la placa
      digitalWrite(13, LOW);     // apagamos el led hasta tener señal satelite
      pinMode(inPin, INPUT);     // Inicializa el pin 5 como entrada digital
      inicio();                  // Llama a intro de LCD
      Serial.flush();            // Borramos el buffer del serial
      pinMode(rxPin, INPUT);     // Configuramos los pines del GPS para poder leer
      pinMode(txPin, OUTPUT);    // y poder escribir en el...
      gps.begin(4800);           // finalmente establecemos la velocidad de comunicacion con el GPS
  
  }
  
  
  void loop() {
    value = digitalRead(inPin);  // leemos el estado del pulsador que tenemos en el circuito
      if(value==1){              // si esta a 1 significa que esta pulsado por lo que 
        menu++;                  // sumamos 1 a menu (para los menus que tenemos en el LCD
        lcd.clear();             // borramos el LCD
        if (menu==3){            // si el menu toma valor 3 significa que esta a final de los menus 
          menu=1;                // por lo que lo reiniciamos
      }
  }
  //memset(cadena,0,sizeof(cadena));             // inicializa a cero la cadena para eliminar restos no deseados de lecturas anteriores
  memset(TramaGPG, 0, sizeof(TramaGPG));         // inicializa a cero la cadena para eliminar restos no deseados de lecturas anteriores
  byteGPS = 0;                                   // limpiamos el posible contenido 
  byteGPS = gps.read();                          // leemos el byte que tenemos en la entrada desde el GPS
  
  //buscamos la cadena deseada
    while(byteGPS != '$'){                       // mientras el byte que tengamos leido no sea igual a $
      byteGPS = gps.read();                      // leeremos el siguiente caracter
    }
   
  
  i=1;                                           // inicializamos a uno el contador
  TramaGPG[0] = '$';                             // y colocamos el $ en la primera posicion de nuestra cadena de caracteres
    while(byteGPS != '*' ){                      // mientras el caracter leido no sea igual a * 
      byteGPS = gps.read();                      // leeremos el siguiente caracter
      TramaGPG[i]=byteGPS;                       // y lo almacenaremos en la cadena de caracteres en la posicion que corresponda
      i++;                                       // e incrementamos en uno el contador
    }
  TramaGPG[i]='\0';                              // para evitar porblemas añadiremos nosotros manualmente el caracter de fin de linea 
  valores();                                     // llamamos a la funcion que manipula nuestra cadena
  }
