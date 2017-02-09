#include "hmg.ch"

declare window manutencao_produtos

Function manutencao_produtos_button_excluir_action

	nPos := GETPROPERTY("manutencao_produtos","grid_data","value")

	paTemp := GETPROPERTY("manutencao_produtos","grid_data","item", nPos)

   IF( manutencao_produtos_excluir_registro( ALLTRIM(STR(paTemp[1])) ) )
      manutencao_produtos_button_busca_action()
   ENDIF

Return Nil
