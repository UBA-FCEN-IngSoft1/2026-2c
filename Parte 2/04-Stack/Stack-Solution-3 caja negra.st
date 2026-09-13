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

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 14:59:36'!
test01PrefixCanNotBeEmpty

	"
	Categorías para particionar utilizados:
	
	longitud de prefijo a buscar
		- 0 (ERROR) ''
		- 1
		- >1
		
	prefijo a buscar contiene blancos
		- sí (ERROR)
		- no
	
	tamaño de stack
		- vacía (ÚNICO)
		- una oración
		- más de una oración
		
	longitud de oraciones de stack
		- 0 (ÚNICO)
		- 1 
		- > 1
	
	oraciones de stack son sólo blancos
		- sí (ÚNICO)
		- no
	
	contenido stack / prefijo
	
		prefijo a buscar incluido en oraciones de stack (ÚNICOS ya combinados)		
			- sí, como prefijo
			- sí, como substring pero no prefijo
			- sí, mismo case
			- sí, pero con distinto case
			- no
			
		longitud de oracion /  prefijo a buscar (caso ÚNICO, una oración en stack, long prefijo > 1)
			- long oracion < prefijo a buscar
			- long oracion = prefijo a buscar
			- long oracion > prefijo a buscar
		
	"

	self 
		should: [ SentenceFinderByPrefix with: '' on: self moreThanOneSentenceStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixErrorDescription ]

	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 14:59:35'!
test02PrefixCanNotBeOneSpace

	self 
		should: [ SentenceFinderByPrefix with: ' ' on: self moreThanOneSentenceStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix spaceInPrefixErrorDescription ]

	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 14:59:36'!
test03PrefixCanNotBeSpaces

	self 
		should: [ SentenceFinderByPrefix with: '   ' on: self moreThanOneSentenceStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix spaceInPrefixErrorDescription ]

	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 14:59:36'!
test04PrefixCanNotIncludeSpaces

	self should: [ SentenceFinderByPrefix with: 'Wint ' on: self moreThanOneSentenceStack ]
	raise: Error
	withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix spaceInPrefixErrorDescription ]

	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:16:33'!
test05NoSentenceFoundOn_EmptyStack
	
	| finder foundSentences emptyStack |

	emptyStack := self emptyStack.
	
	finder := SentenceFinderByPrefix with: 'Wint' on: emptyStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: emptyStack isEmpty
		 
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:33:50'!
test06NoSentenceFoundOn_Empty_OneSentenceStack
	
	| emptyOneSentenceStack foundSentences finder |

	emptyOneSentenceStack := OOStack new push: ''.

	finder := SentenceFinderByPrefix with: 'w' on: emptyOneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: emptyOneSentenceStack hasSameElementsAndOrderThan: (OOStack new push: '').
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:33:39'!
test07NoSentenceFoundOn_OneSpace_OneSentenceStack
	
	| oneSpaceOneSentenceStack foundSentences finder |

	oneSpaceOneSentenceStack := OOStack new push: ' '.

	finder := SentenceFinderByPrefix with: 'Wint' on: oneSpaceOneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSpaceOneSentenceStack hasSameElementsAndOrderThan: (OOStack new push: ' ').
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:33:25'!
test08NoSentenceFoundOn_MoreThanOneSpace_OneSentenceStack
	
	| moreThanOneSpaceOneSentenceStack foundSentences finder |

	moreThanOneSpaceOneSentenceStack := OOStack new push: '     '.

	finder := SentenceFinderByPrefix with: 'W' on: moreThanOneSpaceOneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: moreThanOneSpaceOneSentenceStack hasSameElementsAndOrderThan: (OOStack new push: '     ').
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:29:42'!
test09FindsSentencesOn_OneChar_OneSentenceStack_WithIncluded_OneCharPrefix
	
	| oneSentenceStack foundSentences finder |

	oneSentenceStack := self oneChar_OneSentenceStack.

	finder := SentenceFinderByPrefix with: 'W' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: 1 equals: foundSentences size.
	self assert: foundSentences first equals: oneSentenceStack top.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self oneChar_OneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:29:42'!
test10NoSentenceFoundOn_OneChar_OneSentenceStack_WithNotIncluded_OneCharPrefix
	
	| oneSentenceStack foundSentences finder |

	oneSentenceStack := self oneChar_OneSentenceStack.

	finder := SentenceFinderByPrefix with: 'a' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self oneChar_OneSentenceStack.
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:29:42'!
test11NoSentenceFoundOn_OneChar_OneSentenceStack_WithCaseSensitiveSearch_OneCharPrefix
	
	| oneSentenceStack foundSentences finder |

	oneSentenceStack := self oneChar_OneSentenceStack.

	finder := SentenceFinderByPrefix with: 'w' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self oneChar_OneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:54:26'!
test12FindsSentencesOn_MoreThanOneChar_OneSentenceStack_WithIncluded_OneCharPrefix
	
	| oneSentenceStack foundSentences finder |

	oneSentenceStack := self moreThanOneChar_OneSentenceStack.

	finder := SentenceFinderByPrefix with: 'W' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: 1 equals: foundSentences size.
	self assert: foundSentences first equals: oneSentenceStack top.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self moreThanOneChar_OneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:54:26'!
test13NoSentenceFoundOn_MoreThanOneChar_OneSentenceStack_WithNotIncluded_OneCharPrefix
	
	|oneSentenceStack foundSentences finder |

	oneSentenceStack := self moreThanOneChar_OneSentenceStack .

	finder := SentenceFinderByPrefix with: 'u' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self moreThanOneChar_OneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:54:26'!
test14NoSentenceFoundOn_MoreThanOneChar_OneSentenceStack_WithSubstring_OneCharPrefix
	
	|oneSentenceStack foundSentences finder |

	oneSentenceStack := self moreThanOneChar_OneSentenceStack .

	finder := SentenceFinderByPrefix with: 'i' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self moreThanOneChar_OneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:54:27'!
test15NoSentenceFoundOn_MoreThanOneChar_OneSentenceStack_WithCaseSensitiveSearch_OneCharPrefix
	
	|oneSentenceStack foundSentences finder |

	oneSentenceStack := self moreThanOneChar_OneSentenceStack .

	finder := SentenceFinderByPrefix with: 'w' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self moreThanOneChar_OneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:59:59'!
test16FindsSentencesOn_MoreThanOneSentenceStack_WithIncluded_OneCharPrefix
	
	|moreThanOneSentenceStack foundSentences finder sentencesToFind |

	sentencesToFind := OrderedCollection  new addAll: #('Winter is here' 'Winter' 'Wint ' 'Wint' 'Winx' 'Win win wint winter wint' 'Win' 'W w w' 'Ww' 'W ' 'W'); yourself.

	moreThanOneSentenceStack := self moreThanOneSentenceStack.

	finder := SentenceFinderByPrefix with: 'W' on: moreThanOneSentenceStack.
	foundSentences := finder find.
	
	self assert: foundSentences equals: sentencesToFind.
	self assert: moreThanOneSentenceStack hasSameElementsAndOrderThan: self moreThanOneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 14:59:36'!
test17NoSentenceFoundOn_MoreThanOneSentenceStack_WithNotIncluded_OneCharPrefix
	
	|moreThanOneSentenceStack foundSentences finder |

	moreThanOneSentenceStack := self moreThanOneSentenceStack.

	finder := SentenceFinderByPrefix with: 's' on: moreThanOneSentenceStack.
	foundSentences := finder find.
	
	self assert: foundSentences isEmpty.
	self assert: moreThanOneSentenceStack hasSameElementsAndOrderThan: self moreThanOneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:59:52'!
test18FindsSentencesOn_MoreThanOneSentenceStack_WithCaseSensitiveSearch_OneCharPrefix
	
	|moreThanOneSentenceStack foundSentences finder sentencesToFind |

	sentencesToFind := OrderedCollection  new addAll: #('winning is everything' 'winter Winter winter' 'winter is coming, winter is coming, winter is coming' 'winter' 'wint' 'w w w' 'wW' 'w'); yourself.

	moreThanOneSentenceStack := self moreThanOneSentenceStack.

	finder := SentenceFinderByPrefix with: 'w' on: moreThanOneSentenceStack.
	foundSentences := finder find.
	
	self assert: foundSentences equals: sentencesToFind.
	self assert: moreThanOneSentenceStack hasSameElementsAndOrderThan: self moreThanOneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:29:42'!
test19NoSentenceFoundOn_OneChar_OneSentenceStack_With_MoreThanOneCharPrefix

	| oneSentenceStack foundSentences finder |

	oneSentenceStack := self oneChar_OneSentenceStack.

	finder := SentenceFinderByPrefix with: 'Wint' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self oneChar_OneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:32:41'!
test20NoSentenceFoundOn_MoreThanOneCharLessLenThanPrefix_OneSentenceStack_With_MoreThanOneCharPrefix

	| oneSentenceStack foundSentences finder |

	oneSentenceStack := OOStack new push: 'Win'.

	finder := SentenceFinderByPrefix with: 'Wint' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: (OOStack new push: 'Win').
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:32:18'!
test21FindsSentencesOn_MoreThanOneCharSameLenAsPrefix_OneSentenceStack_With_Included_MoreThanOneCharPrefix

	| oneSentenceStack foundSentences finder |

	oneSentenceStack := OOStack new push: 'Wint'.

	finder := SentenceFinderByPrefix with: 'Wint' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: 1 equals: foundSentences size.
	self assert: foundSentences first equals: oneSentenceStack top.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: (OOStack new push: 'Wint').
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:54:26'!
test22FindsSentencesOn_MoreThanOneCharMoreLenThanPrefix_OneSentenceStack_WithIncluded_MoreThanOneCharPrefix

	| oneSentenceStack foundSentences finder |

	oneSentenceStack := self moreThanOneChar_OneSentenceStack.

	finder := SentenceFinderByPrefix with: 'Wint' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: 1 equals: foundSentences size.
	self assert: foundSentences first equals: oneSentenceStack top.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self moreThanOneChar_OneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:54:26'!
test23NoSentenceFoundOn_MoreThanOneChar_OneSentenceStack_WithNotIncluded_MoreThanOneCharPrefix

	| oneSentenceStack foundSentences finder |

	oneSentenceStack := self moreThanOneChar_OneSentenceStack.

	finder := SentenceFinderByPrefix with: 'winning' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self moreThanOneChar_OneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:54:26'!
test24NoSentenceFoundOn_MoreThanOneChar_OneSentenceStack_WithSubstring_MoreThanOneCharPrefix

	| oneSentenceStack foundSentences finder |

	oneSentenceStack := self moreThanOneChar_OneSentenceStack.

	finder := SentenceFinderByPrefix with: 'coming' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self moreThanOneChar_OneSentenceStack.

	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:54:26'!
test25NoSentenceFoundOn_MoreThanOneChar_OneSentenceStack_WithCaseSensitiveSearch_MoreThanOneCharPrefix

	| oneSentenceStack foundSentences finder |

	oneSentenceStack := self moreThanOneChar_OneSentenceStack.

	finder := SentenceFinderByPrefix with: 'wint' on: oneSentenceStack.
	foundSentences := finder find.
		
	self assert: foundSentences isEmpty.
	self assert: oneSentenceStack hasSameElementsAndOrderThan: self moreThanOneChar_OneSentenceStack.

	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:59:42'!
test26FindsSentencesOn_MoreThanOneSentenceStack_WithIncluded_MoreThanOneCharPrefix

	|moreThanOneSentenceStack foundSentences finder sentencesToFind |

	sentencesToFind := OrderedCollection  new addAll: #('Winter is here' 'Winter' 'Wint ' 'Wint'); yourself.
	
	moreThanOneSentenceStack := self moreThanOneSentenceStack.

	finder := SentenceFinderByPrefix with: 'Wint' on: moreThanOneSentenceStack.
	foundSentences := finder find.
	
	self assert: foundSentences equals: sentencesToFind.
	self assert: moreThanOneSentenceStack hasSameElementsAndOrderThan: self moreThanOneSentenceStack.
	
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 14:59:36'!
test27NoSentenceFoundOn_MoreThanOneSentenceStack_WithNotIncluded_MoreThanOneCharPrefix

	|moreThanOneSentenceStack foundSentences finder |

	moreThanOneSentenceStack := self moreThanOneSentenceStack.

	finder := SentenceFinderByPrefix with: 'Winning' on: moreThanOneSentenceStack.
	foundSentences := finder find.
	
	self assert: foundSentences isEmpty.
	self assert: moreThanOneSentenceStack hasSameElementsAndOrderThan: self moreThanOneSentenceStack.
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 14:59:36'!
test28NoSentenceFoundOn_MoreThanOneSentenceStack_WithNotIncluded_MoreThanOneCharPrefix

	|moreThanOneSentenceStack foundSentences finder |

	moreThanOneSentenceStack := self moreThanOneSentenceStack.

	finder := SentenceFinderByPrefix with: 'Spring' on: moreThanOneSentenceStack.
	foundSentences := finder find.
	
	self assert: foundSentences isEmpty.
	self assert: moreThanOneSentenceStack hasSameElementsAndOrderThan: self moreThanOneSentenceStack.
	
		 
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'NR 4/21/2019 15:57:04'!
test29FindsSentencesOn_MoreThanOneSentenceStack_WithCaseSensitiveSearch_MoreThanOneCharPrefix

	| moreThanOneSentenceStack foundSentences finder sentencesToFind |
	
	sentencesToFind := OrderedCollection  new addAll: #('winter Winter winter' 'winter is coming, winter is coming, winter is coming' 'winter' 'wint'); yourself.

	moreThanOneSentenceStack := self moreThanOneSentenceStack.

	finder := SentenceFinderByPrefix with: 'wint' on: moreThanOneSentenceStack.
	foundSentences := finder find.
	
      self assert: foundSentences equals: sentencesToFind.
	self assert: moreThanOneSentenceStack hasSameElementsAndOrderThan: self moreThanOneSentenceStack.
	
		 
		
	! !


!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'NR 4/20/2019 20:58:22'!
assert: aStack hasSameElementsAndOrderThan: anotherStack
	
	self assert: aStack hasSameSizeThan: anotherStack.
	
	self assert: aStack includedOnSameOrderAs: anotherStack.! !

!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'NR 4/20/2019 20:55:32'!
assert: aStack hasSameSizeThan: anotherStack
	
	self assert: aStack size = anotherStack size.! !

!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'NR 4/21/2019 08:45:26'!
assert: aStack includedOnSameOrderAs: anotherStack
	
	aStack size timesRepeat: [ self assert: aStack pop = anotherStack pop ].! !


!SentenceFinderByPrefixTest methodsFor: 'test data - stacks' stamp: 'NR 4/21/2019 14:57:13'!
emptyStack
	
	^ OOStack new.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test data - stacks' stamp: 'NR 4/21/2019 15:54:26'!
moreThanOneChar_OneSentenceStack

	^ OOStack new push: 'Winter is coming'.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test data - stacks' stamp: 'NR 4/21/2019 15:51:47'!
moreThanOneSentenceStack
	
	|aStack|
	
	aStack := OOStack new.
	aStack push: ''.
	aStack push: ' '.
	aStack push: '  '.
	aStack push: 'w'.
	aStack push: 'W'.
	aStack push: ' w'.
	aStack push: '  W'.
	aStack push: '  W '.
	aStack push: 'W '.
	aStack push: 'x'.
	aStack push: 'Ww'.
	aStack push: 'wW'.
	aStack push: 'w w w'.
	aStack push: 'W w w'.
	aStack push: 'Win'.
	aStack push: 'Win win wint winter wint'.
	aStack push: 'Winx'.
	aStack push: 'wint'.
	aStack push: 'Hodor!!'.
	aStack push: 'Wint'.
	aStack push: ' Wint'.
	aStack push: 'Wint '.
	aStack push: 'Winter'.
	aStack push: 'winter'.
	aStack push: 'winter is coming, winter is coming, winter is coming'.
	aStack push: 'winter Winter winter'.
	aStack push: 'winning is everything'.
	aStack push: 'Winter is here'.
	
	^ aStack
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test data - stacks' stamp: 'NR 4/21/2019 15:29:42'!
oneChar_OneSentenceStack

	^ OOStack new push: 'W'.
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

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'NR 9/19/2022 05:38:27'!
initializeWith: aPrefix on: aStack
	
	prefix := aPrefix.
	stack := aStack.
	
	auxiliaryReversedStack := OOStack new.! !


!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'HAW 4/15/2019 10:14:00'!
addToFoundSentencesIfPrefix: aSentence 

	(aSentence beginsWith: prefix) ifTrue: [ foundSentences add: aSentence ].
! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'NR 4/29/2022 20:43:22'!
findAllSentencesByPrefixFromStack
		
	stack size timesRepeat: [ self findSentenceByPrefixOnTopOfStack ]
	! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'NR 4/23/2019 07:27:40'!
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

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'NR 4/29/2022 20:44:15'!
rebuildOriginalStack
		
	auxiliaryReversedStack size timesRepeat: [ self pushBackOriginalElement ]	! !


!SentenceFinderByPrefix methodsFor: 'finding' stamp: 'NR 9/20/2022 16:21:48'!
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
