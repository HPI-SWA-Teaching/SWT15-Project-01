object handling
loadObjects: aRPModelClass

	| objects response |
	self connection startup.
	response := self connection execute: ('SELECT * FROM ', (aRPModelClass tableName)).
	self connection terminate.
	response := self transformResponse: response for: aRPModelClass. 
	objects := OrderedCollection new.
	response do:[:each | 
		objects add: (aRPModelClass reconstructObject: each)].
	^ objects