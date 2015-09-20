package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Rutina {
	
	boolean activa 
	int tiempoDeEjercicio
	
	new(int valor, boolean tipo){
		tiempoDeEjercicio=valor
		activa=tipo
	}
	
	def boolean sosActivaeIntesiva() {
		this.sosActiva && this.sosIntensiva
	}
	
	def boolean sosIntensiva() {
		tiempoDeEjercicio>60
	}
	
	def boolean sosActiva() {
		activa==true
	}
	
	
}