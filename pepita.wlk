import comidas.*
import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0,7)
	method image() {
		return if(self.estaCansada()) "pepita-gris.png" else if (self.estaEnElNido()) "pepita-grande.png" else if(self.atrapada()) "pepita-gris.png" else "pepita.png"
		
	}

	method quiereComer(){
		var comida = game.uniqueCollider(pepita)
		self.come(comida)
	}

	method come(comida) {
		energia += + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method atrapada(){
		return (position.x()==silvestre.position().x()&& position.y()==silvestre.position().y())
	}

	method perdiste(){
		if(self.atrapada()){
			game.say(self,"¡PERDI!")
			game.stop()
		}
	}


	method irA(nuevaPosicion) {
		if(self.atrapada()==false && self.estaCansada()==false && nuevaPosicion.x().between(0, 9) && nuevaPosicion.y().between(0, 9)){
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
		}
	}

	method estaCansada() {
		if(energia<=0){
			game.say(self,"¡PERDI!")
			game.onTick(2000,"terminarjuego",{game.stop()})
		}
		return energia <= 0
	}

	
	method gravedad(){
		position = self.position().down(1)
	}
	
	method estaEnElNido() {
		return position == nido.position()
	}
	
	method win(){
		if(self.estaEnElNido()){
			game.say(self,"GANE!")
			game.onTick(2000,"terminarjuego",{game.stop()})
		}
	}
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

	method energia(){
		return energia
	}

}


object energiaPepita{
	method position()=game.at(8,9)
	method text()= "Energia: "+pepita.energia()
	method textColor() = "FFFFFF"
}

