package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Comida implements Cosas {

	public String nombre
	int cantidad
	int calorias
	List<String> ingredientesCaros = new ArrayList<String> 
	
	new(int unasCalorias, String unNombre) {
		calorias = unasCalorias
		nombre = unNombre
		cantidad = 0
		ingredientesCaros => [
			add("salmon")
			add("lomo")
			add("alcaparras")
			add("lechon")
		]
	}
	
	new(int unasCalorias, String unNombre, int unaCantidad) {
		calorias = unasCalorias
		nombre = unNombre
		cantidad = unaCantidad
		ingredientesCaros => [
			add("salmon")
			add("lomo")
			add("alcaparras")
			add("lechon")
		]
	}

	override nombre() {
		nombre
	}

	override unIngrediente() {
		true
	}

	override tenesDemasiadaAzucar() {
		this.tenes("azucar") && this.tenesMasDelLimite(100)
	}

	override tenesCarne() {
		this.tenes("pollo||carne||chivito||chori||lomo")
	}

	override tenesSalOCaldo() {
		this.tenes("sal") || this.tenes("caldo")
	}

	new(String unNombre) {
		nombre = unNombre
	}

	new() {
	}

	override tenes(String unaCosa) {
		nombre.matches(unaCosa)
	}

	def boolean tenesMasDelLimite(int limite) {
		cantidad > limite
	}

	override esCaro() {
		ingredientesCaros.contains(this.nombre)
	}
	
	override esUnIngrediente() {
	true
	}

}
