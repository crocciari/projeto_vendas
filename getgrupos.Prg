#include <hmg.ch>

FUNCTION getGrupos(cBusca,nLimit)
LOCAL aTable := {}

   cQuery := "SELECT id, grupo, ativo, date_format(lastupdate,'%d/%m/%Y %H:%i:%s') lastupdate FROM grupos WHERE grupo LIKE '%" + cBusca + "%' ORDER BY ativo DESC, grupo LIMIT " + ALLTRIM(STR(nLimit)) + ";"

   IF MySQL_Connect()
   
      IF MySQL_Database_Connect()
      
         aTable := MySQL_execQuery(oServer,cQuery)
      
      ENDIF
      
   ENDIF
   
RETURN aTable