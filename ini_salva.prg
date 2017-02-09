#include <hmg.ch>

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

FUNCTION ini_salva()

   BEGIN INI FILE pcFileIni

      SET SECTION "server" ENTRY "hostname" TO pcHostName
      SET SECTION "server" ENTRY "database" TO pcDataBase
      SET SECTION "server" ENTRY "username" TO pcUserName
      SET SECTION "server" ENTRY "password" TO pcPassWord
   
   END INI

RETURN nil
