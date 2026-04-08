Extension { #name : 'SRDescription' }

{ #category : '*AXPL-Adaptation' }
SRDescription >> adaptForContext: aContext [
	| currentLevel isAllowed decision |
	
	"1. On récupère le niveau du champ (Défaut: simple)"
	currentLevel := self propertyAt: #level ifAbsent: [ #simple ].
	
	"2. On vérifie si le contexte autorise ce niveau (Dimension A)"
	isAllowed := aContext allowedLevels includes: currentLevel.
	
	"3. On crée la justification (Dimension X)"
	decision := AdaptationDecision new 
		initializeWithField: self label
		shown: isAllowed
		reason: (isAllowed 
			ifTrue: [ 'Champ autorisé pour le niveau ' , currentLevel asString ]
			ifFalse: [ 'Accès restreint : niveau ' , currentLevel asString , ' requis.' ])
		context: aContext class name.

	"4. On stocke la décision et on trace l historique (Dimension [t])"
	self propertyAt: #lastDecision put: decision.
	(self propertyAt: #history ifAbsentPut: [ OrderedCollection new ]) 
		add: (DateAndTime now -> ('Filtrage effectué par ' , aContext class name)).

	^ isAllowed
]
