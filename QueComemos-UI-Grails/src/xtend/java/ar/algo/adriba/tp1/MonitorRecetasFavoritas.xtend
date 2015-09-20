package ar.algo.adriba.tp1

import java.util.List

class MonitorRecetasFavoritas extends Monitor {
	
	new(CondicionCommand unaCondicion) {
		super(unaCondicion)
	}
	
	override doExecute(List<Receta> recetas, Persona persona, List<Filtro> filtros) {
		
	recetas.forEach[receta|persona.marcarComoFavorita(receta)]
		
	}
	
	
}


