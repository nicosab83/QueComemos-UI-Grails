package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionCommand
import java.util.List

class CondicionDevuelveMuchosResultados implements CondicionCommand {

	int muchosResultados

	new(int unNumero) {

		muchosResultados = unNumero

	}

	override satisface(List<Receta> recetas, Persona persona) {
		recetas.size > muchosResultados
	}

	override texto() {
		"Resultados de mas de " + String.valueOf(muchosResultados) + " resultados."
	}

}
