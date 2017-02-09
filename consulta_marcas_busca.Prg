#include <hmg.ch>

declare window consulta_marcas

FUNCTION consulta_marcas_busca()

   cBusca := getProperty("consulta_marcas","text_busca","value")
   nLimit := getProperty("consulta_marcas","spinner_registros","value")

   aTable := getMarcas(cBusca,nLimit)
   
   CATS_grid_add("consulta_marcas", "grid_data", aTable)
   CATS_grid_size_column("consulta_marcas","grid_data")

RETURN nil