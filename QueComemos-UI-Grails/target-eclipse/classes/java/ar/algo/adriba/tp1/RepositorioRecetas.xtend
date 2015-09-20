package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList

public class RepositorioRecetas implements Repositorio {
	
	public List<Receta> listarTodas = new ArrayList<Receta>

	static RepositorioRecetas repositorio = null

	private new() {
	}

	static public def RepositorioRecetas getInstance() {
		if (repositorio == null) {
			repositorio = new RepositorioRecetas()
		}
      repositorio;
	}

	def void agregar(Receta unaReceta) {
		listarTodas.add(unaReceta)
	}

	def void quitar(Receta unaReceta) {
		listarTodas.remove(unaReceta)
	}

	override List<Receta> todasLasRecetas() {
		listarTodas.toList
	}

	def void limpiar() {
		listarTodas.clear
	}
	
}
