#include "hmg.ch"

declare window consulta_grupos

Function consulta_grupos_form_oninit

   aHeader := { "Código", "Grupo", "Ativo", "Última Alteração" }
   aColumnsControl := { pacNi, pacC, pacC, pacC }
   aWidths := { 10, 10, 10, 10 }
   aJustify := { GRID_JTFY_LEFT, GRID_JTFY_LEFT, GRID_JTFY_CENTER, GRID_JTFY_CENTER }
   
   CATS_grid_redefine( "consulta_grupos", "Grid_data", aHeader, aColumnsControl, aWidths, aJustify, "Courier New", 9 )

   consulta_grupos_busca()
   
Return Nil
