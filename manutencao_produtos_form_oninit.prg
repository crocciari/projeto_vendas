#include "hmg.ch"

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

declare window manutencao_produtos

Function manutencao_produtos_form_oninit

   aHeader := { "Código", "Produto", "Unidade", "Grupo", "Marca" }
   aColumnsControl := { pacNi, pacC, pacC, pacC, pacC }
   aWidths := { 10, 10, 10, 10, 10 }
   aJustify := { GRID_JTFY_RIGHT, GRID_JTFY_LEFT, GRID_JTFY_CENTER, GRID_JTFY_CENTER, GRID_JTFY_CENTER }
   
   CATS_grid_redefine( "manutencao_produtos", "Grid_data", aHeader, aColumnsControl, aWidths, aJustify, "Courier New", 9 )

   manutencao_produtos_button_busca_action()

Return Nil
