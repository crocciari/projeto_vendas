#include "hmg.ch"

declare window manutencao_produtos

Function manutencao_produtos_button_busca_action

   cBusca := getProperty("manutencao_produtos","text_busca","value")
   nLimit := getProperty("manutencao_produtos","spinner_registros","value")

   aTable := getProdutos(cBusca,nLimit)
   
   CATS_grid_add("manutencao_produtos", "grid_data", aTable)
   CATS_grid_size_column("manutencao_produtos","grid_data")

   

Return Nil
