package ar.algo.adriba.tp1

import java.util.HashMap
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class StubRepositorioUsuarios {

	static StubRepositorioUsuarios repo = null
	Map<Usuario, String> usuariosYClaves = new HashMap<Usuario, String>

	private new() {
		this.init()
	}

	static public def StubRepositorioUsuarios getInstance() {
		if (repo == null) {
			repo = new StubRepositorioUsuarios
		}
		repo
	}

	def void init() {

		val Fecha fechaValida = new Fecha(System.currentTimeMillis() - 24 * 60 * 60 * 1000);
		val Sexo Femenino = Sexo.FEMENINO
		val Sexo Masculino = Sexo.MASCULINO

		usuariosYClaves => [
			put(
				new UsuarioBuilder().agregarPeso(52).agregarAltura(1.64).agregarSexo(Femenino).agregarNombre("Marina").
					agregarFechaNacimiento(fechaValida).agregarRutina(new Rutina(61, true)).
					agregarCondicionesPreexistentes(new Vegano).agregarPreferenciaAlimentaria("frutas").build(), "123")
			put(
				new UsuarioBuilder().agregarPeso(52).agregarAltura(1.64).agregarSexo(Masculino).agregarNombre("Nicolas").
					agregarFechaNacimiento(fechaValida).agregarRutina(new Rutina(61, true)).
					agregarCondicionesPreexistentes(new Hipertenso).agregarPreferenciaAlimentaria("chori").build(), "123")
			put(
				new UsuarioBuilder().agregarPeso(52).agregarAltura(1.64).agregarSexo(Masculino).
					agregarNombre("UsuarioConFavoritas").agregarFechaNacimiento(fechaValida).agregarRutina(
						new Rutina(61, true)).agregarCondicionesPreexistentes(new Hipertenso).
					agregarPreferenciaAlimentaria("chori").build(), "123")
			put(
				new UsuarioBuilder().agregarPeso(52).agregarAltura(1.64).agregarSexo(Masculino).
					agregarNombre("UsuarioConConsultas").agregarFechaNacimiento(fechaValida).agregarRutina(
						new Rutina(61, true)).agregarCondicionesPreexistentes(new Hipertenso).
					agregarPreferenciaAlimentaria("chori").build(), "123")
		]
	}

	def void validarLogin(String nombre, String clave) {

		if (!existeEsteUsuario(nombre)) {
			throw new UserException("El usuario ingresado no existe, pruebe con Marina o Nicolas")
		}

		if (!laClaveEsCorrecta(nombre, clave)) {
			throw new UserException("La clave es incorrecta, pruebe con 123")
		}
	}

	def boolean laClaveEsCorrecta(String nombre, String clave) {
		usuariosYClaves.get(getUsuarioPorNombre(nombre)).matches(clave)
	}

	def boolean existeEsteUsuario(String nombre) {
		usuariosYClaves.keySet.exists[usuario|usuario.nombre.matches(nombre)]

	}

	def Usuario getUsuarioPorNombre(String nombre) {
		usuariosYClaves.keySet.findFirst[usuario|usuario.nombre.matches(nombre)]
	}

}
