Smalltalk createPackage: 'Playing-Tests'!
TestCase subclass: #PlayingTest
	slots: {}
	package: 'Playing-Tests'!

!PlayingTest methodsFor: 'as yet unclassified'!

testShowMessage
	| playing |
	playing := Playing new.
	playing showMessage: 'Hello from test'.
! !

