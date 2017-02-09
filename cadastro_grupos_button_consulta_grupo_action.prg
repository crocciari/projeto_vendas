#include "hmg.ch"

declare window cadastro_grupos

Function cadastro_grupos_button_consulta_grupo_action

	show_consulta_grupos()
	
	IF IsWindowActive(cadastro_grupos)
			
		IF(LEN(paTemp)>0)
			SETPROPERTY("cadastro_grupos","text_codigo","value", paTemp[1])
			SETPROPERTY("cadastro_grupos","text_grupo","value",paTemp[2])
			SETPROPERTY("cadastro_grupos","combo_ativo","value",IF(paTemp[3]=="S",1,2) )
		ENDIF
		
		paTemp := {}
		
		SETPROPERTY("cadastro_grupos","button_excluir","ENABLED",.t.)
		
	ENDIF

Return Nil
