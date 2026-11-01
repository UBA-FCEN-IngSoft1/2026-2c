!classDefinition: #MarsRoverObserversTest category: 'MarsRover-ActiveVariable'!
TestCase subclass: #MarsRoverObserversTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ActiveVariable'!

!MarsRoverObserversTest methodsFor: 'tests' stamp: 'HAW 6/3/2022 08:55:40'!
test01DoesNotLogWhenNoCommandIsExecuted

	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followPositionChangesOn: marsRover.
	
	marsRover process: ''.
	
	self assert: logger readStream atEnd.
! !

!MarsRoverObserversTest methodsFor: 'tests' stamp: 'HAW 6/3/2022 08:55:58'!
test02LogsPositionWhenMovingNorth

	| marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followPositionChangesOn: marsRover.
	
	marsRover process: 'f'.
	
	logStream := logger readStream.
	self assert: '1@2' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverObserversTest methodsFor: 'tests' stamp: 'HAW 6/3/2022 08:56:09'!
test03LogsPositionWhenMovingSouth

	| marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followPositionChangesOn: marsRover.
	
	marsRover process: 'b'.
	
	logStream := logger readStream.
	self assert: '1@0' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverObserversTest methodsFor: 'tests' stamp: 'HAW 6/3/2022 08:56:26'!
test04LogsPositionWhenMovingEastAndWest

	| marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingEast.
	logger := MarsRoverLogger followPositionChangesOn: marsRover.
	
	marsRover process: 'fb'.
	
	logStream := logger readStream.
	self assert: '2@1' equals: logStream nextLine.
	self assert: '1@1' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverObserversTest methodsFor: 'tests' stamp: 'HAW 6/3/2022 08:56:38'!
test05LogsHeadingWhenPointingEast

	| marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followHeadingChangesOn: marsRover.
	
	marsRover process: 'r'.
	
	logStream := logger readStream.
	self assert: 'East' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverObserversTest methodsFor: 'tests' stamp: 'HAW 6/3/2022 08:56:59'!
test06LogsHeadingWhenPoitingSouthWestAndNorth

	| marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingEast.
	logger := MarsRoverLogger followHeadingChangesOn: marsRover.
	
	marsRover process: 'rrr'.
	
	logStream := logger readStream.
	self assert: 'South' equals: logStream nextLine.
	self assert: 'West' equals: logStream nextLine.
	self assert: 'North' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverObserversTest methodsFor: 'tests' stamp: 'HAW 6/3/2022 08:57:42'!
test07UpdatesStatusViewWhenChangingPositionAndHeading

	| marsRover window |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingEast.
	window := MarsRoverStatusWindow followPositionAndHeadingChangesOn: marsRover.
	
	"Recuerden que en este test hice varios en uno por una cuestion de tiempo nomás - Hernan"

	marsRover process: 'fr'.
	self assert: '2@1' equals: window positionTextFieldModel.
	self assert: 'Apuntando al Sur' equals: window headingTextFieldModel.

	marsRover process: 'fr'.
	self assert: '2@0' equals: window positionTextFieldModel.
	self assert: 'Apuntando al Oeste' equals: window headingTextFieldModel.

	marsRover process: 'fr'.
	self assert: '1@0' equals: window positionTextFieldModel.
	self assert: 'Apuntando al Norte' equals: window headingTextFieldModel.
	
	marsRover process: 'fr'.
	self assert: '1@1' equals: window positionTextFieldModel.
	self assert: 'Apuntando al Este' equals: window headingTextFieldModel.

	! !


!classDefinition: #MarsRoverTest category: 'MarsRover-ActiveVariable'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ActiveVariable'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #MarsRover category: 'MarsRover-ActiveVariable'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ActiveVariable'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'HAW 6/2/2022 18:05:13'!
initializeAt: aPosition heading: aHeadingType

	position := ActiveVariable with: aPosition.
	head := ActiveVariable with: (aHeadingType for: self).
	
	! !


!MarsRover methodsFor: 'heading' stamp: 'HAW 6/2/2022 18:22:50'!
head: aHeadingClass
"hola"
	head value: (aHeadingClass for: self).
	  ! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 6/2/2022 17:19:59'!
headEast
	
	self head: MarsRoverHeadingEast! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 6/2/2022 17:20:10'!
headNorth
	
	self head: MarsRoverHeadingNorth! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 6/2/2022 17:20:18'!
headSouth
	
	self head: MarsRoverHeadingSouth ! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 6/2/2022 17:20:26'!
headWest
	
	self head: MarsRoverHeadingWest! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	head rotateLeft! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	head rotateRight! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:16:32'!
isAt: aPosition heading: aHeadingType

	^position = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'HAW 6/2/2022 18:05:55'!
addToPositionAndLogNewPosition: newPosition

	position value: position + newPosition.
	! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	head moveBackward! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 5/30/2022 20:38:44'!
moveEast
	
	self addToPositionAndLogNewPosition: 1@0.
	! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	head moveForward! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 5/30/2022 20:38:44'!
moveNorth
	
	self addToPositionAndLogNewPosition: 0@1.
	! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 5/30/2022 20:38:44'!
moveSouth
	
	self addToPositionAndLogNewPosition: 0@-1.
	! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 5/30/2022 20:38:44'!
moveWest
	
	self addToPositionAndLogNewPosition: -1@0! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'observers' stamp: 'HAW 6/2/2022 18:07:33'!
addHeadingObserver: anObserver

	head addObserver: anObserver ! !

!MarsRover methodsFor: 'observers' stamp: 'HAW 6/2/2022 18:07:52'!
addPositionObserver: anObserver

	position addObserver: anObserver ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-ActiveVariable'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverHeading category: 'MarsRover-ActiveVariable'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ActiveVariable'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !


!MarsRoverHeading methodsFor: 'visiting' stamp: 'HAW 6/3/2022 08:54:06'!
accept: aVisitor

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRover-ActiveVariable'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover-ActiveVariable'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ActiveVariable'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!MarsRoverHeadingEast methodsFor: 'visiting' stamp: 'HAW 5/30/2022 20:46:21'!
accept: aVisitor

	^aVisitor visitMarsRoverHeadingEast: self! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover-ActiveVariable'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ActiveVariable'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!MarsRoverHeadingNorth methodsFor: 'visiting' stamp: 'HAW 6/2/2022 17:16:38'!
accept: aVisitor 
	
	^aVisitor visitMarsRoverHeadingNorth: self! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover-ActiveVariable'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ActiveVariable'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!MarsRoverHeadingSouth methodsFor: 'visiting' stamp: 'HAW 6/2/2022 17:14:53'!
accept: aVisitor

	^aVisitor visitMarsRoverHeadingSouth: self! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover-ActiveVariable'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ActiveVariable'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!MarsRoverHeadingWest methodsFor: 'visiting' stamp: 'HAW 6/2/2022 17:15:37'!
accept: aVisitor

	^aVisitor visitMarsRoverHeadingWest: self! !


!classDefinition: #MarsRoverLogger category: 'MarsRover-ActiveVariable'!
Object subclass: #MarsRoverLogger
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ActiveVariable'!

!MarsRoverLogger methodsFor: 'visiting heading' stamp: 'HAW 5/30/2022 20:46:36'!
visitMarsRoverHeadingEast: aMarsRoverHeadingEast 
	
	log nextPutAll: 'East'; newLine! !

!MarsRoverLogger methodsFor: 'visiting heading' stamp: 'HAW 6/2/2022 17:16:55'!
visitMarsRoverHeadingNorth: aMarsRoverHeadingNorth 
	
	log nextPutAll: 'North'; newLine! !

!MarsRoverLogger methodsFor: 'visiting heading' stamp: 'HAW 6/2/2022 17:15:11'!
visitMarsRoverHeadingSouth: aMarsRoverHeadingSouth 
	
	log nextPutAll: 'South'; newLine! !

!MarsRoverLogger methodsFor: 'visiting heading' stamp: 'HAW 6/2/2022 17:16:03'!
visitMarsRoverHeadingWest: aMarsRoverHeadingWest 
	
	log nextPutAll: 'West'; newLine! !


!MarsRoverLogger methodsFor: 'initialization' stamp: 'HAW 5/30/2022 20:25:00'!
initialize

	log  := WriteStream on: ''! !


!MarsRoverLogger methodsFor: 'following' stamp: 'HAW 6/2/2022 17:53:48'!
followHeadingChangesOn: aMarsRover 
	
	aMarsRover addHeadingObserver: [ :head | self headingChangedTo: head ]! !

!MarsRoverLogger methodsFor: 'following' stamp: 'HAW 6/2/2022 17:49:40'!
followPositionChangesOn: aMarsRover 
	
	aMarsRover addPositionObserver: [ :aPosition | self positionChangedTo: aPosition ]! !


!MarsRoverLogger methodsFor: 'log' stamp: 'HAW 5/30/2022 20:23:26'!
readStream
	
	^ReadStream on: log contents ! !


!MarsRoverLogger methodsFor: 'changes' stamp: 'HAW 5/30/2022 20:46:00'!
headingChangedTo: aMarsRoverHeading
	
	aMarsRoverHeading accept: self! !

!MarsRoverLogger methodsFor: 'changes' stamp: 'HAW 5/30/2022 20:22:16'!
positionChangedTo: aPosition

	log print: aPosition; newLine! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverLogger class' category: 'MarsRover-ActiveVariable'!
MarsRoverLogger class
	instanceVariableNames: ''!

!MarsRoverLogger class methodsFor: 'instance creation' stamp: 'HAW 5/30/2022 20:42:45'!
followHeadingChangesOn: aMarsRover 
	
	^self new followHeadingChangesOn: aMarsRover ! !

!MarsRoverLogger class methodsFor: 'instance creation' stamp: 'HAW 6/2/2022 17:18:53'!
followPositionAndHeadingChangesOn: aMarsRover 
	
	^self new
		followHeadingChangesOn: aMarsRover;
		followPositionChangesOn: aMarsRover ! !

!MarsRoverLogger class methodsFor: 'instance creation' stamp: 'HAW 5/30/2022 20:16:11'!
followPositionChangesOn: aMarsRover 
	
	^self new followPositionChangesOn: aMarsRover ! !


!classDefinition: #MarsRoverStatusWindow category: 'MarsRover-ActiveVariable'!
Object subclass: #MarsRoverStatusWindow
	instanceVariableNames: 'positionTextFieldModel headingTextFieldModel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ActiveVariable'!

!MarsRoverStatusWindow methodsFor: 'visiting heading' stamp: 'HAW 6/2/2022 17:41:08'!
visitMarsRoverHeadingEast: aMarsRoverHeadingEast 
	
	headingTextFieldModel := 'Apuntando al Este'.! !

!MarsRoverStatusWindow methodsFor: 'visiting heading' stamp: 'HAW 6/2/2022 17:40:44'!
visitMarsRoverHeadingNorth: aMarsRoverHeadingNorth 
	
	headingTextFieldModel := 'Apuntando al Norte'.! !

!MarsRoverStatusWindow methodsFor: 'visiting heading' stamp: 'HAW 6/2/2022 17:39:06'!
visitMarsRoverHeadingSouth: aMarsRoverHeadingSouth 
	
	headingTextFieldModel := 'Apuntando al Sur'! !

!MarsRoverStatusWindow methodsFor: 'visiting heading' stamp: 'HAW 6/2/2022 17:39:53'!
visitMarsRoverHeadingWest: aMarsRoverHeadingWest 
	
	headingTextFieldModel := 'Apuntando al Oeste'.! !


!MarsRoverStatusWindow methodsFor: 'following' stamp: 'HAW 6/2/2022 17:54:04'!
followHeadingChangesOn: aMarsRover 
	
	aMarsRover addHeadingObserver: [ :head | self newHeading: head ]! !

!MarsRoverStatusWindow methodsFor: 'following' stamp: 'HAW 6/2/2022 17:50:06'!
followPositionChangesOn: aMarsRover 
	
	aMarsRover addPositionObserver: [ :aPosition | self newPosition: aPosition ]! !


!MarsRoverStatusWindow methodsFor: 'text fields' stamp: 'HAW 6/2/2022 17:37:48'!
headingTextFieldModel
	
	^headingTextFieldModel! !

!MarsRoverStatusWindow methodsFor: 'text fields' stamp: 'HAW 6/2/2022 17:33:19'!
positionTextFieldModel
	
	^positionTextFieldModel! !


!MarsRoverStatusWindow methodsFor: 'changes' stamp: 'HAW 6/2/2022 17:37:17'!
newHeading: aMarsRoverHeading

	aMarsRoverHeading accept: self
	
	! !

!MarsRoverStatusWindow methodsFor: 'changes' stamp: 'HAW 6/2/2022 17:34:29'!
newPosition: aPosition

	positionTextFieldModel := aPosition printString ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverStatusWindow class' category: 'MarsRover-ActiveVariable'!
MarsRoverStatusWindow class
	instanceVariableNames: ''!

!MarsRoverStatusWindow class methodsFor: 'instance creation' stamp: 'HAW 6/2/2022 17:28:46'!
followPositionAndHeadingChangesOn: aMarsRover 
	
	^self new
		followHeadingChangesOn: aMarsRover;
		followPositionChangesOn: aMarsRover ! !


!classDefinition: #ActiveVariable category: 'MarsRover-ActiveVariable'!
ProtoObject subclass: #ActiveVariable
	instanceVariableNames: 'value observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ActiveVariable'!

!ActiveVariable methodsFor: 'proxy protocol' stamp: 'HAW 6/2/2022 18:04:11'!
doesNotUnderstand: aMessage

	^aMessage sendTo: value! !

!ActiveVariable methodsFor: 'proxy protocol' stamp: 'HAW 6/3/2022 08:52:35'!
inspectorClass
	"Answer the class of the inspector to be used on the receiver.  Called by inspect; 
	use basicInspect to get a normal (less useful) type of inspector."

	^ Inspector! !

!ActiveVariable methodsFor: 'proxy protocol' stamp: 'HAW 6/3/2022 08:52:47'!
instVarAt: index put: anObject
	"Primitive. Store a value into a fixed variable in an object. The numbering of the
	 variables corresponds to the named instance variables, followed by the indexed
	 instance variables. Fail if the index is not an Integer or is not the index of a fixed
	 variable. Essential. See Object documentation whatIsAPrimitive."

	<primitive: 174 error: ec>
	self primitiveFailed! !


!ActiveVariable methodsFor: 'observer' stamp: 'HAW 6/2/2022 18:03:34'!
addObserver: anObserver

	observers add: anObserver ! !


!ActiveVariable methodsFor: 'initialization' stamp: 'HAW 6/2/2022 18:48:55'!
initializeWith: aValue

	value := aValue.
	observers := WeakIdentitySet new! !


!ActiveVariable methodsFor: 'value' stamp: 'HAW 6/2/2022 18:02:08'!
value

	^value! !

!ActiveVariable methodsFor: 'value' stamp: 'HAW 6/2/2022 18:02:34'!
value: newValue

	value := newValue.
	observers do: [:anObserver | anObserver value: value ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ActiveVariable class' category: 'MarsRover-ActiveVariable'!
ActiveVariable class
	instanceVariableNames: ''!

!ActiveVariable class methodsFor: 'as yet unclassified' stamp: 'HAW 6/2/2022 18:06:42'!
with: aValue

	^self new initializeWith: aValue! !
