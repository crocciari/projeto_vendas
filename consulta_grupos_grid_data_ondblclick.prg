#include "hmg.ch"

declare window consulta_grupos

Function consulta_grupos_grid_data_ondblclick

	nPos := GETPROPERTY("consulta_grupos","grid_data","value")

	paTemp := GETPROPERTY("consulta_grupos","grid_data","item", nPos)
	
	DOMETHOD("consulta_grupos","RELEASE")

Return Nil
