package ar.algo.adriba.tp1

import java.util.Date

class Fecha extends Date {

	new(long l) {
		super(l)
	}
	
	def boolean esAnteriorAHoy() {

		this.before(new Date)

	}

}
