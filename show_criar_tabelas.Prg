#include <hmg.ch>

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

DECLARE WINDOW criar_tabelas

FUNCTION show_criar_tabelas()

   IF IsWindowActive(criar_tabelas)
   
      doMethod("criar_tabelas","MINIMIZE")
      doMethod("criar_tabelas","RESTORE")
      doMethod("criar_tabelas","SETFOCUS")
   
   ELSE
   
      LOAD WINDOW criar_tabelas
      ACTIVATE WINDOW criar_tabelas
   
   ENDIF

RETURN nil
