package ar.algo.adriba.tp1

import java.util.List

interface CondicionCommand {
	
	def boolean satisface(List<Receta> recetas,Persona persona) 
	
	def String texto()
	
}