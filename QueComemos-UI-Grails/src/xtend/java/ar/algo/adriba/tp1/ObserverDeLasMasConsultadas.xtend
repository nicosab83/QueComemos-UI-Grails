package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.ObserversConsulta
import java.util.List
import java.util.HashMap
import java.util.Map
import org.uqbar.commons.utils.Observable

@Observable
class ObserverDeLasMasConsultadas extends ObserversConsulta {

	Map<Receta, Integer> recetasMasConsultadas = new HashMap<Receta, Integer>

	static ObserverDeLasMasConsultadas observerDeMasConsultadas = null

	private new() {
	}

	static public def ObserverDeLasMasConsultadas getInstance() {
		if (observerDeMasConsultadas == null) {
			observerDeMasConsultadas = new ObserverDeLasMasConsultadas()
		}
		observerDeMasConsultadas
	}

	override send(List<Receta> recetas, Persona persona) {

		super.consultasPor(recetas, recetasMasConsultadas)
	}

	def boolean hayConsultas() {
		super.hayConsultas(recetasMasConsultadas)
	}

}
