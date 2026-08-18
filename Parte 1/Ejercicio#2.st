!classDefinition: #Bill category: #'Ejercicio 2'!
DenotativeObject subclass: #Bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: #'Ejercicio 2'!
Bill class
	instanceVariableNames: 'energia'!

!Bill class methodsFor: 'acciones' stamp: 'ARM 3/21/2025 18:08:27'!
caminar: unaCantidadDeKilometros

	energia := energia - unaCantidadDeKilometros - 3! !

!Bill class methodsFor: 'acciones' stamp: 'ARM 3/21/2025 10:30:48'!
comer: unaCantidadDeKilosDeCerebro

	energia := unaCantidadDeKilosDeCerebro * 4 + energia! !


!Bill class methodsFor: 'acciones' stamp: 'ARM 3/21/2025 18:08:27'!
caminar: unaCantidadDeKilometros

	energia := energia - unaCantidadDeKilometros - 3! !

!Bill class methodsFor: 'acciones' stamp: 'ARM 3/21/2025 10:30:48'!
comer: unaCantidadDeKilosDeCerebro

	energia := unaCantidadDeKilosDeCerebro * 4 + energia! !

!Bill class methodsFor: '-- all --' stamp: 'ARM 8/19/2025 20:41:34'!
initialize

	energia := 28! !

!Bill class methodsFor: '--** private fileout/in **--' stamp: 'ARM 8/11/2026 15:51:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := 28.! !


!Bill class methodsFor: '--** private fileout/in **--' stamp: 'ARM 8/11/2026 15:51:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := 28.! !

Bill initialize!
Bill initializeAfterFileIn!