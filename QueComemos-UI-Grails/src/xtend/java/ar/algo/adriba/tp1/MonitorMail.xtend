package ar.algo.adriba.tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class MonitorMail extends Monitor {

	String para = null // en el test le clavamos "administrador@quecomemos.com"
	MessageSender messageSender
			
	new(MessageSender pMessageSender, String destinatario, CondicionCommand unaCondicion) {
		super(unaCondicion)
		messageSender = pMessageSender
		para = destinatario
	}
			
	override doExecute(List<Receta> recetas, Persona persona, List<Filtro> filtros){
		
			this.enviarMail(recetas, persona, filtros)
		
	}

	def void enviarMail(List<Receta> recetas, Persona persona, List<Filtro> filtros) {

		val nuevoMail = new Mail => [
			to = para
			from = "que@comemos.com"
			titulo = "Notificacion de consulta de usuario " + persona.getNombre()
			message = 
			"Cantidad de recetas: " + String.valueOf(this.cantidadDeRecetas(recetas)) + " " + "Filtros usados: " + String.join(", ", filtros.map[filtro|filtro.nombreFiltro])
				
		]
		
		messageSender.send(nuevoMail)
	}


}
