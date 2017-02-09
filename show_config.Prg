#include <hmg.ch>

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

DECLARE WINDOW config

FUNCTION show_config()

   IF IsWindowActive(config)
   
      doMethod("config","MINIMIZE")
      doMethod("config","RESTORE")
      doMethod("config","SETFOCUS")
   
   ELSE
   
      LOAD WINDOW config
      ACTIVATE WINDOW config
   
   ENDIF

RETURN nil
