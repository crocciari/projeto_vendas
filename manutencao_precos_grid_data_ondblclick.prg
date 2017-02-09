#include "hmg.ch"

declare window manutencao_precos

Function manutencao_precos_grid_data_ondblclick

   SETPROPERTY("manutencao_precos","button_busca","ENABLED",.f.)
   SETPROPERTY("manutencao_precos","text_busca","ENABLED",.f.)
   SETPROPERTY("manutencao_precos","button_salva","ENABLED",.t.)
   SETPROPERTY("manutencao_precos","button_ignora","ENABLED",.t.)
   SETPROPERTY("manutencao_precos","text_preco","ENABLED",.t.)
   
   nPos := GETPROPERTY("manutencao_precos","grid_data","value")
   
   aItem := GETPROPERTY("manutencao_precos","grid_data","item",nPos)
	
   cQuery := "SELECT a.produto, a.unidade, IF(b.preco IS NULL, 0, b.preco) preco "+;
               "FROM produtos AS a "+;
               "LEFT JOIN precos AS b ON b.idproduto = a.id "+;
               "WHERE a.id = '" + ALLTRIM( STR( aItem[1] ) ) + "' "+;
               "LIMIT 1;"
               
    
   IF MySQL_Connect()
   
      IF MySQL_Database_Connect()
      
         aTable := MySQL_execQuery(oServer,cQuery)
      
      ENDIF
      
   ENDIF
   
   SETPROPERTY("manutencao_precos","label_produto","value", aTable[1][1] )
   SETPROPERTY("manutencao_precos","label_preco","value", ALLTRIM( STR( aTable[1][3] ) ) )
   SETPROPERTY("manutencao_precos","text_preco","value", aTable[1][3] )
   
   aItem[2] := aTable[1][1]
   aItem[3] := aTable[1][2]
   aItem[4] := aTable[1][3]
   
   SETPROPERTY("manutencao_precos","grid_data","item",nPos,aItem)
   
   DOMETHOD("manutencao_precos","text_preco","SETFOCUS")
   
Return Nil
