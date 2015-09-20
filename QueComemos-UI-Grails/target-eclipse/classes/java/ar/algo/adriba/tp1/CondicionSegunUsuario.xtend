package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionCommand
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CondicionSegunUsuario implements CondicionCommand {

	String usuarioEnLaMira = null //acá lo colocamos a jcontardo en el test

	override satisface(List<Receta> recetas, Persona persona) {

		persona.es(usuarioEnLaMira)

	}

	override texto() {
		usuarioEnLaMira
	}

	new(String unNombre) {
		usuarioEnLaMira = unNombre

	}

}
