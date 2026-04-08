Class {
	#name : 'SRFormApp',
	#superclass : 'SpPresenter',
	#instVars : [
		'levelDropList',
		'generateButton'
	],
	#category : 'AXPL-UI',
	#package : 'AXPL-UI'
}

{ #category : 'as yet unclassified' }
SRFormApp >> defaultLayout [
	^ SpBoxLayout newTopToBottom
		spacing: 15;
		borderWidth: 20; "Correction : borderWidth au lieu de margin"
		add: (self newLabel label: 'Niveau d''accès requis :') expand: false;
		add: levelDropList expand: false;
		add: generateButton expand: false;
		yourself
]

{ #category : 'as yet unclassified' }
SRFormApp >> generateForm [
	| view |
	view := SRGeneratedForm new.
	view configureFor: levelDropList selectedItem model: ClientHopital new.
	view open
]

{ #category : 'as yet unclassified' }
SRFormApp >> initializePresenters [
	levelDropList := self newDropList.
	levelDropList items: #( 'Simple' 'Base' 'Expert' ).
	
	generateButton := self newButton.
	generateButton 
		label: 'Générer la vue AXPL';
		icon: (self iconNamed: #smallLoad);
		action: [ self generateForm ]
]

{ #category : 'as yet unclassified' }
SRFormApp >> initializeWindow: aWindowPresenter [ [
	aWindowPresenter title: 'AXPL Gouvernance'; initialExtent: 350@200 ]
]
