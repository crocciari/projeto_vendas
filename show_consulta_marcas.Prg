#include <hmg.ch>

DECLARE WINDOW consulta_marcas

FUNCTION show_consulta_marcas()

   IF IsWindowActive(consulta_marcas)
   
      doMethod("consulta_marcas","MINIMIZE")
      doMethod("consulta_marcas","RESTORE")
      doMethod("consulta_marcas","SETFOCUS")
   
   ELSE
   
      LOAD WINDOW consulta_marcas
      ACTIVATE WINDOW consulta_marcas
   
   ENDIF

RETURN nil