package ar.algo.adriba.tp1

import java.util.Comparator
import java.util.List

class CompararPorNombre extends Ordenamiento implements Comparator<Receta> {
	
	override ordenar(List<Receta> recetas){
	recetas.sortBy[nombreDelPlato]
	}
	
	override compare(Receta receta1, Receta receta2) {
		return receta1.nombreDelPlato.compareTo(receta2.nombreDelPlato) 
	}
	
	
}