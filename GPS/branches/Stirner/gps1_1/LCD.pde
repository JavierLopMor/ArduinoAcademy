
void inicio(){                      // funcion que nos lanza un banner inicial                        
  lcd.clear();                      // borramos la pantalla para quitar basura anterior
  lcd.setCursor(0, 0);              // posicionamos el cursor
  lcd.print("Cargando Config.");    // imprimimos la cadena
  lcd.setCursor(0, 1);              // posicionamos el cursor
  lcd.print("Inicial  Ver-1.1");    // imprimimos la cadena
  delay(2000);                      // hacemos una pausa aunque el gps seguira conectando
  lcd.clear();                      // borramos la pantalla
  lcd.setCursor(0, 0);              // posicionamos el cursor
  lcd.print("Inicial  Ver-1.1");    // imprimirmos la cadena
  lcd.setCursor(0, 1);              // posicionamos el cursor
  lcd.print("espere...  ");         // imprimimos la cadena
  lcd.blink();                      // dejamos el cursor parapadenando
  delay(1000);                      // hacemos una pausa aunque el gps seguira conectando
  lcd.clear();                      // borramos la pantalla para quitar basura anterior
}

void esperaGPS(char *NumSat){       // funcion que escribe la pantalla de espera
  lcd.setCursor(0, 0);              // posicionamos el cursor
  lcd.print("Esperando sat.");      // imprimirmos la cadena             
  lcd.setCursor(0, 1);              // posicionamos el cursor
  lcd.print("Num sat -> ");         // imprimirmos la cadena
  lcd.setCursor(11, 1);             // posicionamos el cursor
  lcd.print(NumSat);                // imprimimos la variable  
  lcd.print("  ");                  // imprimimos la cadena
  
}

void LongLat(char *Longitud, char *Brujula1, char *Latitud, char *Brujula2){  //recogemos los parametros de la funcion
  lcd.setCursor(0, 0);              // posicionamos el cursor
  lcd.print("Lat->");               // imprimimos la cadena
  lcd.print(Latitud[0]);            // imprimimos el primer caracter de la cadena
  lcd.print(Latitud[1]);            // imprimimos el segundo caracter de la cadena
  lcd.print(".");                   // imprimirmos la cadena
  lcd.print(Latitud[2]);            // imprimimos el tercer caracter de la cadena
  lcd.print(Latitud[3]);            // imprimimos el cuarto caracter de la cadena
  lcd.print("'");                   // imprimirmos la cadena
  lcd.print(Latitud[5]);            // imprimimos el quinto caracter de la cadena
  lcd.print(Latitud[6]);            // imprimimos el sexto caracter de la cadena
  lcd.print(" ");                   // imprimirmos la cadena
  lcd.print(Brujula2);              // imprimimos la variable
  lcd.setCursor(0, 1);              // posicionamos el cursor
  lcd.print("Lon->");               // imprimirmos la cadena
  lcd.print(Longitud[1]);           // imprimimos el primer caracter de la cadena
  lcd.print(Longitud[2]);           // imprimimos el segundo caracter de la cadena
  lcd.print(".");                   // imprimirmos la cadena
  lcd.print(Longitud[3]);           // imprimimos el tercer caracter de la cadena
  lcd.print(Longitud[4]);           // imprimimos el cuarto caracter de la cadena
  lcd.print("'");                   // imprimirmos la cadena
  lcd.print(Longitud[6]);           // imprimimos el quinto caracter de la cadena
  lcd.print(Longitud[7]);           // imprimimos el sexto caracter de la cadena
  lcd.print(" ");                   // imprimirmos la cadena
  lcd.print(Brujula1);              // imprimimos la variable
  lcd.setCursor(15, 1);             // posicionamos el cursor
}
void reloj(char *hora){             //recogemos los parametros de la funcion       
  lcd.setCursor(0, 1);              // posicionamos el cursor
  lcd.print("Hora-> ");             // imprimirmos la cadena
  lcd.print(hora[0]);               // imprimimos el primer caracter de la cadena
  lcd.print(hora[1]);               // imprimimos el segundo caracter de la cadena  
  lcd.print(":");                   // imprimirmos la cadena
  lcd.print(hora[2]);               // imprimimos el tercer caracter de la cadena
  lcd.print(hora[3]);               // imprimimos el cuarto caracter de la cadena
  lcd.print(":");                   // imprimirmos la cadena
  lcd.print(hora[4]);               // imprimimos el quinto caracter de la cadena
  lcd.print(hora[5]);               // imprimimos el sexto caracter de la cadena
  lcd.setCursor(16, 1);             // posicionamos el cursor
}
void altitud(char *altitud, char *unidades){    //recogemos los parametros de la funcion 
  lcd.setCursor(0, 0);              // posicionamos el cursor
  lcd.print("Atitud->");            // imprimirmos la cadena
  lcd.print(altitud);               // imprimimos la variable
  lcd.print(unidades);              // imprimimos la variable
}
