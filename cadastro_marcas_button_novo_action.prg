#include "hmg.ch"

declare window cadastro_marcas

Function cadastro_marcas_button_novo_action

	SETPROPERTY("cadastro_marcas","text_codigo","value",0)
	SETPROPERTY("cadastro_marcas","text_marca","value","")
	SETPROPERTY("cadastro_marcas","combo_ativo","value",1)
	
	SETPROPERTY("cadastro_marcas","text_codigo","ENABLED",.f.)
	SETPROPERTY("cadastro_marcas","button_excluir","ENABLED",.f.)
	
Return Nil
