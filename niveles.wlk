import pepita.*
import comidas.*
import extras.*
import wollok.game.*



object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
		game.addVisual(energiaPepita)

		
	}

	

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		game.addVisual(energiaPepita)
		config.configurarTeclas()
		//config.configurarGravedad()  
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		game.addVisual(energiaPepita)
		config.configurarTeclas()
		config.configurarColisiones()
		config.configurarGravedad()
	}

}

object config {

	method configurarTeclas() {
			keyboard.left().onPressDo({ pepita.irA(pepita.position().left(1)) })
			keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1))})
			keyboard.up().onPressDo({ pepita.irA(pepita.position().up(1))})
			keyboard.down().onPressDo({ pepita.irA(pepita.position().down(1))})
		
		
		keyboard.c().onPressDo{pepita.quiereComer()}

	}
	
	method configurarGravedad() {
		game.onTick(800,"gravedad",{pepita.gravedad()})
	}
	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita) })
	}
}