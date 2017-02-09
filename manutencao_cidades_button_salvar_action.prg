#include "hmg.ch"

declare window manutencao_cidades

Function manutencao_cidades_button_salvar_action

   cCodigo := GETPROPERTY("manutencao_cidades","text_codigo","value")
   cCidade := GETPROPERTY("manutencao_cidades","text_cidade","value")
   
   nPosicao := GETPROPERTY("manutencao_cidades","combo_estado","value")
   cEstado := GETPROPERTY("manutencao_cidades","combo_estado","item",nPosicao)
   
   cEstado := SUBSTR( cEstado, 1, 2 )
   
   IF( EMPTY( cCidade ) )
      MSGSTOP("Preencha uma cidade")
      RETURN nil
   ENDIF
   
   IF( EMPTY(cCodigo) )
      
      cQUERY := "INSERT INTO cidades "+;
                "(cidade,estado) VALUES ('" + cCidade + "','" + cEstado + "');"
   
   ELSE
   
      cQuery := "UPDATE cidades SET cidade = '" + cCidade + "', estado = '" + cEstado + "' WHERE id = '" + cCodigo + "' LIMIT 1;"
   
   ENDIF
   
   IF !MySQL_exec(oServer,cQuery)
      RETURN Nil
   ENDIF
   
   manutencao_cidades_button_busca_action()
   manutencao_cidades_button_novo_action()
      
   manutencao_cidades_bloqueia_componentes(1)
   
Return Nil
