package ar.algo.adriba.tp1

import java.util.List

class RecetaBuilder {
	Receta receta

	new() {
		receta = new Receta
	}

	def RecetaBuilder tipoDeReceta(TipoReceta unTipo) {
		receta.tipo = unTipo
		this
	}

	def RecetaBuilder nombreDelPlato(String unNombre) {
		receta.nombreDelPlato = unNombre
		this
	}

	def RecetaBuilder agregarIngrediente(Comida unIngrediente) {
		receta.subRecetaseIngredientes.add(unIngrediente)
		this
	}

	def RecetaBuilder agregarSubreceta(Receta unaReceta) {
		receta.subRecetaseIngredientes.add(unaReceta)
		this
	}

	def RecetaBuilder setearCalorias(int unasCalorias) {
		receta.caloriasReceta = unasCalorias
		this
	}

	def RecetaBuilder setearDificultad(String unaDificultad) {
		receta.dificultad = unaDificultad
		this
	}

	def RecetaBuilder setearTemporadas(List<String> temporadas) {
		receta.temporada = temporadas
		this
	}

	def RecetaBuilder setearPreparacion(String unaExplicacion) {
		receta.explicacionDeLaPreparacion = unaExplicacion
		this
	}
		
	def setearTemporada(String string) {
		receta.temporada.add(string)
		this
	}
	
	def Receta build() {
		RepositorioRecetas.getInstance().agregar(receta)
		receta
	}


}
