!classDefinition: #I category: 'PeanoConDelegandoAPalitoPalito'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoConDelegandoAPalitoPalito'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'PeanoConDelegandoAPalitoPalito'!
I class
	instanceVariableNames: ''!

!I class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:27:54'!
* aNaturalNumber
	^aNaturalNumber.! !

!I class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:12:02'!
+ aNaturalNumber
	^aNaturalNumber next.! !

!I class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:17:38'!
- aNaturalNumber
	self error: 'No hay'.! !

!I class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:04:12'!
next
	^II.! !

!I class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:07:52'!
previous
	self error: 'No hay'.! !


!classDefinition: #II category: 'PeanoConDelegandoAPalitoPalito'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoConDelegandoAPalitoPalito'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'PeanoConDelegandoAPalitoPalito'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'JFGO 3/27/2025 16:05:03'!
next
	
	next ifNil: [
		next := self cloneNamed: self name, 'I'. 
		next previous: self.		
		].
	
	^next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'JFGO 3/27/2025 16:06:08'!
previous: aNaturalNumber
	previous:=aNaturalNumber.! !


!II class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 17:07:13'!
* aNaturalNumber
	^aNaturalNumber + (self previous * aNaturalNumber).
	! !

!II class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 17:03:55'!
+ aNaturalNumber
	
			^self previous + aNaturalNumber next.
	! !

!II class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 17:06:15'!
- aNaturalNumber
	
	aNaturalNumber name ='I' ifTrue:[ 
		^self previous.
	] ifFalse: [
	       ^self previous - aNaturalNumber previous.
	]
	! !

!II class methodsFor: '--** private fileout/in **--' stamp: 'JFGO 3/27/2025 17:09:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'JFGO 3/27/2025 16:05:03'!
next
	
	next ifNil: [
		next := self cloneNamed: self name, 'I'. 
		next previous: self.		
		].
	
	^next.! !

!II class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:07:31'!
previous
	^previous.! !

!II class methodsFor: 'as yet unclassified' stamp: 'JFGO 3/27/2025 16:06:08'!
previous: aNaturalNumber
	previous:=aNaturalNumber.! !

!II class methodsFor: '-- all --' stamp: 'JFGO 3/27/2025 16:06:27'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'JFGO 3/27/2025 17:09:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := I.! !

II initializeAfterFileIn!