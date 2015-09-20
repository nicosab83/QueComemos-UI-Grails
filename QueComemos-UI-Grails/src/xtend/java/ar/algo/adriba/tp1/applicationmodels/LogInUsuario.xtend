package ar.algo.adriba.tp1.applicationmodels

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.algo.adriba.tp1.Usuario
import org.uqbar.commons.model.UserException
import ar.algo.adriba.tp1.StubRepositorioUsuarios

@Accessors
@Observable
class LogInUsuario {

	String nombre
	String clave
	Usuario unUsuario

	new() {
	this.clear()
	}

	def void validarCamposCompletos() {

		if (nombre == null) {
			throw new UserException("Ingresar su nombre de usuario")
		}
		if (clave == null) {
			throw new UserException("Ingrese su contraseña")
		}
	}

	def void validarUsuario() {
		StubRepositorioUsuarios.getInstance().validarLogin(nombre, clave)
	}

	def Usuario obtenerUsuario() {
		StubRepositorioUsuarios.getInstance().getUsuarioPorNombre(nombre)
	}

	def Usuario ingresarAlSistema() {
		validarCamposCompletos()
		validarUsuario()
		unUsuario = obtenerUsuario()
	}

	def void clear() {
		nombre = null
		clave = null
	}
}
