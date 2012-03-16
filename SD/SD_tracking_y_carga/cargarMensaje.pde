 
void cargarMensaje()
{
   byte byteMensaje = 0;
   int x=0;
  
  // Abrimos el archivo para lectura;
  misMensajes = SD.open("mensajes.txt");
  if (misMensajes) 
    {
      Serial.println("Leyendo mensajes.txt\n");
      
      // lee el archivo hasta que no haya nada mas en el
      while (misMensajes.available()) 
        {
          byteMensaje = misMensajes.read();
          mensaje[x]=byteMensaje;
          x++;
        } 
      mensaje[x]='\0'; 
    }
    
   else 
    {
      // Si el archivo no se abre, nos muestra un error
      Serial.println("error abriendo mensajes.txt\n");
    }
    
    //pa probar q lo ha cargao bien en el array  
  for(int z=0; z<=55; z++)
    {
      Serial.print(mensaje[z]);
    }

  //cierra el archivo
  misMensajes.close();
  Serial.println("\n");
  Serial.println("######################################################\n");
 }

