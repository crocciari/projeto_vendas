#include <hmg.ch>

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

function manutencao_produtos_excluir_registro(cCodigo)

   bRetorno := .f.
   
   IF(cCodigo=="")
      MSGSTOP("Não posso remover um registro inexistente")
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
				
					MSGSTOP("Não posso remover o registro [" + cCodigo + "]!");
		
				ENDIF
				
			ENDIF
		
		ENDIF
		
		MySQL_Destroy()
	
	ELSE
	
		MSGSTOP("Não posso remover esse registro [" + cCodigo + "]")
	
	ENDIF

RETURN bRetorno
