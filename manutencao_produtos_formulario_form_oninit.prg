#include "hmg.ch"

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

declare window manutencao_produtos_formulario

Function manutencao_produtos_formulario_form_oninit

   // a.id, a.produto, a.unidade, a.idgrupo, b.grupo, a.idmarca, c.marca, a.ativo
   // paTemp
   
   IF(LEN(paTemp)>0)
      
      SETPROPERTY("manutencao_produtos_formulario","text_codigo","value", ALLTRIM(STR(paTemp[1][1])))
      SETPROPERTY("manutencao_produtos_formulario","text_descricao","value" , paTemp[1][2])
      SETPROPERTY("manutencao_produtos_formulario","text_unidade","value", paTemp[1][3])
      SETPROPERTY("manutencao_produtos_formulario","text_idgrupo","value", ALLTRIM(STR(paTemp[1][4])))
      SETPROPERTY("manutencao_produtos_formulario","text_grupo","value" , paTemp[1][5])
      SETPROPERTY("manutencao_produtos_formulario","text_idmarca","value", ALLTRIM(STR(paTemp[1][6])))
      SETPROPERTY("manutencao_produtos_formulario","text_marca","value", paTemp[1][7])
      
      IF(paTemp[1][8]=="S")
         nPos := 1
      ELSE
         nPos := 2
      ENDIF
      
      SETPROPERTY("manutencao_produtos_formulario","combo_ativo","value" , nPos )

   ELSE
   
      SETPROPERTY("manutencao_produtos_formulario","text_codigo","value","")
      
   ENDIF
   
   SETPROPERTY("manutencao_produtos_formulario","text_codigo","ENABLED",.f.)
   SETPROPERTY("manutencao_produtos_formulario","text_idgrupo","ENABLED",.f.)
   SETPROPERTY("manutencao_produtos_formulario","text_grupo","ENABLED",.f.)
   SETPROPERTY("manutencao_produtos_formulario","text_idmarca","ENABLED",.f.)
   SETPROPERTY("manutencao_produtos_formulario","text_marca","ENABLED",.f.)
   
   IF(GETPROPERTY("manutencao_produtos_formulario","text_codigo","value")=="")
   
      SETPROPERTY("manutencao_produtos_formulario","button_excluir","ENABLED",.f.)
    
   ELSE
   
      SETPROPERTY("manutencao_produtos_formulario","button_excluir","ENABLED",.t.)
   
   ENDIF
   
Return Nil
