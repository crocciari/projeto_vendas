#include <hmg.ch>

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

DECLARE WINDOW consulta_grupos

FUNCTION show_consulta_grupos()

   IF IsWindowActive(consulta_grupos)
   
      doMethod("consulta_grupos","MINIMIZE")
      doMethod("consulta_grupos","RESTORE")
      doMethod("consulta_grupos","SETFOCUS")
   
   ELSE
   
      LOAD WINDOW consulta_grupos
      ACTIVATE WINDOW consulta_grupos
   
   ENDIF

RETURN nil
