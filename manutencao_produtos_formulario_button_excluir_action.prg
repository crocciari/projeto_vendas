#include "hmg.ch"

declare window manutencao_produtos_formulario

Function manutencao_produtos_formulario_button_excluir_action
   
   cCodigo := GETPROPERTY("manutencao_produtos_formulario","text_codigo","value")
   
   IF(manutencao_produtos_excluir_registro(cCodigo))
   
      manutencao_produtos_button_busca_action()
   
      DOMETHOD("manutencao_produtos_formulario","RELEASE")
   
   ENDIF
   
Return Nil
