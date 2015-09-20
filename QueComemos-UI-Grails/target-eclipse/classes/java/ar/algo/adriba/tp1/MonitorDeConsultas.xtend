package ar.algo.adriba.tp1

import java.util.List
import java.util.HashMap
import java.util.Map
import org.joda.time.DateTime
import java.util.LinkedList
import java.util.Comparator
import java.util.Collections
import java.util.LinkedHashMap
import java.util.Map.Entry

// esto se uso solo para la entrega 3, no se USA
class MonitorDeConsultas {

	int veganosQueConsultaron
	Map<Receta, Integer> recetasMasConsultadasPorMujeres = new HashMap<Receta, Integer>
	Map<Receta, Integer> recetasMasConsultadasPorHombres = new HashMap<Receta, Integer>
	Map<Receta, Integer> recetasMasConsultadas = new HashMap<Receta, Integer>
	public Map<Integer, Integer> cantidadDeConsultasPorHora = new HashMap<Integer, Integer>

	def consultasPor(List<Receta> recetas, Map<Receta, Integer> map) {
		for (Receta receta : recetas) {
			val int valor = map.get(receta)
			map.put(receta, valor + 1)

		}
	}

	def observer(List<Receta> recetas, Persona persona) {
		this.consultaVegano(recetas, persona)
		this.consultaDeHora(recetas, persona)
		this.consultaPorSexo(recetas, persona)
		this.masConsultada(recetas, persona)
	}

	//Monitor 1---------------------------
	def consultaVegano(List<Receta> recetas, Persona persona) {
		if (persona.esVegana && this.consultastePorUnaRecetaDificil(recetas)) {
			veganosQueConsultaron = veganosQueConsultaron + 1
		}
	}

	def boolean consultastePorUnaRecetaDificil(List<Receta> recetas) {
		recetas.exists[receta|receta.tuDificultadEs("Dificil")]
	}

	def int cantidadDeVeganosQueConsultaronRecetasDificiles() {
		veganosQueConsultaron
	}

	//Monitor 2-------------------------
	def consultaDeHora(List<Receta> recetas, Persona persona) {
		val DateTime dt = new DateTime();
		val int hour = dt.getHourOfDay()
		val int cantidad = cantidadDeConsultasPorHora.get(hour)
		cantidadDeConsultasPorHora.put(hour, cantidad + 1);
	}

	def int cantidadDeConsultasALaHora(int unaHora) {

		cantidadDeConsultasPorHora.get(unaHora)

	}

	//Monitor 3-------------------------
	def consultaPorSexo(List<Receta> recetas, Persona persona) {
		if (persona.sexo.equals(Sexo.FEMENINO)) {
			this.consultasPor(recetas, recetasMasConsultadasPorMujeres)
		} else {
			if (persona.sexo.equals(Sexo.MASCULINO)) {
				this.consultasPor(recetas, recetasMasConsultadasPorHombres)
			}
		}
	}


	//Monitor 4----------------------------
	def masConsultada(List<Receta> recetas, Persona persona) {

		this.consultasPor(recetas, recetasMasConsultadas)
	}
	
	//Metodo para chequear las mas consultadas del monitor 3 y 4
	
	def Map<Receta, Integer> sortByComparator(Map<Receta, Integer> unsortMap) {

		val List<Entry<Receta, Integer>> list = new LinkedList<Entry<Receta, Integer>>(unsortMap.entrySet())

		// Ordenamos segun valor la linked list con los entrysets
		Collections.sort(list,	new Comparator<Entry<Receta, Integer>>() {
				override compare(Entry<Receta, Integer> o1, Entry<Receta, Integer> o2) {
					return o2.getValue().compareTo(o1.getValue())
				}
			})

		// Metemos todo ordenadamente en un nuevo map 
		val Map<Receta, Integer> sortedMap = new LinkedHashMap<Receta, Integer>
		for (Entry<Receta, Integer> entry : list) {
			sortedMap.put(entry.getKey(), entry.getValue());
		}

		sortedMap
	}

}
