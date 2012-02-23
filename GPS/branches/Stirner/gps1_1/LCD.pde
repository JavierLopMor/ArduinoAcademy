
void inicio(){
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Cargando Config.");
  lcd.setCursor(0, 1);
  lcd.print("Inicial  Ver-1.1");
  delay(2000);
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Inicial  Ver-1.1");
  lcd.setCursor(0, 1);
  lcd.print("espere...  ");
  lcd.blink();
  delay(1000);
  lcd.clear();
}

void esperaGPS(char *NumSat){
  lcd.setCursor(0, 0);
  lcd.print("Esperando sat.");
  lcd.setCursor(15, 0);
  //lcd.write(1);
  lcd.setCursor(0, 1);
  lcd.print("Num sat -> ");
  lcd.setCursor(11, 1);
  lcd.print(NumSat); 
  lcd.print("  ");
  
}

void LongLat(char *Longitud, char *Brujula1, char *Latitud, char *Brujula2){
  lcd.setCursor(0, 0);
  //Latitud ="4138.39329";
  //Longitud ="00053.28085";
  lcd.setCursor(0,0);
  lcd.print(Latitud[0]);
  lcd.print(Latitud[1]);
  lcd.print(".");
  lcd.print(Latitud[2]);
  lcd.print(Latitud[3]);
  lcd.print("'");
  lcd.print(Latitud[5]);
  lcd.print(Latitud[6]);
  lcd.print(" ");
  lcd.print(Brujula1);
  lcd.setCursor(0, 1);
  lcd.print(Longitud[1]);
  lcd.print(Longitud[2]);
  lcd.print(".");
  lcd.print(Longitud[3]);
  lcd.print(Longitud[4]);
  lcd.print("'");
  lcd.print(Longitud[6]);
  lcd.print(Longitud[7]);
  lcd.print(" ");
  lcd.print(Brujula1);
  lcd.setCursor(15, 1);
}
