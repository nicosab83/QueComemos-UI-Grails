package ar.algo.adriba.tp1

import java.util.List
import java.util.ArrayList
import java.util.Map
import java.util.HashMap

class RepositorioUsuarios {

	public List<Usuario> todosLosUsuarios = new ArrayList<Usuario>
	public List<Usuario> usuariosPendientes = new ArrayList<Usuario>
	public Map<Usuario,String> usuariosRechazados = new HashMap<Usuario,String> // pinto un refactor de la entrega 3
	
	static RepositorioUsuarios repositorio = null

	private new() {
	}

	static public def RepositorioUsuarios getInstance() {
		if (repositorio == null) {
			repositorio = new RepositorioUsuarios()
		}
      repositorio;
	}

	def void agregar(Usuario unUsuario) {
		todosLosUsuarios.add(unUsuario)
	}

	def void quitar(Usuario unUsuario) {
		todosLosUsuarios.remove(unUsuario)
	}

	def Usuario get(String unNombre) { 
		todosLosUsuarios.findFirst[usuario|usuario.esTuNombre(unNombre)]
	}

	def update(Usuario unUsuario) {
		this.get(unUsuario.nombre).actualizarDatos(unUsuario)
	}

	def List<Usuario> listar(Usuario unUsuario) {
		todosLosUsuarios.filter[usuario|usuario.esTuNombre(unUsuario.nombre)].toList
	}

	def List<Usuario> listar(CondicionPreexistente unaCondicion) {
		todosLosUsuarios.filter[usuario|usuario.tenesCondicionPreexistente(unaCondicion)].toList
	}

	def solicitarIncorporacion(Usuario unUsuario) {
		usuariosPendientes.add(unUsuario)
	}

	def aceptarIncorporacion(Usuario unUsuario) {
		usuariosPendientes.remove(unUsuario)
		this.agregar(unUsuario)
	}

	def String rechazarIncorporacion(Usuario unUsuario, String motivoRechazo) {
		usuariosPendientes.remove(unUsuario)
		usuariosRechazados.put(unUsuario, motivoRechazo)
	}

	def void limpiarTodo() {
		todosLosUsuarios.clear
	}

	def void limpiarPendientes() {
		usuariosPendientes.clear
	}

}
