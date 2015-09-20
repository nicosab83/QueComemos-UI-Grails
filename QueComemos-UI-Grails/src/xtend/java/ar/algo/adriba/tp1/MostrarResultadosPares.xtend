package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList

class MostrarResultadosPares extends Ordenamiento {

	def boolean esPar(int num) {
		(num % 2) == 0

	}

	override ordenar(List<Receta> recetas) {

		val List<Receta> resultado = new ArrayList<Receta>

		recetas.forEach[unaReceta, i|
			if (!(this.esPar(i))) {
				resultado.add(unaReceta)
			}]

		resultado.toList
	}
}
