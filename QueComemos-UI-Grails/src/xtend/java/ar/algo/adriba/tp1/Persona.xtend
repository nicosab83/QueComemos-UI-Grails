package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
abstract class Persona {

	String nombre
	Sexo sexo
	List<Receta> recetasFavoritas = new ArrayList<Receta>
	boolean marcarTodasLasRecetasConsultadasComoFavoritas

	def boolean aceptasSugerencia(Receta unaReceta) {
		this.esAptaParaMi(unaReceta) && this.mePuedeGustar(unaReceta)
	}

	def boolean mePuedeGustar(Receta unaReceta)

	def boolean esAptaParaMi(Receta unaReceta)

	def boolean puedoVerReceta(Receta receta)

	def boolean tieneSobrepeso()

	def boolean esVegana()

	def boolean esFavoritaEsta(Receta receta) {
		recetasFavoritas.contains(receta)
	}

	def void marcarComoFavorita(Receta receta) {

		if (puedoVerReceta(receta)) {
			if (!esFavoritaEsta(receta)) {

				recetasFavoritas.add(receta)
			}
		} else {
			throw new Exception("No puede ver esta receta.")
		}
	}

	def boolean es(String unNombre) {
		nombre.matches(unNombre)
	}

	def boolean marcarTodoComoFavorito() {
		marcarTodasLasRecetasConsultadasComoFavoritas
	}

	def void quieroMarcarTodoComoFavorito() {
		marcarTodasLasRecetasConsultadasComoFavoritas = true
	}

}
