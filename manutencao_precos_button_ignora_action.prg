#include "hmg.ch"

declare window manutencao_precos

Function manutencao_precos_button_ignora_action

   SETPROPERTY("manutencao_precos","text_preco","value",0)

   SETPROPERTY("manutencao_precos","button_busca","ENABLED",.t.)
   SETPROPERTY("manutencao_precos","text_busca","ENABLED",.t.)
   SETPROPERTY("manutencao_precos","button_salva","ENABLED",.f.)
   SETPROPERTY("manutencao_precos","button_ignora","ENABLED",.f.)
   SETPROPERTY("manutencao_precos","text_preco","ENABLED",.f.)

Return Nil
