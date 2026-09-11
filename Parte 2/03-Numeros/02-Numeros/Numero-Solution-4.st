!classDefinition: #NumeroTest category: 'Numero-Solution-4'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs eight negativeOne negativeTwo three'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!NumeroTest methodsFor: 'setup' stamp: 'NR 9/30/2018 18:29:17'!
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


!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:49:20'!
shouldRaiseDivideByZeroException: aBlock

	self 
		should: aBlock
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:37:57'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero.
	self deny: two isZero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:37:46'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne.
	self deny: two isOne.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 23:19:11'!
test05EnteroAddsWithEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"
	self assert: zero + zero equals: zero.
	self assert: zero + one equals: one.
	self assert: zero + two equals: two.
	self assert: zero + negativeTwo equals: negativeTwo.
	
	self assert: one + zero equals: one.
	self assert: one + one equals: two.
	self assert: one + two equals: three.
	self assert: one + negativeTwo equals: negativeOne.
	
	self assert: two + zero equals: two.
	self assert: two + one equals: three.
	self assert: two + two equals: four.
	self assert: two + negativeTwo equals: zero.
	
	self assert: negativeTwo + zero equals: negativeTwo.
	self assert: negativeTwo + one equals: negativeOne.
	self assert: negativeTwo + two equals: zero.
	self assert: negativeTwo + negativeTwo equals: (Entero with: -4).! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 23:21:17'!
test06EnteroMultipliesWithEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"
	self assert: zero * zero equals: zero.
	self assert: zero * one equals: zero.
	self assert: zero * two equals: zero.
	self assert: zero * negativeTwo equals: zero.
	
	self assert: one * zero equals: zero.
	self assert: one * one equals: one.
	self assert: one * two equals: two.
	self assert: one * negativeTwo equals: negativeTwo.
	
	self assert: two * zero equals: zero.
	self assert: two * one equals: two.
	self assert: two * two equals: four.
	self assert: two * negativeTwo equals: (Entero with: -4).
	
	self assert: negativeTwo * zero equals: zero.
	self assert: negativeTwo * one equals: negativeTwo.
	self assert: negativeTwo * two equals: (Entero with: -4).
	self assert: negativeTwo * negativeTwo equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 23:25:58'!
test07EnteroDividesEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"
	self shouldRaiseDivideByZeroException: [ zero / zero ].
	self assert: zero / one equals: zero.
	self assert: zero / two equals: zero.
	self assert: zero / negativeTwo equals: zero.
	
	self shouldRaiseDivideByZeroException: [ one / zero ].
	self assert: one / one equals: one.
	self assert: one / two equals: oneHalf.
	self assert: one / negativeTwo equals: oneHalf negated.
	
	self shouldRaiseDivideByZeroException: [ two / zero ].
	self assert: two / one equals: two.
	self assert: two / two equals: one.
	self assert: two / negativeTwo equals: one negated.
	
	self shouldRaiseDivideByZeroException: [ negativeTwo / zero ].
	self assert: negativeTwo / one equals: negativeTwo.
	self assert: negativeTwo / two equals: negativeOne.
	self assert: negativeTwo / negativeTwo equals: one.
	! !

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

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 23:27:57'!
test11EnteroAddsFraccionCorrectly

	"Ahora empieza la diversion!!

	Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self assert: zero + oneFifth equals: oneFifth.
	self assert: one + oneFifth equals:  (Entero with: 6) / five.
	self assert: two + oneFifth equals: (Entero with: 11) / five.
	self assert: negativeTwo + oneFifth equals: (Entero with: -9) / five
	! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 23:28:45'!
test12FraccionAddsEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self assert: oneFifth + zero equals: oneFifth.
	self assert: oneFifth + one equals:  (Entero with: 6) / five.
	self assert: oneFifth + two equals: (Entero with: 11) / five.
	self assert: oneFifth + negativeTwo equals: (Entero with: -9) / five.
	! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 23:29:16'!
test13EnteroMultipliesFraccionCorrectly
	
	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self assert: zero * oneFifth equals: zero.
	self assert: one * oneFifth equals: oneFifth.
	self assert: two * oneFifth equals: twoFifth.
	self assert: negativeTwo * oneFifth equals: twoFifth negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 23:30:36'!
test14FraccionMultipliesEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self assert: oneFifth * zero equals: zero.
	self assert: oneFifth * one  equals:  oneFifth.
	self assert: oneFifth * two equals: twoFifth.
	self assert: oneFifth * negativeTwo equals: twoFifth negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 23:31:12'!
test15EnteroDividesFraccionCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self assert: zero / oneFifth equals: zero.
	self assert: one / oneFifth equals: five.
	self assert: two / oneFifth equals: (Entero with: 10).
	self assert: negativeTwo / oneFifth equals: (Entero with: -10)
! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 23:32:05'!
test16FraccionDividesEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite - Hernan"

	self shouldRaiseDivideByZeroException: [ oneFifth / zero ].
	self assert: oneFifth / one equals: oneFifth.
	self assert: oneFifth / two equals: one/ (Entero with: 10).
	self assert: oneFifth / negativeTwo equals: one/ (Entero with: -10)
	

	! !

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

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:35:56'!
test23CanNotDivideEnteroByZero

	"Este test ya no tiene sentido porque se esta verificando en los tests de division.
	Lo dejo solo para que se vea que ya no tiene sentido - Hernan
	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	"! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 5/3/2017 15:36:09'!
test24CanNotDivideFraccionByZero

	"Este test ya no tiene sentido porque se esta verificando en los tests de division.
	Lo dejo solo para que se vea que ya no tiene sentido - Hernan
	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	"	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 10/1/2018 00:09:23'!
test27BisEnteroSubstractsEnteroCorrecty
	
	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite "
	
	self assert: zero - zero equals: zero.
	self assert: zero - one equals: negativeOne.
	self assert: zero - two equals: negativeTwo.
	self assert: zero - negativeTwo equals: two.
	
	self assert: one - zero equals: one.
	self assert: one - one equals: zero.
	self assert: one - two equals: negativeOne.
	self assert: one - negativeTwo equals: three.
	
	self assert: two - zero equals: two.
	self assert: two - one equals: one.
	self assert: two - two equals: zero.
	self assert: two - negativeTwo equals: four.
	
	self assert: negativeTwo - zero equals: negativeTwo.
	self assert: negativeTwo - one equals: three negated.
	self assert: negativeTwo - two equals: four negated.
	self assert: negativeTwo - negativeTwo equals: zero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 23:37:54'!
test27ZeroDivideAnythingIsZero

	"Este test ya no tiene sentido porque se esta verificando en los tests de division.
	Lo dejo solo para que se vea que ya no tiene sentido - Hernan
	
	self assert: zero / one equals: zero
	"! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:27:15'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 23:52:59'!
test29EnteroSubstractsFraccionCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite"

	self assert: zero - oneHalf equals: oneHalf negated.
	self assert: one - oneHalf equals: oneHalf.
	self assert: two - oneHalf equals: three / two.
	self assert: negativeTwo - oneHalf equals: five negated / two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 23:58:36'!
test30FraccionSubstractsEnteroCorrectly

	"Lo correcto seria hacer un test por cada uno de estos asserts ya que son casos distintos.
	Lo hago todo aca para no modificar mucho la estructura del test suite"

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - zero equals: sixFifth.
	self assert: sixFifth - one equals: oneFifth.
	self assert: sixFifth - two equals: (Entero with: -4) / (Entero with: 5).
	self assert: sixFifth - negativeTwo equals: (Entero with: 16) / (Entero with: 5)
	! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:27:51'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:28:02'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:28:10'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:28:17'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:28:24'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:28:31'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:29:42'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:29:51'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:29:58'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:30:05'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:30:27'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/30/2018 18:30:37'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)
	
		! !


!classDefinition: #Numero category: 'Numero-Solution-4'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/30/2018 20:22:19'!
- anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/30/2018 20:21:50'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:53:47'!
addToEnteroMenosUnoYCeroNegativo: anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:02'!
addToEnteroMenosUnoYCeroPositivo: anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:20'!
addToFraccion: anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:42'!
addToUno: anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:05:01'!
divideCero: aDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 10/1/2018 00:11:50'!
divideEnteroMenosUnoYCeroNegativo: aDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 10/1/2018 00:11:41'!
divideEnteroMenosUnoYCeroPositivo: aDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:10'!
divideFraccion: aDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 18:05:35'!
divideUno: aDividend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:08'!
multiplyToEnteroMenosUnoYCeroNegativo: aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:26'!
multiplyToEnteroMenosUnoYCeroPositivo: aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:17'!
multiplyToFraccion: aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:52'!
substractFromEnteroMenosUnoYCeroNegativo: aMinuend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:36'!
substractFromEnteroMenosUnoYCeroPositivo: aMinuend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:02'!
substractFromFraccion: aMinuend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:11'!
substractFromUno: aMinuend

	self subclassResponsibility ! !


!Numero methodsFor: 'testing' stamp: 'NR 10/1/2018 01:31:46'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Solution-4'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!classDefinition: #Entero category: 'Numero-Solution-4'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:13:09'!
// aDivisor 
	
	^self class with: self integerValue // aDivisor integerValue
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'NR 9/30/2018 20:26:03'!
fibonacci

	self subclassResponsibility ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:19:13'!
greatestCommonDivisorWith: anEntero 
	
	self subclassResponsibility ! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 17:43:13'!
asDenominatorOf: aNumerator

	self subclassResponsibility ! !


!Entero methodsFor: 'value' stamp: 'HAW 5/2/2017 17:21:12'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	self subclassResponsibility ! !


!Entero methodsFor: 'printing' stamp: 'NR 10/1/2018 09:19:26'!
printOn: aStream

	aStream print: self integerValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Solution-4'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'error descriptions' stamp: 'NR 9/30/2018 20:12:01'!
negativeFibonacciErrorDescription
	
	^ ' Fibonacci no está definido aquí para enteros negativos'! !


!Entero class methodsFor: 'instance creation' stamp: 'NR 10/1/2018 16:05:03'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	aValue = 0 ifTrue: [ ^Cero new ].
	aValue = 1 ifTrue: [ ^Uno new ].
	aValue < 0 ifTrue: [ ^Negativo safeWith: aValue].
	 
	^ PositivoMayorAUno safeWith: aValue
	! !


!classDefinition: #Cero category: 'Numero-Solution-4'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!Cero methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:31:30'!
* aMultiplier 
	
	^self! !

!Cero methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:31:48'!
+ anAdder 
	
	^anAdder! !

!Cero methodsFor: 'arithmetic operations' stamp: 'NR 9/30/2018 20:21:13'!
- aSubtrahend
	
	^aSubtrahend negated! !

!Cero methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 12:40:57'!
/ aDivisor 
	
	^aDivisor divideCero: self! !

!Cero methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 18:14:09'!
// aDivisor

	^self! !

!Cero methodsFor: 'arithmetic operations' stamp: 'NR 9/30/2018 20:27:31'!
fibonacci

	^ Entero with: 1! !

!Cero methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:14:45'!
greatestCommonDivisorWith: anEntero 
	
	^ anEntero ! !


!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:53:47'!
addToEnteroMenosUnoYCeroNegativo: anAdder

	^ anAdder 
	
	! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:02'!
addToEnteroMenosUnoYCeroPositivo: anAdder

	^ anAdder 
	
	! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:20'!
addToFraccion: anAdder 
	
	^ anAdder ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:42'!
addToUno: anAdder 
	
	^ anAdder ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:56:43'!
asDenominatorOf: aNumerator

	self signalCanNotDivideByZero ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:56:50'!
divideCero: aCero 
	
	self signalCanNotDivideByZero ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 18:37:05'!
divideEnteroMenosUnoYCeroNegativo: aDividend

	self signalCanNotDivideByZero ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 18:37:00'!
divideEnteroMenosUnoYCeroPositivo: aDividend

	self signalCanNotDivideByZero ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:57:14'!
divideFraccion: aDividend

	self signalCanNotDivideByZero ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:49:51'!
divideUno: anUno 
	
	self signalCanNotDivideByZero! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:08'!
multiplyToEnteroMenosUnoYCeroNegativo: aMultiplier

	^self! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:26'!
multiplyToEnteroMenosUnoYCeroPositivo: aMultiplier

	^self! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:17'!
multiplyToFraccion: aMultiplier

	^self
	! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 15:50:07'!
signalCanNotDivideByZero
	
	self error: self class canNotDivideByZeroErrorDescription ! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:52'!
substractFromEnteroMenosUnoYCeroNegativo: aMinuend

	^ aMinuend 
	
	! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:36'!
substractFromEnteroMenosUnoYCeroPositivo: aMinuend

	^ aMinuend 
	
	! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:02'!
substractFromFraccion: aMinuend

	^ aMinuend 
	
	! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:11'!
substractFromUno: aMinuend

	^ aMinuend 
	
	! !


!Cero methodsFor: 'value' stamp: 'HAW 5/2/2017 17:11:32'!
integerValue

	^0! !


!Cero methodsFor: 'testing' stamp: 'NR 10/1/2018 01:32:56'!
isNegative
	
	^false! !

!Cero methodsFor: 'testing' stamp: 'HAW 5/2/2017 17:22:15'!
isOne

	^false! !

!Cero methodsFor: 'testing' stamp: 'HAW 5/2/2017 17:22:09'!
isZero

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numero-Solution-4'!
Cero class
	instanceVariableNames: 'uniqueInstance'!

!Cero class methodsFor: 'initialization' stamp: 'HAW 5/3/2017 18:11:21'!
initialize

	uniqueInstance := self basicNew! !


!Cero class methodsFor: 'instance creation' stamp: 'HAW 5/3/2017 18:10:38'!
new

	^uniqueInstance! !


!classDefinition: #EnteroMenosCeroYUno category: 'Numero-Solution-4'!
Entero subclass: #EnteroMenosCeroYUno
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!EnteroMenosCeroYUno methodsFor: 'comparing' stamp: 'NR 10/1/2018 00:21:11'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!EnteroMenosCeroYUno methodsFor: 'comparing' stamp: 'NR 10/1/2018 00:24:26'!
hash

	^value hash! !


!EnteroMenosCeroYUno methodsFor: 'arithmetic operations' stamp: 'NR 10/1/2018 00:23:08'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!EnteroMenosCeroYUno methodsFor: 'testing' stamp: 'NR 10/1/2018 00:24:50'!
isOne

	^false! !

!EnteroMenosCeroYUno methodsFor: 'testing' stamp: 'NR 10/1/2018 00:25:00'!
isZero

	^false! !


!EnteroMenosCeroYUno methodsFor: 'value' stamp: 'NR 10/1/2018 00:29:16'!
integerValue
	
	^value! !


!EnteroMenosCeroYUno methodsFor: 'initialization' stamp: 'NR 10/1/2018 00:31:00'!
initializeSafeWith: aValue 
	
	value := aValue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroMenosCeroYUno class' category: 'Numero-Solution-4'!
EnteroMenosCeroYUno class
	instanceVariableNames: ''!

!EnteroMenosCeroYUno class methodsFor: 'instance creation - private' stamp: 'NR 10/1/2018 00:30:31'!
safeWith: anIntegerValue

	"Solo debe ser enviado este mensaje cuando es seguro que anIntegerValue es distinto de 0 y 1,
	y solo debe ser enviado desde la misma jerarquia - Hernan"
	
	^self new initializeSafeWith: anIntegerValue ! !


!classDefinition: #Negativo category: 'Numero-Solution-4'!
EnteroMenosCeroYUno subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!Negativo methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:55:08'!
* aMultiplier 
	
	^aMultiplier multiplyToEnteroMenosUnoYCeroNegativo: self ! !

!Negativo methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:53:47'!
+ anAdder 
	
	^anAdder addToEnteroMenosUnoYCeroNegativo: self.
	! !

!Negativo methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:55:52'!
- anAdder 
	
	^anAdder substractFromEnteroMenosUnoYCeroNegativo: self.
	! !

!Negativo methodsFor: 'arithmetic operations' stamp: 'NR 9/30/2018 20:59:18'!
/ aDivisor 
	
	^aDivisor divideEnteroMenosUnoYCeroNegativo: self! !


!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:53:47'!
addToEnteroMenosUnoYCeroNegativo: anAdder

	^self class safeWith: value + anAdder integerValue ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:02'!
addToEnteroMenosUnoYCeroPositivo: anAdder

	^Entero with: value + anAdder integerValue ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:20'!
addToFraccion: anAdder

	^self + anAdder 
	! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:42'!
addToUno: anAdder 
	
	"Si soy -1 daria 0, por eso envia mensaje a Entero y no a self class - Hernan"
	
	^Entero with: 1 + value ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 19:36:31'!
divideCero: aDividend 
	
	^ aDividend ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 20:27:56'!
divideEnteroMenosUnoYCeroNegativo: aDividend 
	
	^ aDividend negated / self negated ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 20:22:05'!
divideEnteroMenosUnoYCeroPositivo: aDividend 
	
	^ aDividend negated / self negated ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 20:33:02'!
divideFraccion: aDividend

	^aDividend numerator negated / (aDividend denominator * self negated) ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 20:32:28'!
divideUno: aDividend
	
	^Fraccion safeWith: aDividend negated over: self negated! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 22:47:27'!
fibonacci
	
	^ self error: Entero negativeFibonacciErrorDescription ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:08'!
multiplyToEnteroMenosUnoYCeroNegativo: aMultiplier

	^PositivoMayorAUno safeWith: value * aMultiplier integerValue ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:26'!
multiplyToEnteroMenosUnoYCeroPositivo: aMultiplier

	^self class safeWith: value * aMultiplier integerValue ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:17'!
multiplyToFraccion: aMultiplier

	^self * aMultiplier ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:52'!
substractFromEnteroMenosUnoYCeroNegativo: aMinuend

	^Entero with: aMinuend integerValue - value ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:36'!
substractFromEnteroMenosUnoYCeroPositivo: aMinuend

	^PositivoMayorAUno safeWith: aMinuend integerValue - value ! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:02'!
substractFromFraccion: aMinuend

	^aMinuend numerator - (self * aMinuend denominator) / (aMinuend denominator)
	! !

!Negativo methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:11'!
substractFromUno: aMinuend

	^PositivoMayorAUno safeWith: 1 - value ! !


!Negativo methodsFor: 'testing' stamp: 'NR 10/1/2018 01:34:37'!
isNegative
	
	^true! !


!classDefinition: #PositivoMayorAUno category: 'Numero-Solution-4'!
EnteroMenosCeroYUno subclass: #PositivoMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!PositivoMayorAUno methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:55:26'!
* aMultiplier 
	
	^aMultiplier multiplyToEnteroMenosUnoYCeroPositivo: self ! !

!PositivoMayorAUno methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:54:03'!
+ anAdder 
	
	^anAdder addToEnteroMenosUnoYCeroPositivo: self.
	! !

!PositivoMayorAUno methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:56:37'!
- anAdder 
	
	^anAdder substractFromEnteroMenosUnoYCeroPositivo: self.
	! !

!PositivoMayorAUno methodsFor: 'arithmetic operations' stamp: 'NR 9/30/2018 21:49:30'!
/ aDivisor 
	
	^aDivisor divideEnteroMenosUnoYCeroPositivo: self! !

!PositivoMayorAUno methodsFor: 'arithmetic operations' stamp: 'NR 9/30/2018 22:48:12'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.

	^ (self - one) fibonacci + (self - two) fibonacci! !


!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:53:47'!
addToEnteroMenosUnoYCeroNegativo: anAdder

	^Entero with: value + anAdder integerValue ! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:02'!
addToEnteroMenosUnoYCeroPositivo: anAdder

	^self class safeWith: value + anAdder integerValue ! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:20'!
addToFraccion: anAdder

	^self + anAdder 
	! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:42'!
addToUno: anAdder 
	
	^self class safeWith: 1 + value ! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 22:09:09'!
asDenominatorOf: aNumerator

	^Fraccion safeWith: aNumerator over: self
! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 21:36:02'!
divideCero: aDividend 
	
	^ aDividend ! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 22:32:03'!
divideEnteroMenosUnoYCeroNegativo: aDividend 
	
	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: self. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	
	^denominator asDenominatorOf: numerator	! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 22:31:36'!
divideEnteroMenosUnoYCeroPositivo: aDividend 
	
 	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: self. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	
	^denominator asDenominatorOf: numerator	 ! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 22:10:20'!
divideFraccion: aDividend

	^aDividend numerator / (aDividend denominator * self) ! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 22:10:30'!
divideUno: aDividend
	
	^Fraccion safeWith: aDividend over: self! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:08'!
multiplyToEnteroMenosUnoYCeroNegativo: aMultiplier

	^Negativo safeWith: value * aMultiplier integerValue ! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:26'!
multiplyToEnteroMenosUnoYCeroPositivo: aMultiplier

	^self class safeWith: value * aMultiplier integerValue ! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:17'!
multiplyToFraccion: aMultiplier

	^self * aMultiplier ! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:52'!
substractFromEnteroMenosUnoYCeroNegativo: aMinuend

	^Negativo safeWith: aMinuend integerValue - value ! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:36'!
substractFromEnteroMenosUnoYCeroPositivo: aMinuend

	^Entero with: aMinuend integerValue - value ! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:02'!
substractFromFraccion: aMinuend

	^aMinuend numerator - (self * aMinuend denominator) / (aMinuend denominator). 
	! !

!PositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:11'!
substractFromUno: aMinuend

	^Entero with: 1 - value ! !


!PositivoMayorAUno methodsFor: 'testing' stamp: 'NR 10/1/2018 01:35:52'!
isNegative
	
	^false! !


!classDefinition: #Uno category: 'Numero-Solution-4'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!Uno methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:33:00'!
* aMultiplier 
	
	^aMultiplier ! !

!Uno methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:54:42'!
+ anAdder 
	
	^anAdder addToUno: self.
	! !

!Uno methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:56:11'!
- anAdder 
	
	^anAdder substractFromUno: self.
	! !

!Uno methodsFor: 'arithmetic operations' stamp: 'HAW 5/3/2017 12:56:15'!
/ aDivisor 
	
	^aDivisor divideUno: self! !

!Uno methodsFor: 'arithmetic operations' stamp: 'HAW 5/2/2017 17:15:00'!
greatestCommonDivisorWith: anEntero 
	
	^self 
	! !


!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:53:47'!
addToEnteroMenosUnoYCeroNegativo: anAdder

	^Entero with: 1 + anAdder integerValue ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:02'!
addToEnteroMenosUnoYCeroPositivo: anAdder

	^PositivoMayorAUno safeWith: 1 + anAdder integerValue ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:20'!
addToFraccion: anAdder

	^ anAdder denominator + anAdder numerator / anAdder denominator ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:42'!
addToUno: anAdder

	^PositivoMayorAUno safeWith: 2! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 17:42:16'!
asDenominatorOf: aNumerator

	^aNumerator ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 16:03:52'!
divideCero: aDividend 
	
	^aDividend ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 19:44:42'!
divideEnteroMenosUnoYCeroNegativo: aDividend

	^aDividend ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 19:44:28'!
divideEnteroMenosUnoYCeroPositivo: aDividend

	^aDividend ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/2/2017 17:57:49'!
divideFraccion: aDividend

	^aDividend ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 16:04:05'!
divideUno: aDividend 
	
	^self! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 22:48:43'!
fibonacci
	
	^ self		! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:08'!
multiplyToEnteroMenosUnoYCeroNegativo: aMultiplier

	^aMultiplier ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:26'!
multiplyToEnteroMenosUnoYCeroPositivo: aMultiplier

	^aMultiplier ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:17'!
multiplyToFraccion: aMultiplier

	^aMultiplier ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:52'!
substractFromEnteroMenosUnoYCeroNegativo: aMinuend

	^Negativo safeWith: aMinuend integerValue - 1  ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:37'!
substractFromEnteroMenosUnoYCeroPositivo: aMinuend

	^Entero with: aMinuend integerValue - 1 ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:02'!
substractFromFraccion: aMinuend

	^ aMinuend numerator - aMinuend denominator / aMinuend denominator ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:11'!
substractFromUno: anAdder

	^Entero with: 0! !


!Uno methodsFor: 'value' stamp: 'HAW 5/2/2017 17:11:39'!
integerValue

	^1! !


!Uno methodsFor: 'testing' stamp: 'NR 10/1/2018 01:33:27'!
isNegative

	^false! !

!Uno methodsFor: 'testing' stamp: 'HAW 5/2/2017 17:22:43'!
isOne

	^true! !

!Uno methodsFor: 'testing' stamp: 'HAW 5/2/2017 17:22:39'!
isZero

	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numero-Solution-4'!
Uno class
	instanceVariableNames: 'uniqueInstance'!

!Uno class methodsFor: 'initialization' stamp: 'HAW 5/3/2017 18:12:13'!
initialize

	uniqueInstance := self basicNew ! !


!Uno class methodsFor: 'instance creation' stamp: 'HAW 5/3/2017 18:11:48'!
new

	^uniqueInstance! !


!classDefinition: #Fraccion category: 'Numero-Solution-4'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Solution-4'!

!Fraccion methodsFor: 'initialization' stamp: 'HAW 5/3/2017 16:16:31'!
initializeSafeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion durante la 
	realizacion del ejercicio, sino por como creacion esto no podria pasar - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:55:17'!
* aMultiplier 
	
	^aMultiplier multiplyToFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:54:20'!
+ anAdder 
	
	^anAdder addToFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NR 9/14/2023 07:56:02'!
- anAdder 
	
	^anAdder substractFromFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 23:06'!
/ aDivisor 
	
	^aDivisor divideFraccion: self! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:53:47'!
addToEnteroMenosUnoYCeroNegativo: anAdder

	^anAdder * denominator + numerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:03'!
addToEnteroMenosUnoYCeroPositivo: anAdder

	^anAdder * denominator + numerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:20'!
addToFraccion: anAdder

	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:54:42'!
addToUno: anAdder 
	
	^ denominator + numerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 16:05:18'!
divideCero: aDividend 
	
	^aDividend ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 22:45:13'!
divideEnteroMenosUnoYCeroNegativo: aDividend

	^aDividend * denominator / numerator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/30/2018 22:45:08'!
divideEnteroMenosUnoYCeroPositivo: aDividend

	^aDividend * denominator / numerator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 23:07'!
divideFraccion: aDividend

	^(aDividend numerator * denominator) / (aDividend denominator * numerator)
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'HAW 5/3/2017 16:14:33'!
divideUno: aDividend 
	
	^denominator / numerator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:08'!
multiplyToEnteroMenosUnoYCeroNegativo: aMultiplier

	^numerator * aMultiplier / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:26'!
multiplyToEnteroMenosUnoYCeroPositivo: aMultiplier

	^numerator * aMultiplier / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:17'!
multiplyToFraccion: aMultiplier

	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:55:52'!
substractFromEnteroMenosUnoYCeroNegativo: aMinuend

	^aMinuend * denominator - numerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:37'!
substractFromEnteroMenosUnoYCeroPositivo: aMinuend

	^aMinuend * denominator - numerator / denominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:02'!
substractFromFraccion: aMinuend

	| newNumerator newDenominator |
	
	newNumerator := (denominator * aMinuend numerator) - (numerator * aMinuend denominator).
	newDenominator := denominator * aMinuend denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'NR 9/14/2023 07:56:11'!
substractFromUno: aMinuend
	
	^ denominator - numerator / denominator ! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'testing' stamp: 'NR 4/24/2021 17:35:56'!
isNegative
	
	^numerator isNegative! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'NR 10/1/2018 09:20:42'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Solution-4'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'instance creation' stamp: 'HAW 5/3/2017 16:15:46'!
safeWith: aNumerator over: aDenominator
 
	^self new initializeSafeWith: aNumerator over: aDenominator ! !

Cero initialize!
Uno initialize!