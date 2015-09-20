package ar.algo.adriba.tp1

import ar.algo.adriba.tp1.Monitor
import java.util.List
import org.slf4j.Logger
import org.slf4j.LoggerFactory


class MonitorLog extends Monitor {
	
	// usamos SLF4J para logging
	final Logger logger = LoggerFactory.getLogger(MonitorLog)
	
	new(CondicionCommand unaCondicion) {
		super(unaCondicion)
	}

	override doExecute(List<Receta> recetas, Persona persona, List<Filtro> filtros) {
		this.log(String.join(", ", recetas.map[receta|receta.nombreDelplato]))
	}

	def void log(String string) {
		logger.info(string)
	}
}
