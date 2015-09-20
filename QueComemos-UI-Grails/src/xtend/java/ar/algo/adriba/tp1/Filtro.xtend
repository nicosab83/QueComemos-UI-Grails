package ar.algo.adriba.tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Filtro {

	String nombreFiltro
	
	def List<Receta> filtrar(List<Receta> recetas, Persona persona)

}
