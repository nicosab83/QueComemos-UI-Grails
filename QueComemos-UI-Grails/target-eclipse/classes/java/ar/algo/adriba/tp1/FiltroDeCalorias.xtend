package ar.algo.adriba.tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class FiltroDeCalorias extends Filtro {

	String nombreFiltro = "Filtro por calorias"

	override filtrar(List<Receta> recetas, Persona persona) {
		if (persona.tieneSobrepeso()) {
			recetas.filter[receta|receta.caloriasMenorA(500)].toList
		} else {
			recetas.toList
		}

	}
}
