package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

// esta clase deberia ser abstracta y los metodos no retornar nada
@Accessors
abstract class CondicionPreexistente {
	
	String nombre
	
	
	def boolean validacion(Usuario unUsuario){
		true
		// lo hago directamente en hipertenso y diabetico, asi el celiaco no tiene que overridear con un true hardcodeado
		// unUsuario.tamañoPreferencias() > 0 
	}
	
	def boolean loSatisface (Usuario unUsuario){
		true
	}
	
	def boolean sosInadecuada(Receta receta) {
		false
	}
	
	
	
		
}
