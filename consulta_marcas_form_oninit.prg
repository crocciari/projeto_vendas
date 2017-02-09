#include "hmg.ch"

declare window consulta_marcas

Function consulta_marcas_form_oninit

   aHeader := { "Código", "Marca", "Ativo", "Última Alteração" }
   aColumnsControl := { pacNi, pacC, pacC, pacC }
   aWidths := { 10, 10, 10, 10 }
   aJustify := { GRID_JTFY_RIGHT, GRID_JTFY_LEFT, GRID_JTFY_CENTER, GRID_JTFY_CENTER }
   
   CATS_grid_redefine( "consulta_marcas", "Grid_data", aHeader, aColumnsControl, aWidths, aJustify, "Courier New", 9 )

   consulta_marcas_busca()

Return Nil
