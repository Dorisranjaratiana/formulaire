Class {
	#name : 'SRFormBuilder',
	#superclass : 'Object',
	#category : 'AXPL-UI',
	#package : 'AXPL-UI'
}

{ #category : 'as yet unclassified' }
SRFormBuilder >> buildDescriptionsFor: aModel context: aContextName [ 
    | targetContext |
    "On s'assure que le contexte est un Symbole"
    targetContext := aContextName asSymbol.
    
    ^ aModel simpleReneDescription children select: [ :d | 
        | contexts |
        "On récupère la liste des contextes (vide par défaut)"
        contexts := d propertyAt: #visibleContexts ifAbsent: [ #() ].
        
        "On vérifie si targetContext est présent dans la liste"
        contexts asOrderedCollection anySatisfy: [ :ctx | ctx asSymbol = targetContext ] ]
]
