#include "hmg.ch"

declare window manutencao_precos

Function manutencao_precos_form_oninit

   aHeader := { "Código", "Produto", "Unidade", "Preço" }
   aColumnsControl := { pacNi, pacC, pacC, pacNc }
   aWidths := { 10, 10, 10, 10 }
   aJustify := { GRID_JTFY_LEFT, GRID_JTFY_LEFT, GRID_JTFY_CENTER, GRID_JTFY_RIGHT }
   
   CATS_grid_redefine( "manutencao_precos", "Grid_data", aHeader, aColumnsControl, aWidths, aJustify, "Courier New", 9 )

   manutencao_precos_button_ignora_action()
   manutencao_precos_button_busca_action()
   
Return Nil
