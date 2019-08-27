#include <hmg.ch>

function cria_tabelas()

	DOMETHOD("criar_tabelas","list_tabelas","DELETEALLITEMS")
	
	DOMETHOD("criar_tabelas","list_tabelas","ADDITEM","Iniciando processo de criar tabelas...")

	IF MySQL_Connect()
	
		cQuery := "CREATE DATABASE IF NOT EXISTS `projeto_vendas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
		/*
		IF MySQL_exec(oServer,cQuery,.t.)
			DOMETHOD("criar_tabelas","list_tabelas","ADDITEM", "Base de dados [ projeto_vendas ] criada com sucesso!")
		ELSE
			DOMETHOD("criar_tabelas","list_tabelas","ADDITEM", "Base de dados [ projeto_vendas ] não pode ser criada!")
		ENDIF
		*/
	
		IF MySQL_Database_Connect()
		
			cQuery := "CREATE TABLE `cidades` ( `id` int(11) NOT NULL AUTO_INCREMENT, `cidade` varchar(150) NOT NULL, `estado` char(2) NOT NULL, `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;"
			cria_tabelas_msg(cQuery, "cidades")
			
			cQuery := "CREATE TABLE `grupos` ( `id` int(11) NOT NULL AUTO_INCREMENT, `grupo` varchar(100) NOT NULL, `ativo` enum('S','N') NOT NULL, `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;"
			cria_tabelas_msg(cQuery, "grupos")
			
			cQuery := "CREATE TABLE `marcas` ( `id` int(11) NOT NULL AUTO_INCREMENT, `marca` varchar(200) NOT NULL, `ativo` enum('S','N') NOT NULL, `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;"
			cria_tabelas_msg(cQuery, "marcas")
			
			cQuery := "CREATE TABLE `produtos` ( `id` int(11) NOT NULL AUTO_INCREMENT, `produto` varchar(200) NOT NULL, `unidade` varchar(5) NOT NULL, `idgrupo` int(11) NOT NULL, `idmarca` int(11) NOT NULL, `ativo` enum('S','N') NOT NULL, `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;"
			cria_tabelas_msg(cQuery, "produtos")
			
		ENDIF
	
	ENDIF
	
	DOMETHOD("criar_tabelas","list_tabelas","ADDITEM","Processo de criar tabelas finalizado!")

return nil


/*
 * para executar mysql_exec e mostrar mensagem de erro personalizada na list_tabelas
 *
 * envia:
 * 			cQuery : variavel contendo a instrucao SQL para criar a tabela
 * 			cMsg : envia o nome da tabela que esta sendo criada, ou qualquer outra mensagem
 * retorna:
 *			nil : vazio
 *
 */
function cria_tabelas_msg(cQuery, cMsg) 

	IF MySQL_exec(oServer,cQuery,.t.)
		DOMETHOD("criar_tabelas","list_tabelas","ADDITEM", "Tabela [ " + cMsg + " ] criada com sucesso!")
	ELSE
		DOMETHOD("criar_tabelas","list_tabelas","ADDITEM", "Tabela [ " + cMsg + " ] não pode ser criada!")
	ENDIF


return nil
