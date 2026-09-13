!classDefinition: #OOStackTest category: 'Stack-Solution-3'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-3'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:50'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:46:57'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/16/2012 16:53'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/16/2012 16:53'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Solution-3'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-3'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/22/2019 14:58:36'!
test01PrefixCanNotBeEmpty

	"
	Categorías para particionar utilizados:
	
	longitud de prefijo a buscar
		- 0 (ERROR) ''
		- >=1
		
	prefijo a buscar contiene blancos
		- si (ERROR)
		- no
	
	tamaño de stack (sin test08)
		- vacía (ÚNICO)
		- >= 1 oración           
		
		ó (con test08)
		
		- vacía (ÚNICO)
		= 1 oración
		> 1 oración (ÚNICO)
				
	contenido stack / prefijo
	
		prefijo a buscar incluido en oraciones de stack
			- sí, mismo case
			- sí, pero con distinto case
			- no				
	"

	self
		should: [ SentenceFinderByPrefix with: '' on: self emptyStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: SentenceFinderByPrefix emptyPrefixErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 16:04:33'!
test02PrefixCanNotBeSpaces

	self 
		should: [ SentenceFinderByPrefix with: ' ' on: self oneSentenceStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: SentenceFinderByPrefix spaceInPrefixErrorDescription ]

	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 16:04:50'!
test03PrefixCanNotIncludeSpaces

	self 
		should: [ SentenceFinderByPrefix with: 'Wint ' on: self oneSentenceStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: SentenceFinderByPrefix spaceInPrefixErrorDescription ]

	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 22:59:06'!
test04NoSentenceIsFoundOnAnEmptyStack
	
	| finder foundSentences emptyStack|

	emptyStack := self emptyStack.
	
	finder := SentenceFinderByPrefix with: 'Wint' on: emptyStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: emptyStack isEmpty
		 
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 21:18:31'!
test05FindsSentencesThatStartWithPrefix

	| oneSentenceStack foundSentences finder |

	oneSentenceStack := self oneSentenceStack.

	finder := SentenceFinderByPrefix with: 'Wint' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: 1 equals: foundSentences size.
	self assert: foundSentences first equals: oneSentenceStack top.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self oneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 21:18:31'!
test06DoesNotFindSentencesThatDoNotBeginWithPrefix

	| oneSentenceStack foundSentences finder |

	oneSentenceStack := self oneSentenceStack.

	finder := SentenceFinderByPrefix with: 'winning' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self oneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 21:18:31'!
test07FindIsCaseSensitive

	| oneSentenceStack foundSentences finder |

	oneSentenceStack := self oneSentenceStack.

	finder := SentenceFinderByPrefix with: 'wint' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self oneSentenceStack.

	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/22/2019 14:56:11'!
test08FindsAllSentencesFromStackWithMoreThanOneSentence

	| moreThanOneSentenceStack foundSentences finder sentencesToFind |

	sentencesToFind := OrderedCollection with: 'Winter is here' with: 'Winter' with: 'Wint ' with: 'Wint'.
	
	moreThanOneSentenceStack := self createStackWithAll: sentencesToFind surroundedBy: 'Win' and: 'Hodor!!'.
	
	finder := SentenceFinderByPrefix with: 'Wint' on: moreThanOneSentenceStack.
	foundSentences := finder find.
	
	self assert: foundSentences equals: sentencesToFind.
	self assert: moreThanOneSentenceStack hasSameElementsAndOrderThan: (self createStackWithAll: sentencesToFind surroundedBy: 'Win' and: 'Hodor!!')
	
	
		 
		
	! !


!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'NR 4/20/2019 20:58:22'!
assert: aStack hasSameElementsAndOrderThan: anotherStack
	
	self assert: aStack hasSameSizeThan: anotherStack.
	
	self assert: aStack includedOnSameOrderAs: anotherStack.! !

!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'NR 4/21/2019 21:09:35'!
assert: aStack hasSameSizeThan: anotherStack
	
	self assert: aStack size equals: anotherStack size.! !

!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'NR 4/21/2019 21:09:43'!
assert: aStack includedOnSameOrderAs: anotherStack
	
	aStack size timesRepeat: [ self assert: aStack pop equals: anotherStack pop ].! !


!SentenceFinderByPrefixTest methodsFor: 'test data - stacks' stamp: 'NR 4/21/2019 16:32:30'!
createStackWithAll: sentencesToFind surroundedBy: firstElement and: lastElement

	| moreThanOneSentenceStack |
	
	moreThanOneSentenceStack := OOStack new.
	moreThanOneSentenceStack push: firstElement.
	sentencesToFind reverseDo: [ :aSentence | moreThanOneSentenceStack push: aSentence ].
	moreThanOneSentenceStack push: lastElement.
	
	^moreThanOneSentenceStack
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'test data - stacks' stamp: 'NR 4/21/2019 21:16:53'!
emptyStack
	
	^ OOStack new.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test data - stacks' stamp: 'NR 4/21/2019 21:18:31'!
oneSentenceStack

	^ OOStack new push: 'Winter is coming'.
	! !


!classDefinition: #OOStack category: 'Stack-Solution-3'!
Object subclass: #OOStack
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-3'!

!OOStack methodsFor: 'initialization' stamp: 'HAW 4/14/2017 22:43:18'!
initialize

	contents _ OrderedCollection with: [ self signalStackEmpty]! !


!OOStack methodsFor: 'testing' stamp: 'HAW 4/14/2017 22:46:30'!
isEmpty

	^ self size = 0! !


!OOStack methodsFor: 'operations' stamp: 'HAW 4/14/2017 22:43:56'!
pop

	| top |
	
	top := self top.
	contents removeLast.
	
	^ top ! !

!OOStack methodsFor: 'operations' stamp: 'HAW 4/14/2017 22:44:16'!
push: anObject

	contents add: anObject ! !

!OOStack methodsFor: 'operations' stamp: 'HAW 4/14/2017 22:44:27'!
top

	^ contents last value! !


!OOStack methodsFor: 'size' stamp: 'HAW 4/14/2017 22:46:22'!
size

	^ contents size - 1! !


!OOStack methodsFor: 'private' stamp: 'HAW 4/14/2017 22:47:24'!
signalStackEmpty
	
	self error: self class stackEmptyErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Solution-3'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Solution-3'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'prefix stack auxiliaryReversedStack foundSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-3'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'NR 9/19/2022 05:35:47'!
initializeWith: aPrefix on: aStack
	
	prefix := aPrefix.
	stack := aStack.
	
	auxiliaryReversedStack := OOStack new.
	! !


!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'NR 4/15/2019 10:14:00'!
addToFoundSentencesIfPrefix: aSentence 

	(aSentence beginsWith: prefix) ifTrue: [ foundSentences add: aSentence ].
! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'NR 4/29/2022 20:52:12'!
findAllSentencesByPrefixFromStack
		
	stack size timesRepeat: [ self findSentenceByPrefixOnTopOfStack ]
	! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'NR 4/23/2019 07:28:28'!
findSentenceByPrefixOnTopOfStack

	| aSentence | 

	aSentence := stack pop.
	self addToFoundSentencesIfPrefix: aSentence.
	auxiliaryReversedStack push: aSentence.
! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'NR 4/14/2019 22:37:38'!
pushBackOriginalElement
	
	stack push: auxiliaryReversedStack pop
	
	! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'NR 4/29/2022 20:52:35'!
rebuildOriginalStack
		
	auxiliaryReversedStack size timesRepeat: [ self pushBackOriginalElement ]	! !


!SentenceFinderByPrefix methodsFor: 'finding' stamp: 'NR 9/20/2022 16:20:40'!
find
	
	foundSentences := OrderedCollection new.
			
	self findAllSentencesByPrefixFromStack.
	
	self rebuildOriginalStack.
	
	^foundSentences
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Solution-3'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'NR 4/20/2019 16:33:02'!
with: aPrefix on: aStack

	self assertNotEmpty: aPrefix.
	self assertHasNoSpaces: aPrefix.
	
	^self new initializeWith: aPrefix on: aStack. ! !


!SentenceFinderByPrefix class methodsFor: 'error handling' stamp: 'NR 4/20/2019 16:43:38'!
emptyPrefixErrorDescription

	^ 'Prefijo vacio'! !

!SentenceFinderByPrefix class methodsFor: 'error handling' stamp: 'NR 4/20/2019 16:43:33'!
spaceInPrefixErrorDescription

	^ 'Prefijo con espacios'! !


!SentenceFinderByPrefix class methodsFor: 'assertions' stamp: 'NR 4/20/2019 16:44:10'!
assertHasNoSpaces: aPrefix

	(aPrefix includes: $ ) ifTrue: [self error: self spaceInPrefixErrorDescription ].
! !

!SentenceFinderByPrefix class methodsFor: 'assertions' stamp: 'NR 4/20/2019 16:44:06'!
assertNotEmpty: aPrefix

	(aPrefix isEmpty) ifTrue: [self error: self emptyPrefixErrorDescription ].
! !
