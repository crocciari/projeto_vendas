#include "hmg.ch"

declare window manutencao_produtos_formulario

Function manutencao_produtos_formulario_button_busca_marca_action

   show_consulta_marcas()
   
   IF(LEN(paTemp)>0)
   
      SETPROPERTY("manutencao_produtos_formulario","text_idmarca","value",ALLTRIM(STR(paTemp[1])))
      SETPROPERTY("manutencao_produtos_formulario","text_marca","value",paTemp[2])
   
   ENDIF

Return Nil
