#include "hmg.ch"

declare window manutencao_cidades

Function manutencao_cidades_form_oninit

   enche_combo_estado("manutencao_cidades","combo_estado","MG")
   
   aHeader := { "Código", "Cidade", "Estado" }
   aColumnsControl := { pacNi, pacC, pacC }
   aWidths := { 10, 10, 10 }
   aJustify := { GRID_JTFY_LEFT, GRID_JTFY_LEFT, GRID_JTFY_CENTER }
   
   CATS_grid_redefine( "manutencao_cidades", "Grid_data", aHeader, aColumnsControl, aWidths, aJustify, "Courier New", 9 )
   
   manutencao_cidades_bloqueia_componentes(1)
   
   manutencao_cidades_button_busca_action()
   
Return Nil
