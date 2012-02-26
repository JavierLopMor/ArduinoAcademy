

void guardarCoordenadas()
{
  //Abrimos el archivo donde guardaremos las coordenadas
  misCoordenadas = SD.open("tracking.txt", FILE_WRITE);
 
  //Si el archivo esta abierto escribimos en el las coordenadas actuales
  if (misCoordenadas)
    {
        Serial.println("Guardando hora y posicion actual...");
        misCoordenadas.println("Aqui ponemos las coordenadas y la hora");
        
	// Cerramos el archivo:
        misCoordenadas.close();
        Serial.println("Guardado correcto");
    } 
  
  else 
    {
    // Si no se puede abrir el archivo, muestra un error
    Serial.println("error al abrir tracking.txt");
    }
  
  
  //Cargamos lo que hemos guarado.. solo debug
  delay(2000);
  
    // Abrimos el archivo para lectura;
  misCoordenadas = SD.open("tracking.txt");
  if (misMensajes) 
    {
      Serial.println("tracking.txt:");
    
      // lee el archivo hasta que no haya nada mas en el
      while (misCoordenadas.available()) 
        {
    	  Serial.write(misCoordenadas.read());
        }
    
      //cierra el archivo
      misCoordenadas.close();  
    }
    
  else 
    {
      // Si el archivo no se abre, nos muestra un error
      Serial.println("error abriendo tracking.txt");
    }
  
  
  
  
}
