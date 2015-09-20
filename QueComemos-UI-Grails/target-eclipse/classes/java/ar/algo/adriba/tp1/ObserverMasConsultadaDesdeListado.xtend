package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.applicationmodels.DetalleRecetaParaUsuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class ObserverMasConsultadaDesdeListado extends ObserverDeConsultasDesdeListado {

	static ObserverMasConsultadaDesdeListado observerDeMasConsultadas = null

	private new() {
	}

	static public def ObserverMasConsultadaDesdeListado getInstance() {
		if (observerDeMasConsultadas == null) {
			observerDeMasConsultadas = new ObserverMasConsultadaDesdeListado()
		}
		observerDeMasConsultadas
	}



}
