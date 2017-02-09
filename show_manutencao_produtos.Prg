#include <hmg.ch>

DECLARE WINDOW show_manutencao_produtos

FUNCTION show_manutencao_produtos()

   IF IsWindowActive(manutencao_produtos)
   
      doMethod("manutencao_produtos","MINIMIZE")
      doMethod("manutencao_produtos","RESTORE")
      doMethod("manutencao_produtos","SETFOCUS")
   
   ELSE
   
      LOAD WINDOW manutencao_produtos
      ACTIVATE WINDOW manutencao_produtos
   
   ENDIF

RETURN nil