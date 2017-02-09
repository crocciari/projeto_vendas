#include <hmg.ch>

FUNCTION getProdutos(cBusca,nLimit)
LOCAL aTable := {}

   cQuery := "SELECT a.id, a.produto, a.unidade, b.grupo, c.marca " +;
               "FROM produtos AS a " +;
               "LEFT JOIN grupos AS b ON b.id = a.idgrupo " +;
               "LEFT JOIN marcas AS c ON c.id = a.idmarca " +;
               "WHERE a.produto LIKE '%" + cBusca + "%' " +;
               "ORDER BY a.produto " +;
               "LIMIT " + ALLTRIM(STR(nLimit)) + ";"

   IF MySQL_Connect()
   
      IF MySQL_Database_Connect()
      
         aTable := MySQL_execQuery(oServer,cQuery)
      
      ENDIF
      
   ENDIF
   
RETURN aTable