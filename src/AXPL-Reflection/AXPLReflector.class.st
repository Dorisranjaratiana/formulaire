Class {
	#name : 'AXPLReflector',
	#superclass : 'Object',
	#category : 'AXPL-Reflection',
	#package : 'AXPL-Reflection'
}

{ #category : 'intercession' }
AXPLReflector class >> setComment: aString of: aDescription [
	| oldComment |
	oldComment := aDescription comment.
	
	"Modification réflexive"
	aDescription comment: aString.
	
	"Trace temporelle [t]"
	(aDescription propertyAt: #history ifAbsentPut: [ OrderedCollection new ]) 
		add: (DateAndTime now -> ('Ψ : Explication mise à jour')).
]

{ #category : 'intercession' }
AXPLReflector class >> setLevel: aSymbol of: aDescription [
	| oldLevel |
	oldLevel := aDescription propertyAt: #level ifAbsent: [ #simple ].
	
	"Modification réflexive"
	aDescription propertyAt: #level put: aSymbol.
	
	"Trace temporelle [t]"
	(aDescription propertyAt: #history ifAbsentPut: [ OrderedCollection new ]) 
		add: (DateAndTime now -> ('Ψ : Niveau modifié de ' , oldLevel asString , ' vers ' , aSymbol asString)).
]
