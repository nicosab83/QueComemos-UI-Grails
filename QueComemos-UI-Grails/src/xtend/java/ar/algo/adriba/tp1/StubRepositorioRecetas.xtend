package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.applicationmodels.BuscadorRecetas
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class StubRepositorioRecetas {

	public List<Receta> recetas = new ArrayList<Receta>

	public static String FACIL = "Facil"
	public static String MEDIA = "Media"
	public static String DIFICIL = "Dificil"
	static StubRepositorioRecetas repositorio = null

	List<String> dificultades = #[FACIL, MEDIA, DIFICIL]

	public static String PRIMAVERA = "Primavera"
	public static String VERANO = "Verano"
	public static String OTONIO = "Otoño"
	public static String INVIERNO = "Invierno"
	public static String TODOELANIO = "Todo el año"

	List<String> temporadas = #[PRIMAVERA, VERANO, OTONIO, INVIERNO, TODOELANIO]

	val carne = new Comida(99, "carne", 1)
	val harina = new Comida(25, "harina", 20)
	val huevo = new Comida(10, "huevo", 3)
	val panRallado = new Comida(12, "pan rallado", 50)
	val verdura = new Comida(6, "verdura", 12)
	val queso = new Comida(250, "queso", 800)
	val prepizza = new Comida(200, "prepizza", 50)
	val salsaDeTomate = new Comida(20, "salsa de tomate", 50)
	val sal = new Comida(0, "sal", 0)
	val salsaBlanca = new Comida(50, "salsa blanca", 400)
	val lomo = new Comida(30, "lomo", 200)
	val garbanzos = new Comida(30, "garbanzos", 500)
	val limon = new Comida(1, "limon", 10)
	val ajo = new Comida(1, "ajo", 10)
	val papasFritas = new Comida(5, "papas fritas", 2000)

	val Usuario usuarioVegano = new Usuario()
	var Receta hummus = new Receta

	private new() {
		this.init()
	}

	static public def StubRepositorioRecetas getInstance() {
		if (repositorio == null) {
			repositorio = new StubRepositorioRecetas()
		}
      repositorio;
	}

	def void init() {

		hummus = new RecetaBuilder().tipoDeReceta(new Privada(usuarioVegano, hummus)).nombreDelPlato(
			"Hummus de garbanzo").agregarIngrediente(garbanzos).agregarIngrediente(limon).agregarIngrediente(ajo).
			setearCalorias(600).setearTemporada("Verano").setearDificultad(FACIL).build

		recetas => [
			add(
				new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Milanesas veganas").
					agregarIngrediente(panRallado).agregarIngrediente(carne).setearCalorias(150).
					setearPreparacion("Quien quiere preparar esto? Es un asco.").setearDificultad(FACIL).
					setearTemporada(VERANO).build)
			add(
				new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Milanesa a caballo").
					agregarIngrediente(harina).agregarIngrediente(huevo).agregarIngrediente(panRallado).
					agregarIngrediente(carne).agregarIngrediente(papasFritas).setearCalorias(8000).
					setearPreparacion("Marca 0-800-Farola y chupate los dedos. :-)").setearDificultad(FACIL).
					setearTemporada(INVIERNO).build)
			add(
				new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Sopa de Verdura con Queso").
					agregarIngrediente(verdura).agregarIngrediente(sal).agregarIngrediente(queso).setearCalorias(200).
					setearPreparacion("Sale una pausa Knor").setearDificultad(DIFICIL).setearTemporada(OTONIO).build
			)
			add(
				new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Milanesas").agregarIngrediente(harina).
					agregarIngrediente(huevo).agregarIngrediente(panRallado).agregarIngrediente(carne).
					setearCalorias(150).setearPreparacion("Una explicacion...").setearDificultad(DIFICIL).
					setearTemporada(TODOELANIO).build)
			add(
				new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Milanesa napolitana").
					agregarIngrediente(harina).agregarIngrediente(huevo).agregarIngrediente(panRallado).
					agregarIngrediente(carne).agregarIngrediente(queso).agregarIngrediente(salsaDeTomate).
					setearCalorias(8000).setearPreparacion("Una explicacion...").setearDificultad(MEDIA).
					setearTemporada(VERANO).build)
			add(
				new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Sopa de Verdura").
					agregarIngrediente(verdura).agregarIngrediente(sal).setearCalorias(200).
					setearPreparacion("Una explicacion...").setearDificultad(MEDIA).setearTemporada(PRIMAVERA).build
			)
			add(
				new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Pizza de muzzarella").
					agregarIngrediente(prepizza).agregarIngrediente(salsaDeTomate).agregarIngrediente(queso).
					setearDificultad(FACIL).setearTemporada(VERANO).setearCalorias(500).
					setearPreparacion("Una explicacion...").build)
			add(
				new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Pizza de verdura y salsa blanca").
					agregarIngrediente(prepizza).agregarIngrediente(salsaDeTomate).agregarIngrediente(queso).
					agregarIngrediente(salsaBlanca).agregarIngrediente(verdura).setearCalorias(560).
					setearPreparacion("Una explicacion...").setearDificultad(MEDIA).setearTemporada(INVIERNO).build)
			add(
				new RecetaBuilder().tipoDeReceta(new Publica).nombreDelPlato("Lomo a la Plancha").
					agregarIngrediente(lomo).setearCalorias(300).setearPreparacion("Una explicacion...").
					setearDificultad(MEDIA).setearTemporada(VERANO).build)
			add(hummus)
		]
	}

	def void validarNombresDuplicados(String nombre) {
		if (!this.search(nombre).isEmpty) {
			throw new UserException("Ya existe una receta con el nombre: " + nombre)
		}
	}

	def search(String nombre) {
		recetas.filter[receta|receta.nombreDelPlato.matches(nombre)].toList
	}

	def List<Receta> search(BuscadorRecetas example) {

		var List<Receta> result = new ArrayList<Receta>

		result = recetas

		if (example.nombre != null) {
			result = getCriterioPorNombre(result, example.nombre)
		}

		if (example.dificultad != null) {
			result = getCriterioPorDificultad(result, example.dificultad)
		}

		if (example.ingrediente != null) {
			result = getCriterioPorIngrediente(result, example.ingrediente)
		}

		if (example.caloriasMinimo != null) {
			result = getCriterioPorCaloriasMinimo(result, example.caloriasMinimo)
		}

		if (example.caloriasMaximo != null) {
			result = getCriterioPorCaloriasMaximo(result, example.caloriasMaximo)
		}
		if (example.temporada != null) {
			result = getCriterioPorTemporada(result, example.temporada)
		}
		if (example.aplicarFiltrosUsuario) {
			result = getCriterioPorCondicionesUsuario(result, example.usuario)
		}
		result
	}

	def List<Receta> getCriterioPorNombre(List<Receta> recetas, String nombre) {
		recetas.filter[receta|receta.nombreDelPlato.toLowerCase.contains(nombre.toLowerCase)].toList
	}

	def List<Receta> getCriterioPorDificultad(List<Receta> recetas, String dificultad) {
		recetas.filter[receta|receta.dificultad.matches(dificultad)].toList
	}

	def List<Receta> getCriterioPorIngrediente(List<Receta> recetas, String ingrediente) {
		recetas.filter[receta|receta.tenes(ingrediente)].toList
	}

	def List<Receta> getCriterioPorCaloriasMinimo(List<Receta> recetas, Integer caloriasMinimo) {
		recetas.filter[receta|receta.caloriasReceta > caloriasMinimo].toList
	}

	def List<Receta> getCriterioPorCaloriasMaximo(List<Receta> recetas, Integer caloriasMaximo) {
		recetas.filter[receta|receta.caloriasReceta < caloriasMaximo].toList
	}

	def List<Receta> getCriterioPorTemporada(List<Receta> recetas, String temporada) {
		recetas.filter[receta|receta.temporada.contains(temporada)].toList
	}

	def List<Receta> getCriterioPorCondicionesUsuario(List<Receta> recetas, Usuario usuario) {
		recetas.filter[receta|usuario.esAptaParaMi(receta)].toList
	}

	def void agregar(Receta receta) {
		recetas.add(receta)
	}

}
