package ar.algo.adriba.tp1

import java.util.List

class ObserverConsultaVegano extends ObserversConsulta {

	int veganosQueConsultaron = 0
	
	static ObserverConsultaVegano observerConsultaVegano = null
	
	private new() {
	}

	static public def ObserverConsultaVegano getInstance() {
		if (observerConsultaVegano == null) {
			observerConsultaVegano = new ObserverConsultaVegano()
		}
      observerConsultaVegano
	}

	override send(List<Receta> recetas, Persona persona) {
		if (persona.esVegana && this.consultastePorUnaRecetaDificil(recetas)) {
			veganosQueConsultaron = veganosQueConsultaron + 1
		}
	}

	def boolean consultastePorUnaRecetaDificil(List<Receta> recetas) {
		recetas.exists[receta|receta.tuDificultadEs("Dificil")]
	}

	def int cantidadDeVeganosQueConsultaronRecetasDificiles() {

		veganosQueConsultaron

	}

}
