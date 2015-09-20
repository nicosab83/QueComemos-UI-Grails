package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.applicationmodels.DetalleRecetaParaUsuario
import java.util.List
import java.util.ArrayList

class ObserverDeConsultasDesdeListado {

	public List<DetalleRecetaParaUsuario> recetasMasConsultadas = new ArrayList<DetalleRecetaParaUsuario>

	def void notificar(DetalleRecetaParaUsuario receta) {
		recetasMasConsultadas.add(receta)
	}

	def boolean hayConsultas() {
		recetasMasConsultadas.size > 0
	}
}
