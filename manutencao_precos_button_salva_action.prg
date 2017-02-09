#include "hmg.ch"

declare window manutencao_precos

Function manutencao_precos_button_salva_action

   nPos := GETPROPERTY("manutencao_precos","grid_data","value")
   
   aItem := GETPROPERTY("manutencao_precos","grid_data","item",nPos)
   
   cCodigo := GETPROPERTY("manutencao_precos","label_codigo","value")
   cPreco := ALLTRIM( STR( GETPROPERTY("manutencao_precos","text_preco","value") ) )
   
   cQuery := "SELECT count(idproduto) registro FROM precos WHERE idproduto = '" + cCodigo + "' LIMIT 1;"
   
   IF MySQL_Connect()
   
      IF MySQL_Database_Connect()
      
         aTable := MySQL_execQuery(oServer,cQuery)
      
      ENDIF
      
   ENDIF

   IF( aTable[1][1] == 0 )
   
      cQuery := "INSERT INTO precos (idproduto,preco) VALUES ('" + cCodigo + "','" + cPreco + "');"
   
   ELSE
   
      cQuery := "UPDATE precos SET preco = '" + cPreco + "' WHERE idproduto = '" + cCodigo + "' LIMIT 1;"
   
   ENDIF
   
   IF(MySQL_exec(oServer,cQuery))

      aItem[4] := VAL( cPreco )
   
      SETPROPERTY("manutencao_precos","grid_data","item",nPos,aItem)   
   
      manutencao_precos_button_ignora_action()     
      
      nPos++
      
      SETPROPERTY("manutencao_precos","grid_data","value",nPos)
      
      manutencao_precos_grid_data_ondblclick()
   
   ENDIF
   

   
Return Nil
