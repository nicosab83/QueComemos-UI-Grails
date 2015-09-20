package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.TipoReceta

class Publica implements TipoReceta {

	override sePuedeSugerir() {
		true
	}

	override tePuedeModificar(Receta unaReceta, Usuario usuario) {
		true
	}

	 override cambiarValores(Usuario usuario, Receta receta, Receta unaRecetaConModificaciones) {
        val Receta nuevaReceta = usuario.copiar(receta)
        usuario.agregar(nuevaReceta)
        usuario.modificarUnaReceta(nuevaReceta, unaRecetaConModificaciones)
    }
	
	override mePuedeVer(Usuario usuario, Receta unaReceta) {
		true
	}

}
