#include <hmg.ch>

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

DECLARE WINDOW cadastro_grupos

FUNCTION show_cadastro_grupos()

   IF IsWindowActive(cadastro_grupos)
   
      doMethod("cadastro_grupos","MINIMIZE")
      doMethod("cadastro_grupos","RESTORE")
      doMethod("cadastro_grupos","SETFOCUS")
   
   ELSE
   
      LOAD WINDOW cadastro_grupos
      ACTIVATE WINDOW cadastro_grupos
   
   ENDIF

RETURN nil
