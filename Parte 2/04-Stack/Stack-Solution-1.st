!classDefinition: #OOStackTest category: #'Stack-Solution-1a'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1a'!

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

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 18:09:54'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 18:08:30'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 18:10:04'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #OOStack category: #'Stack-Solution-1a'!
Object subclass: #OOStack
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1a'!

!OOStack methodsFor: 'initialization' stamp: 'HAW 4/14/2017 17:58:07'!
initialize

	contents _ OrderedCollection new! !


!OOStack methodsFor: 'testing' stamp: 'HAW 4/14/2017 17:58:16'!
isEmpty

	^ contents isEmpty ! !

!OOStack methodsFor: 'testing' stamp: 'HAW 4/14/2017 18:05:42'!
notEmpty
	
	^contents notEmpty ! !


!OOStack methodsFor: 'push/pop' stamp: 'HAW 4/14/2017 17:59:14'!
pop

	| top |
	
	top := self top.
	contents removeLast.
	
	^ top ! !

!OOStack methodsFor: 'push/pop' stamp: 'HAW 4/14/2017 17:58:41'!
push: anObject

	contents add: anObject ! !

!OOStack methodsFor: 'push/pop' stamp: 'HAW 4/14/2017 17:59:45'!
top

	^ self state top! !


!OOStack methodsFor: 'size' stamp: 'HAW 4/14/2017 17:58:24'!
size

	^ contents size! !


!OOStack methodsFor: 'private' stamp: 'HAW 4/14/2017 18:00:04'!
state 

	^OOStackState stateFor: self! !

!OOStack methodsFor: 'private' stamp: 'HAW 4/14/2017 18:09:34'!
topWhenEmpty
	
	^self error: self class stackEmptyErrorDescription! !

!OOStack methodsFor: 'private' stamp: 'HAW 4/14/2017 18:07:54'!
topWhenNotEmpty
	
	^contents last! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Solution-1a'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackState category: #'Stack-Solution-1a'!
Object subclass: #OOStackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1a'!

!OOStackState methodsFor: 'initialization' stamp: 'HAW 4/14/2017 18:06:20'!
initializeFor: aStack

	stack _ aStack ! !


!OOStackState methodsFor: 'stack operations' stamp: 'HAW 4/14/2017 18:12:08'!
top
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: #'Stack-Solution-1a'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'state selection' stamp: 'HAW 4/14/2017 18:02:20'!
canHandle: aStack

	self subclassResponsibility ! !

!OOStackState class methodsFor: 'state selection' stamp: 'HAW 4/14/2017 18:02:07'!
stateFor: aStack

	^(self subclasses detect: [:aStackStateClass | aStackStateClass canHandle: aStack ]) for: aStack! !


!OOStackState class methodsFor: 'instance creation' stamp: 'HAW 4/14/2017 18:12:47'!
for: aStack

	^self new initializeFor: aStack! !


!classDefinition: #OOEmptyStackState category: #'Stack-Solution-1a'!
OOStackState subclass: #OOEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1a'!

!OOEmptyStackState methodsFor: 'stack operations' stamp: 'HAW 4/14/2017 18:08:58'!
top
	
	^stack topWhenEmpty! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmptyStackState class' category: #'Stack-Solution-1a'!
OOEmptyStackState class
	instanceVariableNames: ''!

!OOEmptyStackState class methodsFor: 'state selection' stamp: 'HAW 4/14/2017 18:02:53'!
canHandle: aStack

	^aStack isEmpty! !


!classDefinition: #OONotEmptyStackState category: #'Stack-Solution-1a'!
OOStackState subclass: #OONotEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Solution-1a'!

!OONotEmptyStackState methodsFor: 'stack operations' stamp: 'HAW 4/14/2017 18:07:35'!
top
	
	^stack topWhenNotEmpty! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONotEmptyStackState class' category: #'Stack-Solution-1a'!
OONotEmptyStackState class
	instanceVariableNames: ''!

!OONotEmptyStackState class methodsFor: 'state selection' stamp: 'HAW 4/14/2017 18:04:34'!
canHandle: aStack

	^aStack notEmpty! !
