#include <hmg.ch>

// ************************************************************************************************ 
// mostra mensagem na tela, dentro do statusbar e/ ou em uma list se ela existir
// CATS_msg(cTexto,cForm,cList)
// parametros:
// 		cTexto -> Mensagem de texto		-> default: ""
//		cForm -> Nome da Window 		-> default: "main"
//  	cList -> Lista de mensagem 		-> default: "listMsg"
//		bLimpa -> Envia sinal para limpar a lista -> default: .f.
// retorno:
//		Nil
function CATS_msg(cTexto,cForm,cList,bLimpa)

	if cTexto == nil
		cTexto := ""
	endif
	
	if cForm == nil
		cForm := "main"
	endif
   
   if cList == nil
      cList := "listMsg"
   endif
   
  
	if bLimpa == nil
		bLimpa := .f.
	endif

	if isWindowActive( &cForm )

		if IsControlDefined(&cList,&cForm)
	  
			if bLimpa
				doMethod( cForm, cList, "deleteAllItems" )
				if empty(cTexto)
					return nil
				endif
			endif
			
	  
			doMethod( cForm, cList, "addItem", cTexto )
			setProperty( cForm, cList, "value", getProperty( cForm, cList, "itemCount") )
		
		endif
		
		setProperty( cForm, "statusBar", "item", 1,  cTexto )

	endif
	
return nil