void luz(int interruptor)
{
  if(interruptor ==1){
  digitalWrite(ledPosicion, HIGH);  
  }
  if(interruptor == 0){
    digitalWrite(ledPosicion, LOW);
  }  
  
}
