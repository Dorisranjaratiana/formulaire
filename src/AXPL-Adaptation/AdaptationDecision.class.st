Class {
	#name : 'AdaptationDecision',
	#superclass : 'Object',
	#instVars : [
		'fieldName',
		'shown',
		'reason',
		'context',
		'timestamp'
	],
	#category : 'AXPL-Adaptation',
	#package : 'AXPL-Adaptation'
}

{ #category : 'initialization' }
AdaptationDecision >> initializeWithField: aName shown: aBoolean reason: aString context: aContext [
	fieldName := aName.
	shown := aBoolean.
	reason := aString.
	context := aContext.
	timestamp := DateAndTime now.
	^ self
]
