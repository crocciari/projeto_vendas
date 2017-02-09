#include "hmg.ch"

declare window config

Function config_button_salvar_action

   pcHostName := getProperty("config","text_hostname","value")
   pcDataBase := getProperty("config","text_database","value")
   pcUserName := getProperty("config","text_username","value")
   pcPassWord := getProperty("config","text_password","value")
   
   ini_salva()
   
   doMethod("config","release")

Return Nil
