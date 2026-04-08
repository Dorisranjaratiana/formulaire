Class {
	#name : 'ClientHopital',
	#superclass : 'Object',
	#instVars : [
		'nom',
		'prenom',
		'age',
		'chambre',
		'allergies'
	],
	#category : 'AXPL-Core',
	#package : 'AXPL-Core'
}

{ #category : 'accessing' }
ClientHopital >> age [ ^ age
]

{ #category : 'accessing' }
ClientHopital >> age: anObject [ age := anObject
]

{ #category : 'accessing' }
ClientHopital >> allergies [ ^ allergies
]

{ #category : 'accessing' }
ClientHopital >> allergies: anObject [ allergies := anObject
]

{ #category : 'accessing' }
ClientHopital >> chambre [ ^ chambre
]

{ #category : 'accessing' }
ClientHopital >> chambre: anObject [ chambre := anObject
]

{ #category : 'initialization' }
ClientHopital >> initialize [ 
	super initialize.
	nom := 'Dupont'.
	prenom := 'Jean'.
	age := 45.
	chambre := 'A-102'.
	allergies := 'Pénicilline'.
]

{ #category : 'accessing' }
ClientHopital >> nom [ ^ nom
]

{ #category : 'accessing' }
ClientHopital >> nom: anObject [ nom := anObject
]

{ #category : 'accessing' }
ClientHopital >> prenom [ ^ prenom
]

{ #category : 'accessing' }
ClientHopital >> prenom: anObject [ prenom := anObject
]

{ #category : 'as yet unclassified' }
ClientHopital >> simpleReneDescription [
	| container |
	container := SRPriorityContainer new.
	container label: 'Client Hopital'.
	
	"IMPORTANT : Utilise add: pour remplir la collection children"
	container add: ((SRStringDescription new label: 'Nom du Patient')
		propertyAt: #visibleContexts put: #(#Simple #Base #Expert);
		yourself).
		
	container add: ((SRNumberDescription new label: 'Âge')
		propertyAt: #visibleContexts put: #(#Base #Expert);
		yourself).
		
	^ container
]
