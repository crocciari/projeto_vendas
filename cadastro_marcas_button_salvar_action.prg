#include "hmg.ch"

declare window cadastro_marcas

Function cadastro_marcas_button_salvar_action

	cCodigo := STR( GETPROPERTY("cadastro_marcas","text_codigo","value") )
	cMarca := GETPROPERTY("cadastro_marcas","text_marca","value")
	
	nPos := GETPROPERTY("cadastro_marcas","combo_ativo","value")
			
	IF(EMPTY(cMarca))
		
		MSGSTOP("Preencha o nome da Marca!")
		RETURN nil
		
	ENDIF
	
	IF(nPos==1)
		cAtivo := "S"
	ELSE
		cAtivo := "N"
	ENDIF
	
	IF( GETPROPERTY("cadastro_marcas","text_codigo","value") > 0 )
	
		cQuery := "UPDATE marcas SET marca='" + cMarca + "', ativo='" + cAtivo + "' WHERE id='" + cCodigo + "' LIMIT 1;"
	
	ELSE
	
		cQuery := "INSERT INTO marcas (marca,ativo) VALUES ('" + cMarca + "','" + cAtivo + "');"
	
	ENDIF
	
	IF MySQL_Connect() 
	
		IF MySQL_Database_Connect()
	
			IF MySQL_exec(oServer,cQuery)
			
				MSGINFO("Salvo com sucesso!");
				
				cadastro_marcas_button_novo_action()
				
			ELSE
			
				MSGSTOP("Não posso salvar!");
	
			ENDIF
			
		ENDIF
	
	ENDIF
	
	MySQL_Destroy()
	
Return Nil
