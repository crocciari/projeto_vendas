#include <hmg.ch>

function manutencao_produtos_excluir_registro(cCodigo)

   bRetorno := .f.
   
   IF(cCodigo=="")
      MSGSTOP("N�o posso remover um registro inexistente")
      RETURN bRetorno
   ENDIF

	IF( VAL(cCodigo) > 0 )
	
		cQuery := "DELETE FROM produtos WHERE id='" +  cCodigo +"' LIMIT 1;"
		
		IF MySQL_Connect() 
		
			IF MySQL_Database_Connect()
		
				IF MySQL_exec(oServer,cQuery)
				
					MSGINFO("Registro [" + cCodigo + "] removido com sucesso!");
               
               bRetorno := .t.
					
				ELSE
				
					MSGSTOP("N�o posso remover o registro [" + cCodigo + "]!");
		
				ENDIF
				
			ENDIF
		
		ENDIF
		
		MySQL_Destroy()
	
	ELSE
	
		MSGSTOP("N�o posso remover esse registro [" + cCodigo + "]")
	
	ENDIF

RETURN bRetorno