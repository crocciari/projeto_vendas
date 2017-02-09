#include "hmg.ch"

declare window manutencao_cidades

Function manutencao_cidades_button_novo_action

   manutencao_cidades_bloqueia_componentes(3)

   SETPROPERTY("manutencao_cidades","text_codigo","value","")
   SETPROPERTY("manutencao_cidades","text_cidade","value","")
   
   DOMETHOD("manutencao_cidades","text_cidade","SEFOCUS")

Return Nil
