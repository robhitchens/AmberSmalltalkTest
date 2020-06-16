Smalltalk createPackage: 'Playing'!
(Smalltalk packageAt: 'Playing' ifAbsent: [ self error: 'Package not created: Playing' ]) imports: {'amber/web/Web'. 'amber/web/Web-JQuery'. 'silk/Silk'}!
Object subclass: #Playing
	slots: {}
	package: 'Playing'!
!Playing commentStamp!
This class is just a place to mess around with and figure out the Amber smalltalk environment and Helios IDE and try to understand how it works!

!Playing methodsFor: 'action'!

alert: aString after: aNumberOfMilliseconds
	[ Terminal alert: aString ] valueWithTimeout: aNumberOfMilliseconds
!

doAmberWith
	'#output-list' asBrush with: [ :html | html li: 'Amber Web #with: added me!!' ]
!

doConsoleLog
	| greeting target |
	greeting := 'Hello'.
	target := 'world'.
	console log: #{ #greeting -> greeting. #target -> target. #callback -> [ console log: greeting, ', ', target, '!!' ] }
!

doInspectStatus
	(self getApi: '/status')
		then: {#json. #inspect}
		catch: [ :err | 
			console error: err.
			Terminal alert: err ]
!

doJQueryAppend
	'#output-list' asJQuery append: '<li>jQuery append added me!!</li>'
!

doSilkTAG
	'#output-list' asSilk LI: 'Silk TAG: added me!!'
! !

!Playing methodsFor: 'backend'!

endpoint
	"Return something like 'https://<char mess>.execute-api.eu-central-1.amazonaws.com/default'"
	"^ self error: 'Not yet implemented'"
	^ 'http:localhost:4000'
!

getApi: path
	 ^ Platform fetch: self endpoint, path
!

showMessage: message
	Transcript show: message
! !

!Playing methodsFor: 'starting'!

augmentPage
	| bodyRef |
	bodyRef := ('body' asDomNode asJQuery).
    '#lambda-status' asSilk on: #click bind: [ self doInspectStatus ].
	'#console-log' asSilk on: #click bind: [ self doConsoleLog ].
	'#timeout-alert' asSilk on: #click bind: [ self alert: 'REMINDER!!' after: 5000 ].
	'#amber-with' asBrush onClick: [ self doAmberWith ].
	'#silk-tag' asSilk on: #click bind: [ self doSilkTAG ].
	'#jquery-append' asJQuery click: [ self doJQueryAppend ].
	bodyRef html: ('<p>Some text appended from Amber</p>').
	('body' asDomNode) asJQuery append: '<button id="showMessage">Hello from the UI</button>'.
	'#showMessage' asJQuery click: [ self showMessage: 'Hello from the UI' ]
! !

!Playing class methodsFor: 'starting'!

start
	self new augmentPage
! !

