#include <hmg.ch>

FUNCTION getMarcas(cBusca,nLimit)
LOCAL aTable := {}

   cQuery := "SELECT id, marca, ativo, date_format(lastupdate,'%d/%m/%Y %H:%i:%s') lastupdate FROM marcas WHERE marca LIKE '%" + cBusca + "%' ORDER BY ativo DESC, marca LIMIT " + ALLTRIM(STR(nLimit)) + ";"

   IF MySQL_Connect()
   
      IF MySQL_Database_Connect()
      
         aTable := MySQL_execQuery(oServer,cQuery)
      
      ENDIF
      
   ENDIF
   
RETURN aTable