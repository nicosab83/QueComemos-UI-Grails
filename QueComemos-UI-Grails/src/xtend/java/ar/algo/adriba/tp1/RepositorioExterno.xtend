package ar.algo.adriba.tp1

import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonValue
import java.util.ArrayList
import java.util.List
import queComemos.entrega3.dominio.Dificultad
import queComemos.entrega3.repositorio.BusquedaRecetas
import queComemos.entrega3.repositorio.RepoRecetas

class RepositorioExterno implements Repositorio {

	val BusquedaRecetas busqueda = new BusquedaRecetas
	val RepoRecetas repositorioRecetas = new RepoRecetas
	
	new(String nombre, Dificultad dificultad, List<String> palabrasClave) {

		busqueda => [
			setNombre(nombre)
			setDificultad(dificultad)
		]

		palabrasClave.forEach[palabra|busqueda.agregarPalabraClave(palabra)]

	}

	override List<Receta> todasLasRecetas() {
		
		this.parserJson(repositorioRecetas.getRecetas(busqueda)) 

	}

	def List<Receta> parserJson(String unStringdeJson) {

		val JsonArray jsonArray = JsonArray.readFrom(unStringdeJson)
		val List<Receta> recetas = new ArrayList<Receta>

		val int i = 0

		for (JsonValue value : jsonArray) {

			val int j = 0
			val Receta unaReceta = new Receta
			val JsonArray ingredientes = jsonArray.get(i).asObject().get("ingredientes").asArray()

			for (JsonValue valor : ingredientes) {
				unaReceta.subRecetaseIngredientes.add(new Comida(ingredientes.get(j).asString()))
			}
			
			unaReceta.nombreDelPlato = jsonArray.get(i).asObject().get("nombre").asString()
			unaReceta.caloriasReceta = jsonArray.get(i).asObject().get("totalCalorias").asInt()
			unaReceta.dificultad = jsonArray.get(i).asObject().get("dificultadReceta").asString()
			unaReceta.tipo = new Publica
			recetas.add(unaReceta)		
			
		}

		recetas.toList
	}

}

/* Este es el JSON que parseamos

[{"nombre":"ensalada caesar","ingredientes":["lechuga","croutons","parmesano"],"
tiempoPreparacion":0,"totalCalorias":15,"dificultadReceta":"FACIL","autor":"Cesa
r Po","anioReceta":2015},{"nombre":"salmon a la plancha","ingredientes":["salmon
","limon"],"tiempoPreparacion":0,"totalCalorias":30,"dificultadReceta":"FACIL","
autor":"Claire Underwood","anioReceta":2015},{"nombre":"churrasco a la sal","ing
redientes":["bife angosto","tomillo","sal gruesa"],"tiempoPreparacion":0,"totalC
alorias":20,"dificultadReceta":"FACIL","autor":"Biff Angoust","anioReceta":2015}
,{"nombre":"ensalada capresse","ingredientes":["tomate","albahaca","mozzarella"]
,"tiempoPreparacion":0,"totalCalorias":10,"dificultadReceta":"FACIL","autor":"Bi
ff Angoust","anioReceta":2015},{"nombre":"pollo al whisky","ingredientes":["whis
ky","pollo","bourbon","ginebra"],"tiempoPreparacion":0,"totalCalorias":50,"dific
ultadReceta":"FACIL","autor":"Doug Stamper","anioReceta":2015},{"nombre":"cassat
ta","ingredientes":["helado de americana","helado de chocolate","helado de fruti
lla"],"tiempoPreparacion":0,"totalCalorias":10,"dificultadReceta":"FACIL","autor
":"Zoe Barnes","anioReceta":2015}]

*/
