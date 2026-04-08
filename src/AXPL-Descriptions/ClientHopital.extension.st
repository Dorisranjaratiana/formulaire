Extension { #name : 'ClientHopital' }

{ #category : '*AXPL-Descriptions' }
ClientHopital >> descriptionAge [
	<simpleReneDescription>
	^ SRNumberDescription new
		accessor: #age;
		label: 'Âge';
		comment: 'Âge chronologique du patient';
		propertyAt: #level put: #simple;
		propertyAt: #history put: OrderedCollection new;
		yourself
]

{ #category : '*AXPL-Descriptions' }
ClientHopital >> descriptionAllergies [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #allergies;
		label: 'Allergies';
		comment: 'Données médicales critiques (accès restreint)';
		propertyAt: #level put: #expert;
		propertyAt: #history put: OrderedCollection new;
		yourself
]

{ #category : '*AXPL-Descriptions' }
ClientHopital >> descriptionChambre [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #chambre;
		label: 'Chambre';
		comment: 'Localisation actuelle dans le service';
		propertyAt: #level put: #base;
		propertyAt: #history put: OrderedCollection new;
		yourself
]

{ #category : '*AXPL-Descriptions' }
ClientHopital >> descriptionNom [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #nom;
		label: 'Nom du patient';
		comment: 'Nom légal enregistré à l admission';
		propertyAt: #level put: #simple;
		propertyAt: #history put: OrderedCollection new;
		yourself
]

{ #category : '*AXPL-Descriptions' }
ClientHopital >> descriptionPrenom [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #prenom;
		label: 'Prénom du patient';
		comment: 'Prénom usuel du patient';
		propertyAt: #level put: #simple;
		propertyAt: #history put: OrderedCollection new;
		yourself
]
