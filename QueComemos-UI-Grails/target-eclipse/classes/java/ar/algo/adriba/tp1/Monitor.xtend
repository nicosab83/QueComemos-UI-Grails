package ar.algo.adriba.tp1

import java.util.List

abstract class Monitor {

	public CondicionCommand condicionDeAccion

	new(CondicionCommand unaCondicion) {

		condicionDeAccion = unaCondicion
	}

	def void execute(List<Receta> recetas, Persona persona, List<Filtro> filtros) {

		if (condicionDeAccion.satisface(recetas, persona)) {

			this.doExecute(
				recetas,
				persona,
				filtros
			)
		}
	}

	def void doExecute(List<Receta> recetas, Persona persona, List<Filtro> filtros)

	def cantidadDeRecetas(List<Receta> recetas) {
		recetas.size
	}
}
