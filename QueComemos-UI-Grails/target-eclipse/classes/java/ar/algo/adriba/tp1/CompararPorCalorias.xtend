package ar.algo.adriba.tp1

import java.util.Comparator
import java.util.List

class CompararPorCalorias extends Ordenamiento implements Comparator<Receta> {

	override ordenar(List<Receta> recetas) {
		recetas.sortBy[caloriasReceta]
	}

	override compare(Receta receta1, Receta receta2) {
		return receta1.caloriasReceta.compareTo(receta2.caloriasReceta)
	}

}
