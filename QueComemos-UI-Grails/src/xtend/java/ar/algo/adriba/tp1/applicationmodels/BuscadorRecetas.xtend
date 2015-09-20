package ar.algo.adriba.tp1.applicationmodels

import ar.algo.adriba.tp1.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class BuscadorRecetas {
	String nombre
	String dificultad
	String ingrediente
	Integer caloriasMinimo
	Integer caloriasMaximo
	String temporada
	boolean aplicarFiltrosUsuario
	Usuario usuario

	new() {
		this.init()
	}

	new(Usuario unUsuario) {
		usuario = unUsuario
		this.init()
	}

	def void init() {
		nombre = null
		dificultad = null
		ingrediente = null
		caloriasMinimo = null
		caloriasMaximo = null
		temporada = null
		aplicarFiltrosUsuario = false
	}

}
