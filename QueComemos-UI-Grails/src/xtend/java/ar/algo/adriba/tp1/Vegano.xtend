package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionPreexistente


class Vegano extends CondicionPreexistente {
	
	
	
	new(){
		nombre=("Vegano")
	}
	
	override validacion(Usuario unUsuario) {
		unUsuario.preferenciasAlimentarias.forall[comida|!(comida.matches("pollo||carne||chivito||chori||lomo"))]
	}

	override loSatisface(Usuario unUsuario) {
		unUsuario.preferenciasAlimentarias.exists[comida|comida.matches("frutas")]
	}

	override sosInadecuada(Receta unaReceta) {
		unaReceta.tenesCarne()
	}
	
	
	
	}
