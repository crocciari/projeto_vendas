#include "hmg.ch"

declare window manutencao_cidades

Function manutencao_cidades_button_busca_action
   LOCAL cBusca, nLimit := 1, aTable := {}
   
   cBusca := GETPROPERTY("manutencao_cidades","text_busca","value")
   
   nLimit := GETPROPERTY("manutencao_cidades","spinner_registros","value")

   cQuery := "SELECT id, cidade, estado " +;
             "FROM cidades " +;
             "WHERE cidade LIKE '%" + cBusca + "%'" +;
             "ORDER BY cidade " +;
             "LIMIT " + ALLTRIM(STR(nLimit)) + ";"
             
   IF MySQL_Connect()
   
      IF MySQL_Database_Connect()
      
         aTable := MySQL_execQuery(oServer,cQuery)
      
      ENDIF
      
   ENDIF
   
   
   CATS_grid_add("manutencao_cidades", "grid_data", aTable)
   CATS_grid_size_column("manutencao_cidades","grid_data")

Return Nil
