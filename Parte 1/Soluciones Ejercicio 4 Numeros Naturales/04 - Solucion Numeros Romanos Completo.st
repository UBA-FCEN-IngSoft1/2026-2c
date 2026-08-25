!classDefinition: #I category: 'Numeros Romanos Examplars'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos Examplars'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros Romanos Examplars'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 3/19/2018 16:02:13'!
* unNumeroDePeano

	^unNumeroDePeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 3/19/2018 15:44:52'!
+ unNumeroDePeano

	^unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 12:44:40'!
- unNumeroDePeano

	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 6/27/2020 19:13:48'!
/ dividendo

	dividendo dividendoConUnoComoDivisor! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 3/19/2018 16:38:01'!
<= aNumber 
	^true! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:09:41'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 12:44:24'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^'En el dominio de los naturales, no se puede restar un numero - otro numero mayor o igual'! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 6/27/2020 19:13:48'!
dividendoConUnoComoDivisor
	
	^self! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 12/5/2020 23:43:03'!
divisionSiendoLaDiferenciaMasUnoEntre: dividendo y: divisor

	^I! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 6/27/2020 13:48:25'!
multiplicarPorNumeroMayorAUno: unNumeroMayorAUno 

	^unNumeroMayorAUno! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 3/19/2018 15:37:31'!
next
	^ II.! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 3/19/2018 15:30:11'!
previous

	self error: 'El uno es el primer numero natural'! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 6/27/2020 13:51:07'!
sustraerDe: minuendo 
	
	^minuendo previous! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 12/5/2020 23:19:58'!
vecesDivideA: dividend 
	^dividend! !


!classDefinition: #II category: 'Numeros Romanos Examplars'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos Examplars'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros Romanos Examplars'!
II class
	instanceVariableNames: 'previous next'!

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 6/27/2020 13:46:43'!
* unNumeroDePeano

	^unNumeroDePeano multiplicarPorNumeroMayorAUno: self! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/19/2018 15:48:19'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 6/27/2020 13:51:52'!
- sustraendo

	^sustraendo sustraerDe: self! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 12/5/2020 23:18:35'!
/ divisor

	divisor <= self ifFalse:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].

	^divisor vecesDivideA: self! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/19/2018 16:41:39'!
<= aNumber 
	aNumber = I ifTrue: [^false].
	^self previous <= aNumber previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/20/2018 11:02:43'!
clearNext

	next clearNext.
	next collapse.
	next := nil.
! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:08:06'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor


	^'No se puede dividir por un numero mayor'! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 6/27/2020 19:13:48'!
dividendoConUnoComoDivisor

		self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 6/27/2020 13:35:43'!
dividirPorUno: anI 
	self shouldBeImplemented.! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 12/5/2020 23:42:48'!
divisionSiendoLaDiferenciaMasUnoEntre: dividendo y: divisor

	^(dividendo - divisor) / divisor + I! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/27/2023 09:55:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := I.
	next := III.! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 4/6/2021 15:04:30'!
multiplicarPorNumeroMayorAUno: unNumeroMayorAUno 


		^unNumeroMayorAUno + (unNumeroMayorAUno * self previous)! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 4/6/2021 15:28:17'!
nameOfNext
	(self name endsWith: 'CMXCIX') ifTrue:[^(self name withoutSuffix: 'CMXCIX'), 'M'].
	(self name endsWith: 'DCCCXCIX') ifTrue:[^(self name withoutSuffix: 'DCCCXCIX'), 'CM'].
	(self name endsWith: 'CDXCIX') ifTrue:[^(self name withoutSuffix: 'CDXCIX'), 'D'].
	(self name endsWith: 'CCCXCIX') ifTrue:[^(self name withoutSuffix: 'CCCXCIX'), 'CD'].
	(self name endsWith: 'XCIX') ifTrue:[^(self name withoutSuffix: 'XCIX'), 'C'].
	(self name endsWith: 'LXXXIX') ifTrue:[^(self name withoutSuffix: 'LXXXIX'), 'XC'].
	(self name endsWith: 'XLIX') ifTrue:[^(self name withoutSuffix: 'XLIX'), 'L'].
	(self name endsWith: 'XXXIX') ifTrue:[^(self name withoutSuffix: 'XXXIX'), 'XL'].
	(self name endsWith: 'IX') ifTrue:[^(self name withoutSuffix: 'IX'), 'X'].
	(self name endsWith: 'VIII') ifTrue:[^(self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'III') ifTrue:[^(self name withoutSuffix: 'III'), 'IV'].
	(self name endsWith: 'IV') ifTrue:[^(self name withoutSuffix: 'IV'), 'V'].
	^self name, 'I'! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 4/6/2021 14:43:50'!
next

	next ifNotNil: [^next].
	next := II createChildNamed: self nameOfNext.
	next previous: self.
	
	^next
! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/19/2018 15:38:06'!
previous

	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/19/2018 16:21:49'!
previous: aNumber 
	
	previous := aNumber! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/20/2018 11:29:48'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]
! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 12/4/2020 12:09:12'!
sustraerDe: sustaendo
 
	^sustaendo previous - self previous	! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 12/5/2020 23:42:12'!
vecesDivideA: dividend

	^(dividend + I - self) divisionSiendoLaDiferenciaMasUnoEntre: dividend y: self! !

II initializeAfterFileIn!