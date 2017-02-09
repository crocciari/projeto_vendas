#include "hmg.ch"

declare window cadastro_marcas

Function cadastro_marcas_button_busca_action

	show_consulta_marcas()
	
	IF IsWindowActive(cadastro_marcas)
			
		IF(LEN(paTemp)>0)
			SETPROPERTY("cadastro_marcas","text_codigo","value", paTemp[1])
			SETPROPERTY("cadastro_marcas","text_marca","value",paTemp[2])
			SETPROPERTY("cadastro_marcas","combo_ativo","value",IF(paTemp[3]=="S",1,2) )
		ENDIF
		
		paTemp := {}
		
		SETPROPERTY("cadastro_marcas","button_excluir","ENABLED",.t.)
		
	ENDIF

Return Nil
