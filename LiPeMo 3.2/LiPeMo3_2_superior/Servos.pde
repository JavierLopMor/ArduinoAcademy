int AnguloSonar=90;
                //maximo 150
                //minimo 20
int Dcha=0,izq=0; //derecha es de 90 a 20
                //izquierda es de 90 a 150
int AnguloX=0;
int AnguloY=0;

void sonar(int paso){
    if((Dcha==0 && izq==0) || (Dcha==1 && izq==1)){
      Dcha=1;
      izq=0;
    }
    if(AnguloSonar>=150){
      Dcha=1;
      izq=0;
    }
    if(AnguloSonar<=20){
      Dcha=0;
      izq=1;
    }
    
    if(Dcha==1){
      AnguloSonar= AnguloSonar-paso;
    }
    if(izq==1){
      AnguloSonar= AnguloSonar+paso;
    }
   myservo.write(AnguloSonar);
}
void camaraXY(int X, int Y){
  
  myservo1.write(X);
  myservo2.write(Y);
  
}



