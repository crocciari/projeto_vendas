#include "hmg.ch"

declare window manutencao_precos

Function manutencao_precos_grid_data_onchange

   nPos := GETPROPERTY("manutencao_precos","grid_data","value")
   
   aItem := GETPROPERTY("manutencao_precos","grid_data","item",nPos)
   
   SETPROPERTY("manutencao_precos","label_codigo","value", ALLTRIM( STR( aItem[1] ) ) )
   SETPROPERTY("manutencao_precos","label_produto","value", aItem[2] )
   SETPROPERTY("manutencao_precos","label_preco","value", ALLTRIM( STR( aItem[4] ) ) )

   manutencao_precos_button_ignora_action()
   
Return Nil
