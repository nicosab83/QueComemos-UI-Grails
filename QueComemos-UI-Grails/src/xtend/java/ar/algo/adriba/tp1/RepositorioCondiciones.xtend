package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepositorioCondiciones {

	static RepositorioCondiciones repositorio = null

	public List<CondicionPreexistente> condiciones = new ArrayList<CondicionPreexistente>

	private new() {
		condiciones => [
			add(new Hipertenso)
			add(new Vegano)
			add(new Celiaco)
			add(new Diabetico)
		]
	}

	static public def RepositorioCondiciones getInstance() {
		if (repositorio == null) {
			repositorio = new RepositorioCondiciones()
		}
      repositorio;
	}
	
}
