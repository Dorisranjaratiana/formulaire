Class {
	#name : 'ExpertContext',
	#superclass : 'AXPLContext',
	#category : 'AXPL-Adaptation',
	#package : 'AXPL-Adaptation'
}

{ #category : 'accessing' }
ExpertContext >> allowedLevels [ ^ #(#simple #base #expert)
]
