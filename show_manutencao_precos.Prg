#include <hmg.ch>

DECLARE WINDOW manutencao_precos

FUNCTION show_manutencao_precos()

   IF IsWindowActive(manutencao_precos)
   
      doMethod("manutencao_precos","MINIMIZE")
      doMethod("manutencao_precos","RESTORE")
      doMethod("manutencao_precos","SETFOCUS")
   
   ELSE
   
      LOAD WINDOW manutencao_precos
      ACTIVATE WINDOW manutencao_precos
   
   ENDIF

RETURN nil