package ar.algo.adriba.tp1.applicationmodels

import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.Usuario
import ar.algo.adriba.tp1.RecetaBuilder
import ar.algo.adriba.tp1.Comida
import ar.algo.adriba.tp1.Publica
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.algo.adriba.tp1.Cosas
import org.uqbar.commons.utils.Dependencies

@Observable
@Accessors
class DetalleRecetaParaUsuario {

	boolean editable = false
	Receta receta
	Usuario usuario

	new(Receta unaReceta, Usuario unUsuario) {
		receta = unaReceta
		usuario = unUsuario
	}

	def boolean isFavorita() {
		usuario.esFavoritaEsta(receta)
	}

	def List<String> getCondimentos() {
		receta.subRecetaseIngredientes.filter[cosa|cosa.esUnIngrediente() && cosa.getCantidad == 0].map[it.nombre].
			toList
	}

	def List<Cosas> getIngredientes() {
		receta.subRecetaseIngredientes.filter[cosa|cosa.esUnIngrediente() && cosa.getCantidad > 0].toList
	}

	@Dependencies("receta.subRecetaseIngredientes")
	def List<String> getNombresDeCondicionesInadecuadas() {
		receta.paraQueCondicionesSoyInadecuada().map[condicion|condicion.nombre].toList
	}

	def String getEsDelUsuario() {
		if (usuario.usuarioTiene(receta)) {
			"vos"
		} else {
			"otro"
		}
	}

	def getCaloriasYAutor() {
		receta.caloriasReceta + " Calorias" + "	" + "Creado por " + this.esDelUsuario
	}

	def String getOrigen() {
	if (usuario.usuarioTiene(receta)) {"usuario"}
		else if(usuario.alguienDelGrupoConoce(receta)) {"grupo"}
			else if (receta.tipo.class == Publica) {"publica"}
	}
}
