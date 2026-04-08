Class {
	#name : 'SRGeneratedForm',
	#superclass : 'SpPresenter',
	#instVars : [
		'formLayout'
	],
	#category : 'AXPL-UI',
	#package : 'AXPL-UI'
}

{ #category : 'as yet unclassified' }
SRGeneratedForm >> configureFor: aContextName model: aModel [ 
	| descriptions visitor buttonLayout spacer |
	
	descriptions := SRFormBuilder new buildDescriptionsFor: aModel context: aContextName.
	
	visitor := SRFormVisitor new.
	visitor owner: self.
	descriptions do: [ :d | d acceptSimpleReneVisitor: visitor ].
	
	formLayout := SpBoxLayout newTopToBottom spacing: 10; borderWidth: 20.
	
	"Ajout des champs"
	visitor formElements do: [ :row | 
		formLayout add: row expand: false ].
	
	"Espace flexible pour pousser les boutons en bas"
	formLayout add: SpBoxLayout newTopToBottom expand: true.

	"Barre de boutons"
	buttonLayout := SpBoxLayout newLeftToRight spacing: 10.
	
	"Le spacer pousse tout vers la droite"
	buttonLayout add: SpBoxLayout newLeftToRight expand: true.
	
	"CORRECTION ICI : On utilise add: avec des paramètres enchaînés"
	buttonLayout add: (self newButton 
		label: 'Annuler'; 
		icon: (self iconNamed: #smallCancel);
		action: [ self delete ]) 
		expand: false 
		fill: false 
		padding: 0.
		
	buttonLayout add: (self newButton 
		label: 'Enregistrer'; 
		icon: (self iconNamed: #smallSave);
		action: [ self inform: 'Données enregistrées !' ]) 
		expand: false 
		fill: false 
		padding: 0.

	formLayout add: buttonLayout expand: false.
	
	self layout: formLayout.
	
	self withWindowDo: [ :window | 
		window title: ('Formulaire médical : ' , aContextName asString capitalized) ].
	
	self update
]

{ #category : 'as yet unclassified' }
SRGeneratedForm >> initializeWindow: aWindowPresenter [
	aWindowPresenter 
		title: 'Formulaire médical';
		initialExtent: 400@300
]
