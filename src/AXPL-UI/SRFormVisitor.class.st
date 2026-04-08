Class {
	#name : 'SRFormVisitor',
	#superclass : 'Object',
	#instVars : [
		'formElements',
		'owner'
	],
	#category : 'AXPL-UI',
	#package : 'AXPL-UI'
}

{ #category : 'as yet unclassified' }
SRFormVisitor >> createHelpButtonFor: aDescription [ 
	| helpButton explanationText |
	
	explanationText := aDescription propertyAt: #explanation ifAbsent: [ 'Pas d''explication.' ].
	
	helpButton := owner newButton.
	helpButton 
		icon: (owner iconNamed: #help);
		help: 'Dimension X : Pourquoi ce champ ?';
		action: [ owner application inform: explanationText ].
		
	^ helpButton
]

{ #category : 'as yet unclassified' }
SRFormVisitor >> formElements [
	^ formElements ifNil: [ formElements := OrderedCollection new ]
]

{ #category : 'as yet unclassified' }
SRFormVisitor >> initialize [
	super initialize.
	formElements := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
SRFormVisitor >> owner: aPresenter [
	owner := aPresenter
]

{ #category : 'as yet unclassified' }
SRFormVisitor >> visitNumberDescription: aDescription [
	| row |
	row := SpBoxLayout newLeftToRight spacing: 10.
	row add: (owner newLabel label: aDescription label) width: 120.
	row add: owner newNumberInput.
	formElements add: row
]

{ #category : 'as yet unclassified' }
SRFormVisitor >> visitStringDescription: aDescription [
	| row |
	row := SpBoxLayout newLeftToRight spacing: 10.
	"On fixe la largeur du label à 120 pour aligner les colonnes"
	row add: (owner newLabel label: aDescription label) width: 120.
	"L'input prend tout le reste de la place"
	row add: owner newTextInput.
	formElements add: row
]
