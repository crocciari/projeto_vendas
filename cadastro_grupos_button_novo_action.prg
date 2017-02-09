#include "hmg.ch"

declare window cadastro_grupos

Function cadastro_grupos_button_novo_action

	SETPROPERTY("cadastro_grupos","text_codigo","value",0)
	SETPROPERTY("cadastro_grupos","text_grupo","value","")
	SETPROPERTY("cadastro_grupos","combo_ativo","value",1)
	
	SETPROPERTY("cadastro_grupos","text_codigo","ENABLED",.f.)
	SETPROPERTY("cadastro_grupos","button_excluir","ENABLED",.f.)
	
Return Nil
