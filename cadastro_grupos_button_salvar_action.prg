#include "hmg.ch"

declare window cadastro_grupos

Function cadastro_grupos_button_salvar_action

	cCodigo := STR( GETPROPERTY("cadastro_grupos","text_codigo","value") )
	cGrupo := GETPROPERTY("cadastro_grupos","text_grupo","value")
	
	nPos := GETPROPERTY("cadastro_grupos","combo_ativo","value")
			
	IF(EMPTY(cGrupo))
		
		MSGSTOP("Preencha o nome do Grupo!")
		RETURN nil
		
	ENDIF
	
	IF(nPos==1)
		cAtivo := "S"
	ELSE
		cAtivo := "N"
	ENDIF
	
	IF( GETPROPERTY("cadastro_grupos","text_codigo","value") > 0 )
	
		cQuery := "UPDATE grupos SET grupo='" + cGrupo + "', ativo='" + cAtivo + "' WHERE id='" + cCodigo + "' LIMIT 1;"
	
	ELSE
	
		cQuery := "INSERT INTO grupos (grupo,ativo) VALUES ('" + cGrupo + "','" + cAtivo + "');"
	
	ENDIF
	
	IF MySQL_Connect() 
	
		IF MySQL_Database_Connect()
	
			IF MySQL_exec(oServer,cQuery)
			
				MSGINFO("Salvo com sucesso!");
				
				cadastro_grupos_button_novo_action()
				
			ELSE
			
				MSGSTOP("Não posso salvar!");
	
			ENDIF
			
		ENDIF
	
	ENDIF
	
	MySQL_Destroy()
	
Return Nil
