package ar.algo.adriba.tp1

import java.util.HashMap
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class ObserverMasConsultadaDesdeListadoPorUsuario extends ObserverDeConsultasDesdeListado{

	static Map<Usuario, ObserverMasConsultadaDesdeListadoPorUsuario> observersDeLosUsuarios = new HashMap<Usuario, ObserverMasConsultadaDesdeListadoPorUsuario>

	private new() {
	}

	static public def ObserverMasConsultadaDesdeListadoPorUsuario getInstance(Usuario unUsuario) {
		if (!observersDeLosUsuarios.containsKey(unUsuario)) {
			observersDeLosUsuarios.put(unUsuario, new ObserverMasConsultadaDesdeListadoPorUsuario)
		}
		observersDeLosUsuarios.get(unUsuario)
	}


}
