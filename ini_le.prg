#include <hmg.ch>

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//


FUNCTION ini_le()

   IF( !FILE( pcFileIni ) )
         ini_salva()
   ENDIF
   
   BEGIN INI FILE pcFileIni
   
      GET pcHostName SECTION "server" ENTRY "hostname"
      GET pcDataBase SECTION "server" ENTRY "database"
      GET pcUserName SECTION "server" ENTRY "username"
      GET pcPassWord SECTION "server" ENTRY "password"
      
   END INI
   
RETURN nil
