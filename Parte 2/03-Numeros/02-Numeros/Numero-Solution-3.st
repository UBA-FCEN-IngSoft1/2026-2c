!classDefinition: #NumeroTest category: 'Numero-Solution-3'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!NumeroTest methodsFor: 'setup' stamp: 'NR 9/24/2018 01:22:59'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 10/1/2018 01:21:31'!
test27BisEnteroSubstractsEnteroCorrectly

	self assert: two - one equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 19:24:12'!
test27ZeroDivideAnythingIsZero

	self assert: zero / one equals: zero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2018 01:21:44'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2018 01:21:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2018 01:22:11'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2018 01:22:17'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2018 01:22:27'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2018 01:22:33'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2018 01:23:22'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2018 01:23:29'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2018 01:23:36'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2018 01:23:41'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2018 01:23:45'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 19:50:22'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)
	! !


!classDefinition: #Numero category: 'Numero-Solution-3'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/24/2018 00:55:01'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/24/2018 00:56:58'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:16:36'!
addToEntero: anEnteroBeingAdded

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:17:24'!
addToFraccion: aFraccionBeingAdded

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:40:24'!
divideEntero: anEnteroDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:41:05'!
divideFraccion: aFraccionDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:18:57'!
multiplyToEntero: anEnteroBeingMultiplied

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:20:19'!
multiplyToFraccion: aFraccionBeingMultiplied

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:20:43'!
subtractFromEntero: anEnteroMinuend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:20:56'!
subtractFromFraccion: aFraccionMinuend

	self subclassResponsibility ! !


!Numero methodsFor: 'testing' stamp: 'NR 10/1/2018 01:26:12'!
isNegative

	^false! !

!Numero methodsFor: 'testing' stamp: 'HAW 5/3/2017 18:30:07'!
isOne

	^false! !

!Numero methodsFor: 'testing' stamp: 'HAW 5/3/2017 18:30:13'!
isZero

	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Solution-3'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!classDefinition: #Entero category: 'Numero-Solution-3'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!Entero methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:18:57'!
* aMultiplier 
	
	^aMultiplier multiplyToEntero: self ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:16:36'!
+ anAdder 
	
	^anAdder addToEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:20:43'!
- aSubtrahend 
	
	^aSubtrahend subtractFromEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:01'!
/ aDivisor 
	
	^aDivisor divideEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 18:23:59'!
// aDivisor 
	
	^self class with: self integerValue // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'NR 9/30/2018 20:24:33'!
fibonacci

	self subclassResponsibility ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 18:24:07'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (self integerValue gcd: anEntero integerValue)! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:16:36'!
addToEntero: anEnteroBeingAdded 
	
	^self class with: anEnteroBeingAdded integerValue + self integerValue
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:17:24'!
addToFraccion: aFraccionBeingAdded

	^self + aFraccionBeingAdded 
	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 19:31:24'!
asDenominatorOf: aNumerator

	^Fraccion safeWith: aNumerator over: self
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:46:25'!
divideEntero: anEnteroDividend

	^anEnteroDividend over: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:46:36'!
divideFraccion: aFraccionDividend

	^aFraccionDividend numerator / (aFraccionDividend denominator * self) ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:18:57'!
multiplyToEntero: anEnteroBeingMultiplied

	^self class with: anEnteroBeingMultiplied integerValue * self integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:20:19'!
multiplyToFraccion: aFraccionBeingMultiplied

	^self * aFraccionBeingMultiplied ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:54:09'!
over: anEnteroDivisor
	
	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: anEnteroDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := anEnteroDivisor // greatestCommonDivisor.
	
	^denominator asDenominatorOf: numerator	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:20:43'!
subtractFromEntero: anEnteroMinuend 
	
	^self class with: anEnteroMinuend integerValue - self integerValue
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:20:56'!
subtractFromFraccion: aFraccionMinuend 
			
	^aFraccionMinuend numerator - (self * aFraccionMinuend denominator) / (aFraccionMinuend denominator). ! !


!Entero methodsFor: 'value' stamp: 'HAW 5/3/2017 18:25:39'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	self subclassResponsibility ! !


!Entero methodsFor: 'printing' stamp: 'NR 9/30/2018 19:49:42'!
printOn: aStream

	aStream print: self integerValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Solution-3'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 10/1/2018 15:47:28'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	"Estos ifs no se pueden evitar ya que son los que diferencian la clase a utilizar... si estuvieramos implementando un lenguaje estarian
	en la VM. 
	Notar la implementacion de #new en Cero y Uno, ¿que hace? - Hernan"
	aValue = 0 ifTrue: [ ^Cero new ].
	aValue = 1 ifTrue: [ ^Uno new ].
	aValue < 0 ifTrue: [^Negativo new initializeWith: aValue].
	^PositivoMayorAUno new initializeWith: aValue! !


!Entero class methodsFor: 'error descriptions' stamp: 'NR 9/24/2018 01:11:49'!
negativeFibonacciErrorDescription
	
	^ ' Fibonacci no está definido aquí para enteros negativos'! !


!classDefinition: #Cero category: 'Numero-Solution-3'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!Cero methodsFor: 'value' stamp: 'HAW 5/3/2017 18:25:48'!
integerValue

	^0! !


!Cero methodsFor: 'testing' stamp: 'HAW 5/3/2017 18:30:34'!
isZero

	^true! !


!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 19:34:25'!
divideEntero: aDividend

	self error: self class canNotDivideByZeroErrorDescription
	! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 10/1/2020 17:58:17'!
over: anEnteroDivisor

	^self! !


!Cero methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:58:03'!
fibonacci

	^ Entero with: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numero-Solution-3'!
Cero class
	instanceVariableNames: 'uniqueInstance'!

!Cero class methodsFor: 'initialization' stamp: 'HAW 5/3/2017 18:27:46'!
initialize

	uniqueInstance := self basicNew ! !


!Cero class methodsFor: 'instance creation' stamp: 'HAW 5/3/2017 18:27:26'!
new

	^uniqueInstance! !


!classDefinition: #EnteroMenosCeroYUno category: 'Numero-Solution-3'!
Entero subclass: #EnteroMenosCeroYUno
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!EnteroMenosCeroYUno methodsFor: 'initialization' stamp: 'NR 9/24/2018 01:25:29'!
initializeWith: aValue 
	
	value := aValue! !


!EnteroMenosCeroYUno methodsFor: 'comparing' stamp: 'HAW 5/3/2017 18:31:02'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!EnteroMenosCeroYUno methodsFor: 'comparing' stamp: 'HAW 5/3/2017 18:31:08'!
hash

	^value hash! !


!EnteroMenosCeroYUno methodsFor: 'value' stamp: 'HAW 5/3/2017 18:26:02'!
integerValue

	^value ! !


!classDefinition: #Negativo category: 'Numero-Solution-3'!
EnteroMenosCeroYUno subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!Negativo methodsFor: 'arithmetic operations' stamp: 'NR 9/30/2018 19:44:11'!
divideEntero: aDividend
	
	^ aDividend negated / self negated! !

!Negativo methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:58:07'!
fibonacci
	
	^ self error: Entero negativeFibonacciErrorDescription ! !


!Negativo methodsFor: 'testing' stamp: 'NR 10/1/2018 01:26:54'!
isNegative
	
	^true! !


!classDefinition: #PositivoMayorAUno category: 'Numero-Solution-3'!
EnteroMenosCeroYUno subclass: #PositivoMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!PositivoMayorAUno methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:58:18'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.

	^ (self - one) fibonacci + (self - two) fibonacci! !


!classDefinition: #Uno category: 'Numero-Solution-3'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!Uno methodsFor: 'value' stamp: 'HAW 5/3/2017 18:26:09'!
integerValue

	^1! !


!Uno methodsFor: 'testing' stamp: 'HAW 5/3/2017 18:30:41'!
isOne

	^true! !


!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 19:28:26'!
asDenominatorOf: aNumerator

	^aNumerator ! !


!Uno methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:58:22'!
fibonacci
	
	^ self		! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numero-Solution-3'!
Uno class
	instanceVariableNames: 'uniqueInstance'!

!Uno class methodsFor: 'initialization' stamp: 'HAW 5/3/2017 18:29:22'!
initialize

	uniqueInstance := self basicNew ! !


!Uno class methodsFor: 'instance creation' stamp: 'HAW 5/3/2017 18:28:02'!
new

	^uniqueInstance! !


!classDefinition: #Fraccion category: 'Numero-Solution-3'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-3'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:20:19'!
* aMultiplier 
	
	^aMultiplier multiplyToFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:17:24'!
+ anAdder 
	
	^anAdder addToFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:20:56'!
- aSubtrahend 
	
	^aSubtrahend subtractFromFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:06'!
/ aDivisor 
	
	^aDivisor divideFraccion: self! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:16:36'!
addToEntero: anEnteroBeingAdded

	^anEnteroBeingAdded * denominator + numerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:17:24'!
addToFraccion: aFraccionBeingAdded

	| newNumerator newDenominator |
	
	newNumerator :=  (denominator * aFraccionBeingAdded numerator) + (numerator * aFraccionBeingAdded denominator).
	newDenominator := denominator * aFraccionBeingAdded denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:49:04'!
divideEntero: anEnteroDividend

	^anEnteroDividend * denominator / numerator
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 5/13/2020 10:49:16'!
divideFraccion: aFraccionDividend

	^(aFraccionDividend numerator * denominator) / (aFraccionDividend denominator * numerator)
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:18:57'!
multiplyToEntero: anEnteroBeingMultiplied

	^anEnteroBeingMultiplied * numerator / denominator 
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:20:19'!
multiplyToFraccion: aFraccionBeingMultiplied

	^(aFraccionBeingMultiplied numerator * numerator) / (aFraccionBeingMultiplied denominator * denominator)
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:20:43'!
subtractFromEntero: anEnteroMinuend

	^anEnteroMinuend * denominator - numerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:20:56'!
subtractFromFraccion: aFraccionMinuend

	| newNumerator newDenominator |
	
	newNumerator := (denominator * aFraccionMinuend numerator) - (numerator * aFraccionMinuend denominator) .
	newDenominator := denominator * aFraccionMinuend denominator.
	
	^newNumerator / newDenominator 
! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HAW 5/3/2017 19:32:45'!
initializeSafeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 4/24/2021 17:33:28'!
isNegative
	
	^numerator isNegative! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Solution-3'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation - private' stamp: 'NR 9/30/2018 19:57:05'!
safeWith: aDividend over: aDivisor

	"Sólo para ser enviado desde los objetos de la jerarquia ya que se asume que aDividend no es 0, y aDivisor no es ni 0 ni 1 ni negativo - Hernan y Nicolás."
	
	^self new initializeSafeWith: aDividend over: aDivisor ! !

Cero initialize!
Uno initialize!