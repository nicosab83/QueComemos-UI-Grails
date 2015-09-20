package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.CondicionCommand
import java.util.List

class CondicionUsuarioMarcaTodoComoFavorito implements CondicionCommand {
	
	override satisface(List<Receta> recetas, Persona persona) {
		
	persona.marcarTodoComoFavorito()
	
	}
	
	override texto() {
	"Usuario que marca todo como favorito"
	}
	
}