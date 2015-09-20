package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.Filtro
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class FiltroPorGusto extends Filtro {

	String nombreFiltro = "Filtro segun gustos"

	override filtrar(List<Receta> recetas, Persona persona) {
		recetas.filter[receta|persona.mePuedeGustar(receta)].toList
	}

}
