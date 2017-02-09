#include "hmg.ch"

declare window manutencao_produtos

Function manutencao_produtos_button_alterar_action

   paTemp := {}

   nPos := GETPROPERTY("manutencao_produtos","grid_data","value")
   
   IF(nPos>0)

      array_data := GETPROPERTY("manutencao_produtos","grid_data","item",nPos)
   
      cQuery := "SELECT a.id, a.produto, a.unidade, a.idgrupo, b.grupo, a.idmarca, c.marca, a.ativo "+;
                "FROM produtos AS a "+;
                "LEFT JOIN grupos AS b ON b.id = a.idgrupo "+;
                "LEFT JOIN marcas AS c ON c.id = a.idmarca "+;
                "WHERE a.id = '" + ALLTRIM(STR(array_data[1])) + "' "+;
                "LIMIT 1;"
               
      IF MySQL_Connect()
   
         IF MySQL_Database_Connect()
         
            paTemp := MySQL_execQuery(oServer,cQuery)
         
         ENDIF
      
      ENDIF

      IF(LEN(paTemp)>0)
         show_manutencao_produtos_formulario()
      ELSE
         MSGSTOP("Impossível editar este registro!")
      ENDIF
      
   ENDIF
      
Return Nil
