#include "hmg.ch"

declare window manutencao_produtos_formulario

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

Function manutencao_produtos_formulario_button_busca_grupo_action

   show_consulta_grupos()
   
   IF(LEN(paTemp)>0)
   
      SETPROPERTY("manutencao_produtos_formulario","text_idgrupo","value",ALLTRIM(STR(paTemp[1])))
      SETPROPERTY("manutencao_produtos_formulario","text_grupo","value",paTemp[2])
   
   ENDIF

Return Nil
