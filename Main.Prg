#include <hmg.ch>

// ******************************************************************************
// Crocciari, Daniel
// hmglights.wordpress.com
// danielcrocciari@gmail.com
//

Function Main

	public oServer := nil

   public pcFileIni := GetProgramFilesFolder() + "\venda.ini"

   public pcHostName := ""
   public pcDataBase := ""
   public pcUserName := ""
   public pcPassWord := ""
   
   public pacNi := {'TEXTBOX','NUMERIC','9999999999'}
   public pacNc := {'TEXTBOX','NUMERIC','99999999999.99'}
	public pacC := {'TEXTBOX','CHARACTER'}
   public pacD := {'DATEPICKER','UPDOWN'}
	public pacB := { 'CHECKBOX' , 'Sim' , 'Não' }
	public pacM := { 'EDITBOX' }
	
	public paTemp := {}
   
   
   ini_le()
   
   Load Window Main
   Main.Center
   Main.Activate

Return
