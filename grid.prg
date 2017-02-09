#include <hmg.ch>

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

// *************************************************************************************
// FUNCOES ESPECIAIS PARA DINAMIZAR
// CATS_<function>
// Céu Azul Tecnologia e Software
//    

// *************************************************************************************
// CATS_grid_add
// funcao para abastecer uma grid de um formulario
// parametros: 	cForm -> window				-> default: Nil
//					Nome da janela
//             	cComponent -> componente	-> default: Nil
//					Nome do componente grade
//             	aData -> data				-> default: Nil
//					Array com os dados da grade { { "" } }
//				bDeleteOnIni -> booleano 	-> default: .t.
//					Deleta ou nao o conteudo da grade antes de incluir novos registros
//				bMsgOnProcess -> booleano	-> default: .t.
//					Exibe ou nao as mensagens linha de statusbar durante o processo
// retorno: booleano para confirmar o preenchimento
function CATS_grid_add( cForm, cComponent, aData, bDeleteOnIni, bMsgOnProcess )
local nTotalGrade, nPos

	if bDeleteOnIni == nil
		bDeleteOnIni := .t.
	endif
	
	if bMsgOnProcess == nil
		bMsgOnProcess := .t.
	endif
	
	if bDeleteOnIni
		doMethod(cForm, cComponent, "deleteAllItems")
	endif

	if len(aData) <= 0
		if bMsgOnProcess
			CATS_msg("Nenhum registro localizado.", cForm)
		endif
		return .f.
	endif
	
	for nPos := 1 to len(aData)
		
		doMethod(cForm, cComponent, "addItem", aData[nPos] )
		
	next
   
	if bMsgOnProcess
		nTotalGrade := getProperty(cForm, cComponent, "itemcount")
		CATS_msg( allTrim(str(len(aData))) + " registros localizados, total de " + ;
								allTrim(str(nTotalGrade)) + " registros na lista.", cForm )
	endif
	
return .t.

// *************************************************************************************
// redimensionar os campos de uma grade apartir do titulo
function CATS_grid_size_head( cForm, cComponent, nColumn )
local aLine, nPos
	
	if getProperty(cForm,cComponent,"itemcount") <= 0
		return nil
	endif
	
	nColumns := 0
	if nColumn == nil
		aLine := getProperty(cForm,cComponent,"item",1)
		nColumns := len(aLine)
	endif
	
	if nColumns > 0
		for nPos := 1 to nColumns
			CATS_autosizecolumnhead( cComponent, cForm, nPos )
		next
	else
		CATS_autosizecolumnhead( cComponent, cForm, nColumn )
	endif
	
return nil

// *************************************************************************************
// redimensionar os campos de uma grade apartir dos dados
function CATS_grid_size_column( cForm, cComponent, nColumn )
local aLine, nPos
	
	if getProperty(cForm,cComponent,"itemcount") <= 0
		return nil
	endif
	
	nColumns := 0
	if nColumn == nil
		aLine := getProperty(cForm,cComponent,"item",1)
		nColumns := len(aLine)
	endif
	
	if nColumns > 0
	
		for nPos := 1 to nColumns
			CATS_autosizecolumn( cComponent, cForm, nPos )
		next
		
	else
		CATS_autosizecolumn( cComponent, cForm, nColumn )
	endif

	
return nil

// *************************************************************************************
// Esta funcao realiza modificacoes na grid de um formulario em tempo de execucao
// This function performs modifications in the form of a grid-time execution
// CATS_grid_redefine
// parameters:
// cForm -> form name (window name)
// cComponent -> component grid name
// aHeader -> array of headers { "header 1", "header 2" }
// aColumnsControl -> array of columns controls { " ", "" }
// aWidths -> array of widths { 50, 100 }
// aJustify -> array of justify alignment { GRID_JTFY_LEFT, GRID_JTFY_RIGHT }
// cFontName -> font name default  = "arial"
// nFontSize -> font size is a number = 9
// aFontStyle -> array of style font { bold, italic, underline, strikeoutline } = { .f., .f., .f., .f. }
// cToolTip -> tooltip message
// returns:
//          nil
function CATS_grid_redefine(cForm, cComponent, aHeader, aColumnsControl, aWidths, aJustify, cFontName, nFontSize, aFontStyle, cToolTip )
 
   if cComponent == nil .or. cForm == nil
      return nil
   endif
   
   if aHeader == nil
      return nil
   endif
  
   if aWidths == nil
      aWidths := {}
      for nPos := 1 to len(aHeader)
         aAdd( aWidths, len(aHeader[nPos]) * 10 )
      next
   endif
   
   if aJustify == nil
      aJustify := {}
      for nPos := 1 to len(aColumnsControl)
         nAlign := GRID_JTFY_LEFT
         if aColumnsControl[nPos] == pacD
            nAlign := GRID_JTFY_CENTER
         endif
         if aColumnsControl[nPos] == pacNi
            nAlign := GRID_JTFY_RIGHT
         endif
         if aColumnsControl[nPos] == pacNc
            nAlign := GRID_JTFY_RIGHT
         endif
         
         aAdd( aJustify, nAlign )
      next
   endif
  
   if aFontStyle == nil
      aFontType := { .f., .f., .f., .f. }
   else 
      if len(aFontStyle) < 4
         aFontStyle := { .f., .f., .f., .f. }
      endif
   endif

   k := GetControlIndex ( cComponent , cForm, aHeader, aColumnsControl, aWidths, aJustify )
   
   if k > 0
      
      cControlHandle := _HMG_SYSDATA [3] [k]
            
      // colunas atuais
      nTotalColumnsGrid := len( _HMG_SYSDATA [ 33 ] [ k ] )
      
      if cToolTip != nil
         SetToolTip ( cControlHandle , cToolTip, GetFormToolTipHandle(cForm) )
         _HMG_SYSDATA [ 30 ] [ k ] := cToolTip
      endif
      
      if cFontName == nil
         cFontName := "arial"
      endif
      
      if nFontSize == nil
         nFontSize := 9
      endif
      
      // fontname, fontsize, bold, italic, underline, strikeout
      _SetFont( cControlHandle, cFontName, nFontSize, .f., .f., .f., .f. )
      
      _HMG_SYSDATA [ 27 ] [ k ] := cFontName
      _HMG_SYSDATA [ 28 ] [ k ] := nFontSize
      _HMG_SYSDATA [ 29 ] [ k ] := aFontStyle

	    
      // adiciona novas colunas
      for nPos := 1 to len(aHeader)
         // _DeleteGridColumn ( cComponent, cForm, nPos )
         _AddGridColumn ( cComponent, cForm, nPos, aHeader[nPos], aWidths[nPos], aJustify[nPos] )
      next

      nPos := len(aHeader)
      while nPos < len(_HMG_SYSDATA [ 33 ] [ k ])
         _DeleteGridColumn ( cComponent, cForm, nPos ) 
      end

      _HMG_SYSDATA [ 7 ] [ k ] := aHeader
      _HMG_SYSDATA [ 33 ] [ k ] := aHeader
      _HMG_SYSDATA [ 40] [ k ] [ 31 ] :=  aWidths
      _HMG_SYSDATA [ 37 ] [ k ] := aJustify
      _HMG_SYSDATA [ 40 ] [ k ] [ 2] := aColumnsControl

      _HMG_DOGRIDREFRESH(k)
      
   endif
   
return nil

// *************************************************************************************
function CATS_GRID_getHeader(cForm,cComponent)
local aHeader := {}

   if cComponent == nil .or. cForm == nil
      return aHeader
   endif
   
   k := GetControlIndex ( cComponent , cForm )

   aHeader := _HMG_SYSDATA [ 33 ] [ k ]
   
return aHeader

// *************************************************************************************
function CATS_GRID_getWidth(cForm,cComponent)
local aWidth := {}

   if cComponent == nil .or. cForm == nil
      return aWidth
   endif
   
   k := GetControlIndex ( cComponent , cForm )

   aWidth := _HMG_SYSDATA [ 40] [ k ] [ 31 ]
   
return aWidth

// *************************************************************************************
function CATS_GRID_getJustify(cForm,cComponent)
local aJustify := {}

   if cComponent == nil .or. cForm == nil
      return aJustify
   endif
   
   k := GetControlIndex ( cComponent , cForm )

   aJustify :=  _HMG_SYSDATA [ 37 ] [ k ]
   
return aJustify

// *************************************************************************************
// -> Grid Selected Row ForeColor (by cell navigation)
function CATS_GRID_change_forecolor( aColor )
   _HMG_SYSDATA [ 348 ] := aColor
return nil

// *************************************************************************************
//  -> Grid Selected Row BackColor (by cell navigation)
function CATS_GRID_change_backcolor( aColor )
   _HMG_SYSDATA [ 349 ] := aColor
return nil


// *************************************************************************************
function CATS_autosizecolumn( cGridName, cFormName, nColumn )
    local nHandle := GetControlHandle ( cGridName, cFormName)
    GridSetAutoColumnSize( nHandle, nColumn - 1 )
    return nil

// *************************************************************************************
function CATS_autosizecolumnhead( cGridName, cFormName, nColumn )
    local nHandle := GetControlHandle ( cGridName, cFormName)
    GridSetAutoColumnHeadSize( nHandle, nColumn - 1 )
    return nil
    

    #pragma BEGINDUMP

    #include <windows.h>
    #include <commctrl.h>
    #include "hbapi.h"
    #include <wingdi.h>

    HB_FUNC ( GRIDSETAUTOCOLUMNSIZE )

    {
       HWND hWnd1;
       hWnd1 = (HWND) hb_parnl (1);
       SendMessage((HWND) hWnd1, LVM_SETCOLUMNWIDTH,    (WPARAM)(int) hb_parni( 2 ),(LPARAM) LVSCW_AUTOSIZE );
    }

    HB_FUNC ( GRIDSETAUTOCOLUMNHEADSIZE )

    {
       HWND hWnd1;
       hWnd1 = (HWND) hb_parnl (1);
       SendMessage((HWND) hWnd1, LVM_SETCOLUMNWIDTH,    (WPARAM)(int) hb_parni( 2 ),(LPARAM) LVSCW_AUTOSIZE_USEHEADER );
    }
    

    #pragma ENDDUMP
    
    
