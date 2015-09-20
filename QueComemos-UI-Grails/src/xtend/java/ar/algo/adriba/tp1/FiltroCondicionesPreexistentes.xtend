package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.Filtro
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class FiltroCondicionesPreexistentes extends Filtro {
	
	String nombreFiltro = "Filtro de condiciones preexistentes"
		
	override filtrar(List<Receta> recetas,Persona persona) {
		recetas.filter[receta|persona.esAptaParaMi(receta)].toList
	}
	
	
	
}