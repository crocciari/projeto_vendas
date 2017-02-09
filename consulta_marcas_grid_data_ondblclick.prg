#include "hmg.ch"

declare window consulta_marcas

Function consulta_marcas_grid_data_ondblclick

	nPos := GETPROPERTY("consulta_marcas","grid_data","value")

	paTemp := GETPROPERTY("consulta_marcas","grid_data","item", nPos)
	
	DOMETHOD("consulta_marcas","RELEASE")
	
Return Nil
