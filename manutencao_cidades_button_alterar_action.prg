#include "hmg.ch"

declare window manutencao_cidades

Function manutencao_cidades_button_alterar_action
   LOCAL nPosEstado := 1
   
   manutencao_cidades_bloqueia_componentes(2)

   nPosicao := GETPROPERTY("manutencao_cidades","grid_data","value")
   
   aItem := GETPROPERTY("manutencao_cidades","grid_data","item",nPosicao)
   
   SETPROPERTY("manutencao_cidades","text_codigo","value", ALLTRIM(STR(aItem[1])) )
   SETPROPERTY("manutencao_cidades","text_cidade","value", aItem[2] )
   
   nPos := GETPROPERTY("manutencao_cidades","combo_estado","itemcount")
   FOR a := 1 TO nPos
      IF( SUBSTR(GETPROPERTY("manutencao_cidades","combo_estado","item",a),1,2) == aItem[3] )
         nPosEstado := a
      ENDIF
   NEXT
   
   SETPROPERTY("manutencao_cidades","combo_estado","value", nPosEstado )
      
Return Nil
