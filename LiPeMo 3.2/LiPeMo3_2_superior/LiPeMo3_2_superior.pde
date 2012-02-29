#include <Wire.h>
#include <string.h>
#include <stdio.h>
#include <Servo.h>
#undef int

uint8_t outbuf[6];		 // array to store arduino output

int cnt = 0;                     //contador para el acelerometro
int ledPin = 13;
int ledPosicion = 15;            //colocamos en la analogica 1 la luz
Servo myservo; 
Servo myservo1;
Servo myservo2;

void setup ()
{
  Serial.begin(9600);
  Wire.begin ();		 // join i2c bus with address 0x52
  nunchuck_init ();              // send the initilization handshake
  pinMode(ledPosicion, OUTPUT);   
  myservo.attach(8);           //radar
  myservo1.attach(7);           //camara giro
  myservo2.attach(13);           //camara cabeceo 
}

void loop(){
  //wii();
  luz(0);//0 luz apagada , 1 luz encendida
  sonar(0); //el numero indica el grado de giro entre salto y salto
  camaraXY(90,90);
  
  
}
