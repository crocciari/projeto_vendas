#include <hmg.ch>

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

FUNCTION MySQL_Connect(cHostName,cUserName,cPassWord) 

	IF( cHostName == nil)
		cHostName := pcHostName
	ENDIF
	
	IF( cUserName == nil)
		cUserName := pcUserName
	ENDIF
	
	IF( cPassWord == nil)
		cPassWord := pcPassWord
	ENDIF
	
	oServer := TMySQLServer():New( cHostName, cUserName, cPassWord )
	
	IF( oServer:NETERR() )
	
		MSGSTOP("Erro ao conectar!" +CHR(13)+CHR(10)+ "(" + oServer:ERROR() + ")" + CHR(13) + CHR(10) +;
					"Server: " + cHostName + CHR(13)+CHR(10) +;
					"User: " + cUserName , "SQL" )
	
		RETURN .f.
		
	ENDIF



RETURN .t.

// *********************************************
FUNCTION MySQL_Destroy()

	IF(oServer!=nil)

		oServer:DESTROY()
		oServer := nil
	
	ENDIF

RETURN .t.

// *********************************************

FUNCTION MySQL_Database_Connect(cDataBase)
LOCAL aDatabaseList := {}, bSucesso := .f.

IF( cDataBase == nil )
	cDataBase := LOWER(pcDatabase)
ENDIF

IF( oServer == nil )
	MSGSTOP("Servidor não conectado!","SQL")
	RETURN bSucesso
ENDIF

aDatabaseList := oServer:LISTDBS()

IF( oServer:NETERR() )
	MSGSTOP("Erro verificando a lista de banco de dados: " + oServer:ERROR(), "SQL" )
	RETURN bSucesso
ENDIF

IF( ASCAN( aDatabaseList, cDataBase ) == 0 )
	MSGSTOP("Banco de dados " + cDataBase + " não existe!", "SQL")
	RETURN bSucesso
ENDIF

oServer:SELECTDB( cDataBase )

IF( oServer:NETERR() )
	MSGSTOP("Erro conectado banco de dados " + cDataBase + ": " + oServer:ERROR(), "SQL" )
	RETURN bSucesso
ENDIF

bSucesso := .t.

RETURN bSucesso


// *********************************************
FUNCTION MySQL_exec(oServer,cQuery,bSilence)
LOCAL oQuery

	oQuery := oServer:QUERY( cQuery )
	
	// retorna se eh true ou false na execucao mysql
	IF( oQuery:NETERR() )
	
		IF bSilence
			// modo silencio
			// nao mostra mensagem de erro
		ELSE
			// retorna a mensagem de erro padrao do mysql
			MSGSTOP("Erro: " + oQuery:ERROR(), "SQL" )
		ENDIF
		
		RETURN .f.
		
	ENDIF

RETURN .t.

// *********************************************
FUNCTION MySQL_execQuery(oServer,cQuery)
LOCAL oQuery, oRow, i, j, aTable := {}, aRow := {}

	IF( oServer == nil )
		MSGSTOP("Erro: sem conexão com o servidor! ","SQL")
		return aTable
	ENDIF

	IF( cQuery == nil )
		cQuery := ""
	ENDIF
	
	IF( EMPTY( ALLTRIM(cQuery) ) )
		MSGSTOP("Erro: query vazia","SQL")
		RETURN aTable
	ENDIF
	
	oQuery := oServer:QUERY( cQuery )
	
	IF( oQuery:NETERR() )
	
		MSGSTOP("Erro: " + oQuery:ERROR(), "SQL" )
		
	ELSE
	
		IF( oQuery:LASTREC() > 0 )
		
			ASIZE(aTable,0)
			
			FOR i := 1 TO oQuery:LASTREC()
			
				ASIZE(aRow,0)
				
				oRow := oQuery:GETROW(i)
				
				FOR j := 1 TO oQuery:FCOUNT()
				
					IF( VALTYPE(oRow:FIELDGET(j))=="C" )
						campo := ALLTRIM(oRow:FIELDGET(j))
					ELSE
						campo := oRow:FIELDGET(j)
					ENDIF
					
					AADD( aRow, campo)
				
				NEXT j
			
				AADD( aTable, ACLONE(aRow) )
			
			NEXT i
		
		ENDIF
	
	ENDIF
	
RETURN aTable










