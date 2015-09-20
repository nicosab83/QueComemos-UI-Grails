package ar.algo.adriba.tp1

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class StubMailSender implements MessageSender {

	public List<Mail> mailsEnviados
	static StubMailSender mailSender = null

	private new() {
		mailsEnviados = new ArrayList<Mail>
	}

	static public def StubMailSender getInstance() {

		if (mailSender == null) {

			mailSender = new StubMailSender
		}
		mailSender

	}

	override send(Mail mail) {
		mailsEnviados.add(mail)

	}
	
	override cantidadMailsEnviados() {
	mailsEnviados.size
	}

}
