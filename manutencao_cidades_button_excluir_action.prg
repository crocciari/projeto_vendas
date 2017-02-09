#include "hmg.ch"

declare window manutencao_cidades

Function manutencao_cidades_button_excluir_action

   cCodigo := GETPROPERTY("manutencao_cidades","text_codigo","value")
   
   IF( EMPTY(cCodigo) )
      MSGSTOP("Escolha um registro para ser excluído")
      RETURN nil
   ENDIF
   
   cQuery := "DELETE FROM cidades WHERE id = '" + cCodigo + "' LIMIT 1;"
   
   IF !MySQL_exec(oServer,cQuery)
      RETURN Nil
   ENDIF
   
   manutencao_cidades_button_busca_action()
   
   manutencao_cidades_button_novo_action()
   
   manutencao_cidades_bloqueia_componentes(3)

Return Nil
