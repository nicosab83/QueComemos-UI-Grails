package ar.algo.adriba.tp1.applicationmodels

import ar.algo.adriba.tp1.MostrarLosPrimerosDiez
import ar.algo.adriba.tp1.ObserverDeConsultasDesdeListado
import ar.algo.adriba.tp1.ObserverMasConsultadaDesdeListado
import ar.algo.adriba.tp1.ObserverMasConsultadaDesdeListadoPorUsuario
import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.StubRepositorioRecetas
import ar.algo.adriba.tp1.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException

@Accessors
@Observable
class ListaDeRecetasDelUsuario {

	Usuario usuario
	DetalleRecetaParaUsuario recetaSeleccionada = null
	List<ObserverDeConsultasDesdeListado> observers = new ArrayList<ObserverDeConsultasDesdeListado>
	MostrarLosPrimerosDiez top10 = new MostrarLosPrimerosDiez
	String descripcionLista
	List<DetalleRecetaParaUsuario> listaDeRecetas = new ArrayList<DetalleRecetaParaUsuario>
	BuscadorRecetas buscador
	boolean filtroEditable = true

	new(Usuario unUsuario) {
		usuario = unUsuario
		this.init()
	}

	new() {
		usuario = new Usuario()
		this.init()
	}

	def void init() {
		this.llenarListaDeRecetas()
		recetaSeleccionada = null
		buscador = new BuscadorRecetas(usuario)
		observers.add(ObserverMasConsultadaDesdeListadoPorUsuario.getInstance(usuario))
		observers.add(ObserverMasConsultadaDesdeListado.getInstance())
	}

	def void llenarListaDeRecetas() {
		if (usuario.tieneFavoritas()) {
			descripcionLista = "Estas son tus recetas favoritas"
			listaDeRecetas = getDiezRecetasFavoritas()
		} else {
			if (ObserverMasConsultadaDesdeListadoPorUsuario.getInstance(usuario).hayConsultas()) {
				descripcionLista = "Estas fueron tus ultimas consultas"
				listaDeRecetas = getDiezUltimasConsultas()
			} else {
				descripcionLista = "Estas son las recetas top del momento"
				listaDeRecetas = getDiezRecetasMasConsultadas()
			}
		}
	}

	def List<DetalleRecetaParaUsuario> getDiezRecetasFavoritas() {
		top10.ordenar(usuario.recetasFavoritas).forEach[receta|
			listaDeRecetas.add(new DetalleRecetaParaUsuario(receta, usuario))]
		listaDeRecetas
	}

	def List<DetalleRecetaParaUsuario> getDiezUltimasConsultas() {
		top10.ordenarRecetas(ObserverMasConsultadaDesdeListadoPorUsuario.getInstance(usuario).recetasMasConsultadas)
	}

	def List<DetalleRecetaParaUsuario> getDiezRecetasMasConsultadas() {
		if (ObserverMasConsultadaDesdeListado.getInstance().hayConsultas()) {

			top10.ordenarRecetas(ObserverMasConsultadaDesdeListado.getInstance().recetasMasConsultadas)

		} else {
			top10.ordenar(StubRepositorioRecetas.getInstance().recetas).forEach[receta|
				listaDeRecetas.add(new DetalleRecetaParaUsuario(receta, usuario))]

			listaDeRecetas

		}
	}

	def List<Receta> getTodasLasRecetas() {
		StubRepositorioRecetas.getInstance().recetas
	}

	def void notificarObserversConsulta() {
		observers.forEach[obs|obs.notificar(recetaSeleccionada)]
	}

	def marcarComoFavorita() {
		usuario.marcarComoFavorita(recetaSeleccionada.receta)
	}

	// WORKAROUND para que refresque la grilla en las actualizaciones
	def void refrescarGrilla() {
		this.clearLista()
		this.llenarListaDeRecetas()
	}

	def void clearLista() {
		descripcionLista = null
		listaDeRecetas.clear
		clearSeleccion()
	}

	def void clearBusqueda() {
		buscador = new BuscadorRecetas(usuario)
	}

	def void clearSeleccion() {
		recetaSeleccionada = null
	}

	def void buscar() {
		if (noHayResultados()) {
			this.clearBusqueda()
			this.refrescarGrilla()
			throw new UserException("No se encontraron resultados")
		} else {
			mostrarResultados()
			this.clearBusqueda()
		}

	}

	def void mostrarResultados() {
		this.clearLista()
		StubRepositorioRecetas.getInstance().search(buscador).forEach[receta|
			listaDeRecetas.add(new DetalleRecetaParaUsuario(receta, usuario))]
	}

	def boolean noHayResultados() {
		StubRepositorioRecetas.getInstance().search(buscador).isEmpty
	}

}
