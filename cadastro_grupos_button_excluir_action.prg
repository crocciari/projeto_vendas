#include "hmg.ch"

declare window cadastro_grupos

Function cadastro_grupos_button_excluir_action

	cCodigo := STR( GETPROPERTY("cadastro_grupos","text_codigo","value") )
	
	IF( GETPROPERTY("cadastro_grupos","text_codigo","value") > 0 )
	
		cQuery := "DELETE FROM grupos WHERE id='" +  cCodigo +"' LIMIT 1;"
		
		IF MySQL_Connect() 
		
			IF MySQL_Database_Connect()
		
				IF MySQL_exec(oServer,cQuery)
				
					MSGINFO("Registro [" + cCodigo + "] removido com sucesso!");
					
					cadastro_grupos_button_novo_action()
					
				ELSE
				
					MSGSTOP("Não posso remover o registro [" + cCodigo + "]!");
		
				ENDIF
				
			ENDIF
		
		ENDIF
		
		MySQL_Destroy()
	
	ELSE
	
		MSGSTOP("Não posso remover esse registro [" + cCodigo + "]")
	
	ENDIF

Return Nil
