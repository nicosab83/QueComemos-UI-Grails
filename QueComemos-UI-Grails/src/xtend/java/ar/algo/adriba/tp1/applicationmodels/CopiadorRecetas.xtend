package ar.algo.adriba.tp1.applicationmodels

import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.Usuario
import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.TransactionalAndObservable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.algo.adriba.tp1.StubRepositorioRecetas

@Accessors
@TransactionalAndObservable
class CopiadorRecetas extends Entity {

	Receta receta
	Usuario usuario
	String nuevoNombrePlato
	Receta miReceta

	new(Receta unaReceta, Usuario unUsuario) {
		receta = unaReceta
		usuario = unUsuario
	}

	def void copiarRenombrandoReceta() {
		this.validarNombreDuplicado()
		miReceta = usuario.copiar(receta)
		miReceta.nombreDelPlato = nuevoNombrePlato
		this.agregarRecetaNuevaAlRepo()
	}

	def void validarNombreDuplicado() {
		StubRepositorioRecetas.getInstance().validarNombresDuplicados(nuevoNombrePlato)
	}

	def void agregarRecetaNuevaAlRepo() {
		StubRepositorioRecetas.getInstance().agregar(miReceta)
	}

}
