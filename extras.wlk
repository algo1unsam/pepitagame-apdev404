import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "GANASTE! WIII")
		game.schedule(2000, { game.stop() })
	}
}


object silvestre {

	method image() = "silvestre.png"
	var property posX = 3
	method posicionX(){
		if(pepita.position().x()>=3){
			posX = pepita.position().x()
		}
		return posX
	} 
	method position() = game.at(self.posicionX(), 0)
	
	

}
