object handling
loadObjectsOf: aRPModelClass

	| jsons objects |	
	jsons := self modelDictionary at: (aRPModelClass name)
				ifAbsent: [self notify:  aRPModelClass name, ' not found!'].
	objects := OrderedCollection new.
	jsons do:[:each | 
			objects add: (aRPModelClass createObject: each)].
	^ objects