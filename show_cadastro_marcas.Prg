#include <hmg.ch>

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

DECLARE WINDOW cadastro_marcas

FUNCTION show_cadastro_marcas()

   IF IsWindowActive(cadastro_marcas)
   
      doMethod("cadastro_marcas","MINIMIZE")
      doMethod("cadastro_marcas","RESTORE")
      doMethod("cadastro_marcas","SETFOCUS")
   
   ELSE
   
      LOAD WINDOW cadastro_marcas
      ACTIVATE WINDOW cadastro_marcas
   
   ENDIF

RETURN nil
