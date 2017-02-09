#include <hmg.ch>

FUNCTION enche_combo_estado(cForm,cComp,cUF)
LOCAL posicaoEstado, nPosicao := 1

   aEstado := {"AC-Acre","AL-Alagoas","AP-Amapá","AM-Amazonas","BA-Bahia","CE-Ceará","DF-Distrito Federal","ES-Espírito Santo","GO-Goiás","MA-Maranhão","MT-Mato Grosso","MS-Mato Grosso do Sul","MG-Minas Gerais","PR-Paraná","PB-Paraíba","PA-Pará","PE-Pernambuco","PI-Piauí","RJ-Rio de Janeiro","RN-Rio Grande do Norte","RS-Rio Grande do Sul","RO-Rondonia","SC-Santa Catarina","SE-Sergipe","SP-São Paulo","TO-Tocantins" }
   
   DOMETHOD(cForm,cComp,"DELETEALLITEMS")
   
   FOR nPos := 1 TO LEN(aEstado)
   
      DOMETHOD(cForm,cComp,"ADDITEM", aEstado[nPos] )
      
      IF( UPPER(cUF) == SUBSTR(aEstado[nPos],1,2) )
      
         nPosicao := nPos
         
      ENDIF
      
   NEXT
   
   nPosicao := LEN(aEstado) - nPosicao
   
   posicaoEstado := GETPROPERTY(cForm,cComp,"ITEMCOUNT") - nPosicao
 
   SETPROPERTY(cForm,cComp,"VALUE", posicaoEstado )
 
RETURN nil