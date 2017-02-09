#include <hmg.ch>

declare window manutencao_cidades

function manutencao_cidades_bloqueia_componentes(nEstado)

   IF(nEstado==1)
   
      SETPROPERTY("manutencao_cidades","text_codigo","ENABLED",.f.)
      SETPROPERTY("manutencao_cidades","text_cidade","ENABLED",.f.)
      SETPROPERTY("manutencao_cidades","combo_estado","ENABLED",.f.)
      SETPROPERTY("manutencao_cidades","button_ignorar","ENABLED",.f.)
      SETPROPERTY("manutencao_cidades","button_excluir","ENABLED",.f.)
      SETPROPERTY("manutencao_cidades","button_salvar","ENABLED",.f.)
   
   ELSEIF(nEstado==2)
      
      SETPROPERTY("manutencao_cidades","text_codigo","ENABLED",.f.)
      SETPROPERTY("manutencao_cidades","text_cidade","ENABLED",.t.)
      SETPROPERTY("manutencao_cidades","combo_estado","ENABLED",.t.)
      SETPROPERTY("manutencao_cidades","button_ignorar","ENABLED",.t.)
      SETPROPERTY("manutencao_cidades","button_excluir","ENABLED",.t.)
      SETPROPERTY("manutencao_cidades","button_salvar","ENABLED",.t.)
      
   ELSEIF(nEstado==3)
   
      SETPROPERTY("manutencao_cidades","text_codigo","ENABLED",.f.)
      SETPROPERTY("manutencao_cidades","text_cidade","ENABLED",.t.)
      SETPROPERTY("manutencao_cidades","combo_estado","ENABLED",.t.)
      SETPROPERTY("manutencao_cidades","button_ignorar","ENABLED",.t.)
      SETPROPERTY("manutencao_cidades","button_excluir","ENABLED",.f.)
      SETPROPERTY("manutencao_cidades","button_salvar","ENABLED",.t.)
   
   ENDIF
   
RETURN nil