package ar.algo.adriba.tp1

import java.util.List
import java.util.Map
import java.util.Collections
import java.util.Comparator
import java.util.LinkedList
import java.util.Map.Entry
import java.util.LinkedHashMap

abstract class ObserversConsulta {

	def void send(List<Receta> recetas, Persona persona)

	// Ordena un Map de recetas segun value 
	def Map<Receta, Integer> sortByComparator(Map<Receta, Integer> unsortMap) {

		val List<Entry<Receta, Integer>> list = new LinkedList<Entry<Receta, Integer>>(unsortMap.entrySet())

		// Ordenamos segun valor la linked list con los entrysets
		Collections.sort(list,
			new Comparator<Entry<Receta, Integer>>() {
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

	def consultasPor(List<Receta> recetas, Map<Receta, Integer> map) {
		for (Receta receta : recetas) {
			if (map.containsKey(receta)) {
				val int valor = map.get(receta)
				map.put(receta, valor + 1)
			} else {
				map.put(receta, 1)
			}

		}
	}

	def boolean hayConsultas(Map<Receta, Integer> map) {
		map.size() > 0
	}
}




