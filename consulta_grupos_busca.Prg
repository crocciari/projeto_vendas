#include <hmg.ch>

declare window consulta_grupos

FUNCTION consulta_grupos_busca()

   cBusca := getProperty("consulta_grupos","text_busca","value")
   nLimit := getProperty("consulta_grupos","spinner_registros","value")

   aTable := getGrupos(cBusca,nLimit)
   
   CATS_grid_add("consulta_grupos", "grid_data", aTable)
   CATS_grid_size_column("consulta_grupos","grid_data")

RETURN nil