package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.TipoReceta
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Privada implements TipoReceta {

	new(Usuario unUsuario, Receta unaReceta) {
		unUsuario.agregar(unaReceta)
	}

	override sePuedeSugerir() {
		false
	}

	override tePuedeModificar(Receta unaReceta, Usuario usuario) {
		usuario.usuarioTiene(unaReceta)
	}

	override cambiarValores(Usuario usuario, Receta receta, Receta unaRecetaConModificaciones) {
		receta.setearValores(unaRecetaConModificaciones)
	}

	override mePuedeVer(Usuario unUsuario, Receta unaReceta) {
		unUsuario.usuarioTiene(unaReceta) || unUsuario.alguienDelGrupoConoce(unaReceta)
	}

}
