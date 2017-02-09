#include "hmg.ch"

declare window manutencao_precos

Function manutencao_precos_button_busca_action

   nLimit := GETPROPERTY("manutencao_precos","spinner_registros","value")
   cBusca := GETPROPERTY("manutencao_precos","text_busca","value")

	cQuery := "SELECT a.id, a.produto, a.unidade, IF(b.preco IS NULL, 0, b.preco) preco " +;
            "FROM produtos AS a "+;
            "LEFT JOIN precos AS b ON b.idproduto = a.id " +;
            "WHERE a.produto LIKE '%" + cBusca + "%' " +;
            "LIMIT " + ALLTRIM( STR( nLimit ) ) + ";"
       
   IF MySQL_Connect()
   
      IF MySQL_Database_Connect()
      
         aTable := MySQL_execQuery(oServer,cQuery)
      
      ENDIF
      
   ENDIF
   
   CATS_grid_add("manutencao_precos", "grid_data", aTable)
   CATS_grid_size_column("manutencao_precos","grid_data")
            
Return Nil
