 
void cargarMensaje()
{
  // Abrimos el archivo para lectura;
  misMensajes = SD.open("mensajes.txt");
  if (misMensajes) 
    {
      Serial.println("mensajes.txt:");
    
      // lee el archivo hasta que no haya nada mas en el
      while (misMensajes.available()) 
        {
    	  Serial.write(misMensajes.read());
        }
    
      //cierra el archivo
      misMensajes.close();  
    }
    
  else 
    {
      // Si el archivo no se abre, nos muestra un error
      Serial.println("error abriendo mensajes.txt");
    }
}
