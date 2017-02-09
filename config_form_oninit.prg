#include "hmg.ch"

declare window config

Function config_form_oninit

   SetProperty("config","text_hostname","value",pcHostName)
   SetProperty("config","text_database","value",pcDataBase)
   SetProperty("config","text_username","value",pcUserName)
   SetProperty("config","text_password","value",pcPassWord)

Return Nil
