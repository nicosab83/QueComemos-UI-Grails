package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente

class Diabetico extends CondicionPreexistente {

	new() {
		nombre = ("Diabetico")
	}

	override validacion(Usuario unUsuario) {

		(unUsuario.tamañoPreferencias() > 0) && (unUsuario.sexo != Sexo.DEFAULT)

	}

	override loSatisface(Usuario unUsuario) {
		unUsuario.getPeso() < 70 || unUsuario.tieneRutinaActiva()
	}

	override sosInadecuada(Receta unaReceta) {
		unaReceta.tenesDemasiadaAzucar()
	}
}
