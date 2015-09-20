package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList
import java.util.Map
import ar.algo.adriba.tp1.applicationmodels.DetalleRecetaParaUsuario

class MostrarLosPrimerosDiez extends Ordenamiento {


	override ordenar(List<Receta> recetas) {
		
	val List<Receta> resultado = new ArrayList<Receta>

		recetas.forEach[unaReceta, i|
			if (i < 10) {
				resultado.add(unaReceta)
			}]
		resultado.toList
	}

	def List<DetalleRecetaParaUsuario> ordenarRecetas(List<DetalleRecetaParaUsuario> recetas) {

	val List<DetalleRecetaParaUsuario> resultado = new ArrayList<DetalleRecetaParaUsuario>

		recetas.forEach[unaReceta, i|
			if (i < 10) {
				resultado.add(unaReceta)
			}]
		resultado.toList
	}

}
