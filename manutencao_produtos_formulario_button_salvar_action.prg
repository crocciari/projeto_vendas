#include "hmg.ch"

declare window manutencao_produtos_formulario

Function manutencao_produtos_formulario_button_salvar_action

   cCodigo := GETPROPERTY("manutencao_produtos_formulario","text_codigo","value")
   cDescricao := GETPROPERTY("manutencao_produtos_formulario","text_descricao","value")
   cUnidade := GETPROPERTY("manutencao_produtos_formulario","text_unidade","value")
   cIdGrupo := GETPROPERTY("manutencao_produtos_formulario","text_idgrupo","value")
   cIdMarca := GETPROPERTY("manutencao_produtos_formulario","text_idmarca","value")
   
   nPos := GETPROPERTY("manutencao_produtos_formulario","combo_ativo","value")
   IF(nPos==1)
      cAtivo := "S"
   ELSE
      cAtivo := "N"
   ENDIF
   
   IF(VAL(cCodigo)>0)
   
      cQuery := "UPDATE produtos "+;
                  "SET produto = '" + cDescricao + "' "+;
                  ", unidade = '" + cUnidade + "' "+;
                  ", idgrupo = '" + cIdGrupo + "' "+;
                  ", idmarca = '" + cIdMarca + "' "+;
                  ", ativo = '" + cAtivo + "' "+;
                  "WHERE id = '" + cCodigo + "' "+;
                  "LIMIT 1;"
       
   ELSE
   
      cQuery := "INSERT INTO produtos (produto,unidade,idgrupo,idmarca,ativo) "+;
                  "VALUES ('" + cDescricao + "',"+;
                           "'" + cUnidade + "',"+;
                           "'" + cIdGrupo + "',"+;
                           "'" + cIdMarca + "',"+;
                           "'" + cAtivo + "');"
                           
      SETPROPERTY("manutencao_produtos","text_busca","value",cDescricao)
      
   
   ENDIF
   
           
   IF MySQL_Connect()
   
      IF MySQL_Database_Connect()
         
         IF(!MySQL_exec(oServer,cQuery))
            MSGSTOP("Não Posso salvar o registro!")
            RETURN nil
         ENDIF
         
      ENDIF
      
   ENDIF

   manutencao_produtos_button_busca_action()
   
   DOMETHOD("manutencao_produtos_formulario","RELEASE")

Return Nil
