#include "hmg.ch"

declare window config

Function config_button_teste_action

   hostname = getProperty("config","text_hostname","value")
   username = getProperty("config","text_username","value")
   password = getProperty("config","text_password","value")
   database = getProperty("config","text_database","value")
   
   // conecta com o servidor do banco de dados
   IF MySQL_Connect(hostname,username,password)
   
      // conecta com o banco de dados 
      IF MySQL_Database_Connect(database)
      
         MSGINFO("Conexão com o Servidor bem sucedido!")
      
      ELSE
         MSGSTOP("Banco de dados [" + database + "] não localizado!","SQL")
      ENDIF
   
   
   ELSE
   
      MSGSTOP("Servidor [" + hostname + "] não conectado!","SQL")
   
   ENDIF
   
   MySQL_Destroy()

Return Nil
