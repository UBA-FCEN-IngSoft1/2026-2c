!classDefinition: #PenalesTest category: #'Penales-Solu'!
TestCase subclass: #PenalesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test01DelanteroNoPuedeApuntarHaciaAfueraDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: -1@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test02DelanteroNoPuedeApuntarHaciaAfueraDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 3@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test03DelanteroNoPuedeApuntarHaciaAbajoDelArco
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@-1 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test04DelanteroNoPuedeApuntarHaciaArribaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@3 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test05ArqueroNoPuedePasarseDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: -1@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test06ArqueroNoPuedePasarseDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 3@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test07ArqueroNoPuedeMeterseAbajoDeLaTierra
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@-1.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test08ArqueroNoPuedeSaltarPorEncimaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@3.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test09DireccionesDiferentesGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante
	"varXXXX es por VAR, de 'Video Assistant Referee'"! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test10MismasDireccionesInsuficienteFuerzaGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 10.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test11MismasDireccionesSuficienteFuerzaAtajaArquero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test12DelanteroQueTiraAColocarPierde50PorcFuerza
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"(delantero sacrificia potencia para ganar mayor precisión)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test13ArqueroQueEligeAntesDeTiroVsJabulaniAColocarSuma50PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige donde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	"(el arquero llega más cómodo y aprovecha mejor su fuerza)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 34.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 51 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test14FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige adonde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 32.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 48 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test15ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAColocarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que espera y se adelanta ante un tiro de jabulani a colocar ignora la 2da coordenada (altura) al atajar..."	
	"(al adelanterse encara la pelota antes de que su elevación se transforme en un problema)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test16PelotaPlayeraUsadaAColocarLeHacePerder20PorcFuerzaExtraAlDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% de fuerza adicional al delantero que la use para colocar... (no importa el arquero)"
	"(no debería ser reglamentaria... al menos no es de trapo, nos responden)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test17ArqueroQueEligeAntesDeTiroVsPlayeraAColocarSuma100PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	"(a quien madruga...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 20.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test18FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsPlayeraAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 19.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 38 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test19ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAColocarEsDescubiertoYPuntoParaDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Arquero que espera y se adelanta ante tiro con la lenta pelota playera, siempre es descubierto por el Árbitro, y el punto se le otorga al Delantero..."
	"(lo que servía de ventaja ante la Jabulani rápida, acá es tan obvio por lo que tarda en llegar la pelota al arco, que marchás preso...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:52'!
test20DelanteroTiraAMatarAlAnguloInferiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:47'!
test21DelanteroTiraAMatarAlAnguloSuperiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:41'!
test22DelanteroTiraAMatarAlAnguloInferiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:36'!
test23DelanteroTiraAMatarAlAnguloSuperiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:29'!
test24DelanteroTiraAMatarNoAlAnguloMantieneDireccionTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@1.

	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test25DelanteroTiraAMatarUsa100PorcFuerzaBase
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:150.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 150 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test26DelanteroTiraAMatarConJabulaniGana20PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	"(Jabulani a matar es la elección de los guerreros Z)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 120.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test27FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAMatar
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 119.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test28ArqueroQueEligeAntesDeTiroVsJabulaniAMatarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que elige donde tirarse antes de un tiro de jabulani a matar, ignora la 2da coordenada (altura) al atajar..."		
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test29ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAMatarNuncaAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera a ver la dirección del remate de una pelota jabulani rápida a matar antes de lanzarse, nunca la ataja sin importar nada, siquiera que se adelantó..."	
	"(su poder era de más de 9000!! era impresionante, no podía moverme, sólo la ví pasar... f )"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@1 arqueroSeLanzaEnDirección: 1@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test30DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAdentro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(y voló.. y me hizo volar... y yo volé de él...  pero acá por la arbolada... y el voló.. y se estrelló por acá por la pared...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 1@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test31DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAfuera
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(El caso auspiciado por el Pipita...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@1 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@3 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test32ArqueroQueEligeAntesDeTiroVsPlayeraAMatarAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 18:29:53'!
test33ArqueroQueEligeAntesDeTiroVsPlayeraAMatarNoAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test34ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAMatarSiempreAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera y se adelanta ante una pelota playera lenta a matar, siempre la ataja sin importar nada..."	
	"(como la pelota es taaaan lentaaa, el arquero se puede ir a tomar un cafe, verse una serie, volver y aún atajar la pelota habiendose tirado a cualquier lado. Pero igual es más rapida que cuando se la tira a colocar, donde indefectiblemente el arbitro lo detecta...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !


!classDefinition: #Arquero category: #'Penales-Solu'!
Object subclass: #Arquero
	instanceVariableNames: 'estrategiaDeLanzarse fuerzaBase'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!Arquero methodsFor: 'fuerza resultante' stamp: 'NR 9/27/2025 19:54:53'!
fuerzaResultanteDeAtajada: modificadorAtajadaNormalizado
	
	^ fuerzaBase * modificadorAtajadaNormalizado ! !

!Arquero methodsFor: 'fuerza resultante' stamp: 'NR 9/27/2025 19:54:59'!
fuerzaSuficienteAtajandoA: delantero conModificadorTiro: modificadorDelantero conModificadorAtajada: modificadorArquero

	^ (delantero fuerzaResultanteRemate: modificadorDelantero) <= (self fuerzaResultanteDeAtajada: modificadorArquero) ! !


!Arquero methodsFor: 'atajando penales' stamp: 'NR 9/27/2025 20:07:12'!
recibirRemateAColocarJabulaniModificandoFuerzaEn: modificadorFuerzaTiroAColocar conDireccion: direccionTiro jugandoPenales: penales

	estrategiaDeLanzarse atajarRemateAColocarJabulanModificandoFuerzaEn: modificadorFuerzaTiroAColocar conDireccion: direccionTiro jugandoPenales: penales

	! !

!Arquero methodsFor: 'atajando penales' stamp: 'NR 9/27/2025 20:07:20'!
recibirRemateAColocarPlayeraModificandoFuerzaEn: modificadorFuerzaTiroAColocarPelotaPlayera conDireccion: direccionTiro jugandoPenales: penales

	estrategiaDeLanzarse atajarRemateAColocarPlayeraModificandoFuerzaEn: modificadorFuerzaTiroAColocarPelotaPlayera conDireccion: direccionTiro jugandoPenales: penales

	! !

!Arquero methodsFor: 'atajando penales' stamp: 'NR 9/27/2025 20:07:29'!
recibirRemateAMatarJabulaniModificandoFuerzaEn: modificadorFuerzaTiroAMatarConJabulani conDireccion: direccionTiroDesviadoPorAMatar jugandoPenales: penales

	estrategiaDeLanzarse atajarRemateAMatarJabulaniModificandoFuerzaEn: modificadorFuerzaTiroAMatarConJabulani conDireccion: direccionTiroDesviadoPorAMatar jugandoPenales: penales

	! !

!Arquero methodsFor: 'atajando penales' stamp: 'NR 9/27/2025 20:07:41'!
recibirRemateAMatarPlayeraEnDireccion: direccionTiroDesviadoPorAMatarOPorPlayeraAMatar jugandoPenales: penales
	
	estrategiaDeLanzarse atajarRemateAMatarPlayeraEnDireccion: direccionTiroDesviadoPorAMatarOPorPlayeraAMatar jugandoPenales: penales

	! !


!Arquero methodsFor: 'initialization' stamp: 'NR 9/22/2023 06:52:01'!
initializeConEstrategiaDeLanzarse: unaEstrategiaDeLanzarse conFuerza: fuerzaBaseDelArquero 
	
	estrategiaDeLanzarse := unaEstrategiaDeLanzarse with: self.
	fuerzaBase := fuerzaBaseDelArquero! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #'Penales-Solu'!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'instance creation' stamp: 'NR 9/22/2023 06:50:54'!
eligeDireccionAntesDeTiroSuFuerzaBaseEs: fuerzaBaseDelArquero
	
	^self new initializeConEstrategiaDeLanzarse: ElegirDireccionAntesTiro conFuerza: fuerzaBaseDelArquero! !

!Arquero class methodsFor: 'instance creation' stamp: 'NR 9/24/2023 07:44:39'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: fuerzaBaseDelArquero

	^self new initializeConEstrategiaDeLanzarse: EsperaTiroYSeAdelanta conFuerza: fuerzaBaseDelArquero! !


!classDefinition: #Atajada category: #'Penales-Solu'!
Object subclass: #Atajada
	instanceVariableNames: 'arquero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!Atajada methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:55:35'!
atajarRemateAColocarJabulanModificandoFuerzaEn: modificadorFuerzaTiroAColocar conDireccion: direccionTiro jugandoPenales: penales
	
	self subclassResponsibility ! !

!Atajada methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:55:41'!
atajarRemateAColocarPlayeraModificandoFuerzaEn: modificadorFuerzaTiroAColocarConPlayera conDireccion: direccionTiro jugandoPenales: penales
	
	self subclassResponsibility ! !

!Atajada methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:55:48'!
atajarRemateAMatarJabulaniModificandoFuerzaEn: modificadorFuerzaTiroAMatarConJabulani conDireccion: direccionTiroDesviadoPorAMatar jugandoPenales: penales
		
	self subclassResponsibility ! !

!Atajada methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:56:04'!
atajarRemateAMatarPlayeraEnDireccion: direccionTiroDesviadoPorAMatarOPorPlayeraAMatar jugandoPenales: penales

		self subclassResponsibility ! !


!Atajada methodsFor: 'initialization' stamp: 'NR 9/21/2023 23:40:33'!
initializeWith: unArquero

	arquero := unArquero! !


!Atajada methodsFor: 'cambio reglas' stamp: 'NR 9/24/2023 07:52:13'!
arqueroAtajaIgnorandoAlturaTiro

	^ [:coordTiro :coordAtaj | coordTiro x = coordAtaj x]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Atajada class' category: #'Penales-Solu'!
Atajada class
	instanceVariableNames: ''!

!Atajada class methodsFor: 'instance creation' stamp: 'NR 9/20/2023 06:53:21'!
with: unArquero

	^self new initializeWith: unArquero! !


!classDefinition: #ElegirDireccionAntesTiro category: #'Penales-Solu'!
Atajada subclass: #ElegirDireccionAntesTiro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!ElegirDireccionAntesTiro methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:57:25'!
atajarRemateAColocarJabulanModificandoFuerzaEn: modificadorFuerzaTiroAColocar conDireccion: direccionTiro jugandoPenales: penales
	
	penales modificadorFuerzaTiroResultante: modificadorFuerzaTiroAColocar; modificadorFuerzaAtajadaResultante: 1.5! !

!ElegirDireccionAntesTiro methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:57:38'!
atajarRemateAColocarPlayeraModificandoFuerzaEn: modificadorFuerzaTiroAColocarConPlayera conDireccion: direccionTiro jugandoPenales: penales
	
	penales modificadorFuerzaTiroResultante: modificadorFuerzaTiroAColocarConPlayera; modificadorFuerzaAtajadaResultante: 2! !

!ElegirDireccionAntesTiro methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:57:42'!
atajarRemateAMatarJabulaniModificandoFuerzaEn: modificadorFuerzaTiroAMatarConJabulani conDireccion: direccionTiroDesviadoPorAMatar jugandoPenales: penales
	
	| arqueroEnCoordenadasCorrectas |
	
	arqueroEnCoordenadasCorrectas := self arqueroAtajaIgnorandoAlturaTiro.
	
	penales modificadorFuerzaTiroResultante: modificadorFuerzaTiroAMatarConJabulani; direccionDeRemateResultanteEnPenal: direccionTiroDesviadoPorAMatar; resolverCoordenadasDeArqueroCorrectasDePenalCon: arqueroEnCoordenadasCorrectas.! !

!ElegirDireccionAntesTiro methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:57:48'!
atajarRemateAMatarPlayeraEnDireccion: direccionTiroDesviadoPorAMatarOPorPlayeraAMatar jugandoPenales: penales

	| arqueroEnCoordenadasCorrectas |
	
	arqueroEnCoordenadasCorrectas  :=  self arqueroAtajaIgnorandoAnchoTiro.
	
	penales direccionDeRemateResultanteEnPenal: direccionTiroDesviadoPorAMatarOPorPlayeraAMatar; resolverCoordenadasDeArqueroCorrectasDePenalCon: arqueroEnCoordenadasCorrectas
	
	! !


!ElegirDireccionAntesTiro methodsFor: 'cambio reglas' stamp: 'NR 9/24/2023 07:42:00'!
arqueroAtajaIgnorandoAnchoTiro

	^ [:coordTiro :coordAtaj | coordTiro y = coordAtaj y]! !


!classDefinition: #EsperaTiroYSeAdelanta category: #'Penales-Solu'!
Atajada subclass: #EsperaTiroYSeAdelanta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!EsperaTiroYSeAdelanta methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:57:59'!
atajarRemateAColocarJabulanModificandoFuerzaEn: modificadorFuerzaTiroAColocar conDireccion: direccionTiro jugandoPenales: penales

	| arqueroEnCoordenadasCorrectas |
	
	arqueroEnCoordenadasCorrectas  := self arqueroAtajaIgnorandoAlturaTiro.
	
	penales modificadorFuerzaTiroResultante: modificadorFuerzaTiroAColocar; resolverCoordenadasDeArqueroCorrectasDePenalCon: arqueroEnCoordenadasCorrectas! !

!EsperaTiroYSeAdelanta methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:58:03'!
atajarRemateAColocarPlayeraModificandoFuerzaEn: modificadorFuerzaTiroAColocarConPlayera conDireccion: direccionTiro jugandoPenales: penales

	| arqueroConFuerzaSuficiente arqueroEnCoordenadasCorrectas |
	
	arqueroEnCoordenadasCorrectas  := self arqueroSiempreSeTiraBien.
	arqueroConFuerzaSuficiente := self aArqueroNuncaLeAlcanzaLaFuerza.
	
	penales modificadorFuerzaAtajadaResultante: modificadorFuerzaTiroAColocarConPlayera; resolverCoordenadasDeArqueroCorrectasDePenalCon: arqueroEnCoordenadasCorrectas; resolverFuerzaSuficienteDeArqueroEnPenalCon:  arqueroConFuerzaSuficiente! !

!EsperaTiroYSeAdelanta methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:58:06'!
atajarRemateAMatarJabulaniModificandoFuerzaEn: modificadorFuerzaTiroAMatarConJabulani conDireccion: direccionTiroDesviadoPorAMatar jugandoPenales: penales
	
	| arqueroConFuerzaSuficiente arqueroEnCoordenadasCorrectas |
	
	arqueroEnCoordenadasCorrectas  := self arqueroSiempreSeTiraBien.
	arqueroConFuerzaSuficiente := self aArqueroNuncaLeAlcanzaLaFuerza.
	
	penales modificadorFuerzaAtajadaResultante: modificadorFuerzaTiroAMatarConJabulani; direccionDeRemateResultanteEnPenal: direccionTiroDesviadoPorAMatar; resolverCoordenadasDeArqueroCorrectasDePenalCon: arqueroEnCoordenadasCorrectas; resolverFuerzaSuficienteDeArqueroEnPenalCon: arqueroConFuerzaSuficiente! !

!EsperaTiroYSeAdelanta methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:58:10'!
atajarRemateAMatarPlayeraEnDireccion: direccionTiroDesviadoPorAMatarOPorPlayeraAMatar jugandoPenales: penales


	| arqueroConFuerzaSuficiente arqueroEnCoordenadasCorrectas |
	
	arqueroEnCoordenadasCorrectas := self arqueroSiempreSeTiraBien.
	arqueroConFuerzaSuficiente := self aArqueroSiempreLeAlcanzaLaFuerza.
	
	penales direccionDeRemateResultanteEnPenal: direccionTiroDesviadoPorAMatarOPorPlayeraAMatar; resolverCoordenadasDeArqueroCorrectasDePenalCon: arqueroEnCoordenadasCorrectas; resolverFuerzaSuficienteDeArqueroEnPenalCon: arqueroConFuerzaSuficiente! !


!EsperaTiroYSeAdelanta methodsFor: 'cambio reglas' stamp: 'NR 9/26/2025 04:19:58'!
aArqueroNuncaLeAlcanzaLaFuerza

	^ [:modificadorDelantero :modificadorArquero| false]! !

!EsperaTiroYSeAdelanta methodsFor: 'cambio reglas' stamp: 'NR 9/26/2025 04:20:08'!
aArqueroSiempreLeAlcanzaLaFuerza

	^ [:modificadorDelantero :modificadorArquero | true]! !

!EsperaTiroYSeAdelanta methodsFor: 'cambio reglas' stamp: 'NR 9/24/2023 07:49:51'!
arqueroSiempreSeTiraBien

	^ [:coordTiro :coordAtaj | true]! !


!classDefinition: #Delantero category: #'Penales-Solu'!
Object subclass: #Delantero
	instanceVariableNames: 'estrategiaDeTiro fuerzaBase'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!Delantero methodsFor: 'fuerza resultante' stamp: 'NR 9/27/2025 19:58:35'!
fuerzaResultanteRemate: modificadorRemateNormalizado

	^ fuerzaBase * modificadorRemateNormalizado ! !


!Delantero methodsFor: 'initialization' stamp: 'NR 9/22/2023 06:52:57'!
initializeEstrategiaDeTiro: unaEstrategiaDeTiro withFuerza: fuerzaBaseDelDelantero 
	
	estrategiaDeTiro := unaEstrategiaDeTiro with: self.
	fuerzaBase := fuerzaBaseDelDelantero! !


!Delantero methodsFor: 'para penales' stamp: 'NR 9/21/2023 00:34:53'!
patea: pelota conDireccion: direccionTiro aArquero: arquero jugandoPenales: penales

	estrategiaDeTiro rematar: pelota conDireccion: direccionTiro aArquero: arquero jugandoPenales: penales.

	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #'Penales-Solu'!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'instance creation' stamp: 'NR 9/22/2023 06:53:13'!
decideTirarAColocarSuFuerzaBaseEs: fuerzaBaseDelDelantero
	
	^self new initializeEstrategiaDeTiro: AColocar withFuerza: fuerzaBaseDelDelantero! !

!Delantero class methodsFor: 'instance creation' stamp: 'NR 9/22/2023 06:53:18'!
decideTirarAMatarSuFuerzaBaseEs: fuerzaBaseDelDelantero
	
	^self new initializeEstrategiaDeTiro: AMatar withFuerza: fuerzaBaseDelDelantero! !


!classDefinition: #Pelota category: #'Penales-Solu'!
Object subclass: #Pelota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!Pelota methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:59:03'!
siendoPateadaAColocarModificandoFuerzaEn: modificadorFuerzaTiroAColocar conDireccion: direccionTiro aArquero: arquero jugandoPenales: penales

	self subclassResponsibility ! !

!Pelota methodsFor: 'para penales' stamp: 'NR 9/27/2025 20:08:52'!
siendoPateadaAMatarConDireccionOriginal: direccionOriginalTiro yendoEnDireccion: direccionTiroDesviadoPorAMatar aArquero: arquero jugandoPenales: penales

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pelota class' category: #'Penales-Solu'!
Pelota class
	instanceVariableNames: ''!

!Pelota class methodsFor: 'instance creation' stamp: 'NR 9/22/2023 06:54:20'!
jabulaniSudafricanaRapida
	
	^Jabulani new! !

!Pelota class methodsFor: 'instance creation' stamp: 'NR 9/22/2023 06:54:26'!
playeraLentaCostaAzul
	
	^Playera new! !


!classDefinition: #Jabulani category: #'Penales-Solu'!
Pelota subclass: #Jabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!Jabulani methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:59:23'!
siendoPateadaAColocarModificandoFuerzaEn: modificadorFuerzaTiroAColocar conDireccion: direccionTiro aArquero: arquero jugandoPenales: penales

	arquero recibirRemateAColocarJabulaniModificandoFuerzaEn: modificadorFuerzaTiroAColocar conDireccion: direccionTiro jugandoPenales: penales
! !

!Jabulani methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:59:32'!
siendoPateadaAMatarConDireccionOriginal: direccionOriginalTiro yendoEnDireccion: direccionTiroDesviadoPorAMatar aArquero: arquero jugandoPenales: penales

	arquero recibirRemateAMatarJabulaniModificandoFuerzaEn: 1.2 conDireccion: direccionTiroDesviadoPorAMatar jugandoPenales: penales
! !


!classDefinition: #Playera category: #'Penales-Solu'!
Pelota subclass: #Playera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!Playera methodsFor: 'para penales' stamp: 'NR 9/27/2025 19:59:46'!
siendoPateadaAColocarModificandoFuerzaEn: modificadorFuerzaTiroAColocar conDireccion: direccionTiro aArquero: arquero jugandoPenales: penales

	arquero recibirRemateAColocarPlayeraModificandoFuerzaEn: modificadorFuerzaTiroAColocar * 0.8 conDireccion: direccionTiro jugandoPenales: penales
! !

!Playera methodsFor: 'para penales' stamp: 'NR 9/27/2025 20:00:08'!
siendoPateadaAMatarConDireccionOriginal: direccionOriginalTiro yendoEnDireccion: direccionTiroDesviadoPorAMatar aArquero: arquero jugandoPenales: penales

	| direccionTiroDesviadoPorAMatarOPorPlayeraAMatar  |
	
	direccionTiroDesviadoPorAMatarOPorPlayeraAMatar := direccionTiroDesviadoPorAMatar.
	(penales tiroAlAngulo: direccionOriginalTiro) ifFalse: [direccionTiroDesviadoPorAMatarOPorPlayeraAMatar := self desviarDireccionDosHaciaArriba: direccionTiroDesviadoPorAMatar].
	
	arquero recibirRemateAMatarPlayeraEnDireccion: direccionTiroDesviadoPorAMatarOPorPlayeraAMatar jugandoPenales: penales! !


!Playera methodsFor: 'desvios' stamp: 'NR 9/22/2023 00:05:48'!
desviarDireccionDosHaciaArriba: direccionTiro

	^(direccionTiro x)@(direccionTiro y+2)! !


!classDefinition: #Penales category: #'Penales-Solu'!
Object subclass: #Penales
	instanceVariableNames: 'delantero arquero varDireccionRemate varFuerzaResultanteDeTiro varFuerzaResultanteDeAtajada varDireccionAtajada puntajeDeDelantero puntajeDeArquero arqueroConFuerzaSuficiente arqueroEnCoordenadasCorrectas modificadorFuerzaTiro modificadorFuerzaAtajada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!Penales methodsFor: 'VAR' stamp: 'NR 9/27/2025 20:06:09'!
determinarFuerzaTiroYAtajadaResultanteVAR

	varFuerzaResultanteDeTiro := delantero fuerzaResultanteRemate: modificadorFuerzaTiro.
	varFuerzaResultanteDeAtajada := arquero fuerzaResultanteDeAtajada: modificadorFuerzaAtajada! !

!Penales methodsFor: 'VAR' stamp: 'NR 9/21/2023 23:44:28'!
direccionDeRemateResultanteEnPenal: direccionRemateResultante
	
	varDireccionRemate := direccionRemateResultante
	! !

!Penales methodsFor: 'VAR' stamp: 'NR 9/27/2025 20:06:15'!
modificadorFuerzaAtajadaResultante: modificadorFuerzaAtajadaResultante
	
	modificadorFuerzaAtajada := modificadorFuerzaAtajadaResultante
	! !

!Penales methodsFor: 'VAR' stamp: 'NR 9/27/2025 20:06:19'!
modificadorFuerzaTiroResultante: modificadorFuerzaTiroResultante
	
	modificadorFuerzaTiro := modificadorFuerzaTiroResultante
	! !

!Penales methodsFor: 'VAR' stamp: 'NR 9/21/2023 23:44:03'!
varDireccionRemateResultante
	
	^varDireccionRemate
	! !

!Penales methodsFor: 'VAR' stamp: 'NR 9/24/2023 07:56:02'!
varFuerzaResultanteDeAtajada
	
	^varFuerzaResultanteDeAtajada
	! !

!Penales methodsFor: 'VAR' stamp: 'NR 9/24/2023 07:57:07'!
varFuerzaResultanteDeTiro
	
	^varFuerzaResultanteDeTiro
	! !


!Penales methodsFor: 'juego' stamp: 'NR 9/24/2024 15:38:40'!
arbitroDeterminaGanadorEnBaseAReglasYVAR

	^ (self remateVaAlArco) 
		ifFalse: [self puntoParaArquero] 
		ifTrue: [(self arqueroEligeCorrectamenteYTieneLaFuerzaParaDetenerElRemate) 
			ifTrue: [self atajoArquero] 
			ifFalse: [self golDelantero]]! !

!Penales methodsFor: 'juego' stamp: 'NR 9/27/2025 20:05:20'!
arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: direccionTiro arqueroSeLanzaEnDirección: direccionArquero 
	
	self assertValidasDireccionTiro: direccionTiro direccionArquero: direccionArquero.
	
	self registrarReglasPenalesEstandarConDireccionTiro: direccionTiro  arqueroTirandoseA: direccionArquero.
	
	delantero patea: pelota conDireccion: direccionTiro aArquero: arquero jugandoPenales: self.
	
	self determinarFuerzaTiroYAtajadaResultanteVAR.
	
	self arbitroDeterminaGanadorEnBaseAReglasYVAR
! !

!Penales methodsFor: 'juego' stamp: 'NR 9/21/2023 23:43:08'!
arqueroEligeCorrectamenteYTieneLaFuerzaParaDetenerElRemate

	^ self arqueroSeLanzaAPosicionDelTiro and: [self arqueroTieneFuerzaSuficienteParaDetenerRemate]! !

!Penales methodsFor: 'juego' stamp: 'NR 9/21/2023 23:43:12'!
arqueroSeLanzaAPosicionDelTiro

	^ arqueroEnCoordenadasCorrectas value: varDireccionRemate value: varDireccionAtajada! !

!Penales methodsFor: 'juego' stamp: 'NR 9/27/2025 20:05:56'!
arqueroTieneFuerzaSuficienteParaDetenerRemate

	^arqueroConFuerzaSuficiente value: modificadorFuerzaTiro value: modificadorFuerzaAtajada ! !

!Penales methodsFor: 'juego' stamp: 'NR 9/21/2023 23:43:51'!
remateVaAlArco

	^ self coordenadasDentroArco: varDireccionRemate! !


!Penales methodsFor: 'reglas' stamp: 'NR 9/21/2023 23:27:14'!
coordenadasAngulosDeArco

	^ {0@0. 0@2. 2@0. 2@2}! !

!Penales methodsFor: 'reglas' stamp: 'NR 9/24/2023 18:50:04'!
coordenadasDentroArco: direccion

	^direccion between: 0@0 and: 2@2! !

!Penales methodsFor: 'reglas' stamp: 'NR 9/27/2025 20:06:39'!
registrarReglasPenalesEstandarConDireccionTiro: direccionTiro arqueroTirandoseA: direccionArquero

	varDireccionRemate := direccionTiro.
	varDireccionAtajada := direccionArquero.
	modificadorFuerzaTiro := 1.
	modificadorFuerzaAtajada := 1.

	arqueroEnCoordenadasCorrectas := [:coordTiro :coordAtaj | coordTiro = coordAtaj].
	arqueroConFuerzaSuficiente := [:modificadorDelantero :modificadorArquero | arquero fuerzaSuficienteAtajandoA: delantero conModificadorTiro: modificadorDelantero conModificadorAtajada: modificadorArquero]! !

!Penales methodsFor: 'reglas' stamp: 'NR 9/21/2023 23:45:07'!
resolverCoordenadasDeArqueroCorrectasDePenalCon: arqueroCoordenadasCorrectas 
	
	arqueroEnCoordenadasCorrectas := arqueroCoordenadasCorrectas
	
	! !

!Penales methodsFor: 'reglas' stamp: 'NR 9/21/2023 23:45:12'!
resolverFuerzaSuficienteDeArqueroEnPenalCon: arqueroFuerzaSuficiente
	
	arqueroConFuerzaSuficiente  := arqueroFuerzaSuficiente

	
	! !

!Penales methodsFor: 'reglas' stamp: 'NR 9/21/2023 23:27:14'!
tiroAlAngulo: direccionTiro
	
	^self coordenadasAngulosDeArco includes: direccionTiro! !


!Penales methodsFor: 'initialization' stamp: 'NR 9/24/2023 07:54:34'!
initializeConDelantero: unDelantero yArquero: unArquero 
	
	delantero := unDelantero.
	arquero := unArquero.
	puntajeDeDelantero  := 0.
	puntajeDeArquero := 0
	
	! !


!Penales methodsFor: 'ganador' stamp: 'NR 9/21/2023 23:43:22'!
atajoArquero

	self puntoParaArquero
! !

!Penales methodsFor: 'ganador' stamp: 'NR 9/21/2023 23:43:27'!
golDelantero

	self puntoParaDelantero
! !

!Penales methodsFor: 'ganador' stamp: 'NR 9/24/2023 07:54:34'!
puntajeDeArquero
	
	^puntajeDeArquero
	! !

!Penales methodsFor: 'ganador' stamp: 'NR 9/24/2023 07:54:24'!
puntajeDeDelantero
	
	^puntajeDeDelantero
	! !

!Penales methodsFor: 'ganador' stamp: 'NR 9/24/2023 07:54:35'!
puntoParaArquero

	puntajeDeArquero := 1
! !

!Penales methodsFor: 'ganador' stamp: 'NR 9/24/2023 07:54:24'!
puntoParaDelantero

	puntajeDeDelantero := 1
! !


!Penales methodsFor: 'asserts' stamp: 'NR 9/19/2023 20:44:37'!
assertValidaDireccion: direccion error: mensajeError
	
	(self coordenadasDentroArco: direccion) ifFalse: [self error: mensajeError].	
	! !

!Penales methodsFor: 'asserts' stamp: 'NR 9/19/2023 08:11:10'!
assertValidasDireccionTiro: direccionTiro direccionArquero: direccionArquero

	self assertValidaDireccion: direccionTiro error: Penales direccionTiroFueraDeRango.
	self assertValidaDireccion:  direccionArquero error: Penales direccionArqueroFueraDeRango! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Penales class' category: #'Penales-Solu'!
Penales class
	instanceVariableNames: ''!

!Penales class methodsFor: 'instance creation' stamp: 'NR 5/2/2023 06:22:13'!
conDelantero: delantero yArquero: arquero 

	^self new initializeConDelantero: delantero yArquero: arquero ! !


!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:49'!
direccionArqueroFueraDeRango
	
	^'El arquero debe lanzarse a coordenadas válidas'! !

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:32'!
direccionTiroFueraDeRango
	
	^'La pelota debe dirigirse a coordenadas válidas'! !


!classDefinition: #RemateAArco category: #'Penales-Solu'!
Object subclass: #RemateAArco
	instanceVariableNames: 'delantero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!RemateAArco methodsFor: 'initialization' stamp: 'NR 9/21/2023 23:47:02'!
initializeWith: unDelantero

	delantero := unDelantero! !


!RemateAArco methodsFor: 'para penales' stamp: 'NR 9/21/2023 16:30:35'!
rematar: pelota conDireccion: direccionTiro aArquero: arquero jugandoPenales: penales

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RemateAArco class' category: #'Penales-Solu'!
RemateAArco class
	instanceVariableNames: ''!

!RemateAArco class methodsFor: 'instance creation' stamp: 'NR 9/20/2023 06:56:48'!
with: unDelantero
	
	^self new initializeWith: unDelantero! !


!classDefinition: #AColocar category: #'Penales-Solu'!
RemateAArco subclass: #AColocar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!AColocar methodsFor: 'para penales' stamp: 'NR 9/27/2025 20:00:28'!
rematar: pelota conDireccion: direccionTiro aArquero: arquero jugandoPenales: penales
	
	pelota siendoPateadaAColocarModificandoFuerzaEn: 0.5 conDireccion: direccionTiro aArquero: arquero jugandoPenales: penales

! !


!classDefinition: #AMatar category: #'Penales-Solu'!
RemateAArco subclass: #AMatar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales-Solu'!

!AMatar methodsFor: 'para penales' stamp: 'NR 9/27/2025 20:00:36'!
rematar: pelota conDireccion: direccionOriginalTiro aArquero: arquero jugandoPenales: penales
	
	| direccionTiroDesviadoPorAMatar |
	
	direccionTiroDesviadoPorAMatar := direccionOriginalTiro.
	(penales tiroAlAngulo: direccionOriginalTiro) ifTrue: [direccionTiroDesviadoPorAMatar:= self desviarDireccionAAlturaMedia: direccionOriginalTiro].
	
	pelota siendoPateadaAMatarConDireccionOriginal: direccionOriginalTiro yendoEnDireccion: direccionTiroDesviadoPorAMatar aArquero: arquero jugandoPenales: penales
! !


!AMatar methodsFor: 'desvios' stamp: 'NR 9/21/2023 23:58:24'!
desviarDireccionAAlturaMedia: direccionOriginalTiro

	^ (direccionOriginalTiro x)@1! !
