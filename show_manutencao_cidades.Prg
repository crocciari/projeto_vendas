#include <hmg.ch>

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

DECLARE WINDOW manutencao_cidades

FUNCTION show_manutencao_cidades()

   IF IsWindowActive(manutencao_cidades)
   
      doMethod("manutencao_cidades","MINIMIZE")
      doMethod("manutencao_cidades","RESTORE")
      doMethod("manutencao_cidades","SETFOCUS")
   
   ELSE
   
      LOAD WINDOW manutencao_cidades
      ACTIVATE WINDOW manutencao_cidades
   
   ENDIF

RETURN nil
