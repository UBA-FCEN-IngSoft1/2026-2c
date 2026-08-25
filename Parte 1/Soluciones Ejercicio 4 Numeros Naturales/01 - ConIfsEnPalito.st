!classDefinition: #I category: 'PeanoConIfsEnPalito'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoConIfsEnPalito'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'PeanoConIfsEnPalito'!
I class
	instanceVariableNames: 'next previous'!

!I class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:51:47'!
* aNaturalNumber
	self name = 'I' ifTrue:[
			^aNaturalNumber .
		] ifFalse:[
			^aNaturalNumber + (self previous * aNaturalNumber).
	]! !

!I class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:52:50'!
+ aNaturalNumber
	self name = 'I' ifTrue:[
			^aNaturalNumber next.
		] ifFalse:[
			^self previous + aNaturalNumber next.
	]! !

!I class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:52:14'!
- aNaturalNumber
	"self name = 'I' ifTrue:[
			^self error: 'No hay'.
		] ifFalse:[
			^self previous - aNaturalNumber previous.
	]" "Esto no funciona con restas negativas... que bien. Pero no funciona con las que tiene que funcionar porque falta el caso de exito... que mal."

	self name = 'I' ifTrue:[
			^self error: 'No hay'.
		] ifFalse:[
			aNaturalNumber name ='I' ifTrue:[ 
				^self previous.
			] ifFalse: [
			       ^self previous - aNaturalNumber previous.
			]
	]! !

!I class methodsFor: '--** private fileout/in **--' stamp: 'JFGO 3/27/2025 16:54:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := nil.! !

!I class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:49:16'!
next
	
	
	
	
	next ifNil: [
		next := self cloneNamed: self name, 'I'. 
		next previous: self.		
		].
	
	^next.! !

!I class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:50:52'!
previous
	self name = 'I' ifTrue: [
		self error: 'No hay'.
	] ifFalse:[
		^previous.
	]! !

!I class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:49:52'!
previous: aNaturalNumber
	previous:=aNaturalNumber.! !

!I class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:51:33'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!I class methodsFor: '--** private fileout/in **--' stamp: 'JFGO 3/27/2025 16:54:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := nil.! !

I initializeAfterFileIn!