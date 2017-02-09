#include <hmg.ch>

DECLARE WINDOW show_manutencao_produtos_formulario

FUNCTION show_manutencao_produtos_formulario()

   IF IsWindowActive(manutencao_produtos_formulario)
   
      doMethod("manutencao_produtos_formulario","MINIMIZE")
      doMethod("manutencao_produtos_formulario","RESTORE")
      doMethod("manutencao_produtos_formulario","SETFOCUS")
   
   ELSE
   
      LOAD WINDOW manutencao_produtos_formulario
      ACTIVATE WINDOW manutencao_produtos_formulario
   
   ENDIF

RETURN nil