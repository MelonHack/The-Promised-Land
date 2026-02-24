extends Node2D

var availablePets = []
@onready var gameManager = $"../gameManager"
@onready var maprn = gameManager.currentMap

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maprn = gameManager.currentMap
	if maprn == "Grove":
		availablePets = ["fox","goat"]
	elif maprn == "Desert":
		availablePets = ["pixie"]
	elif maprn == "Plain":
		availablePets = ["cow","bear"]
	elif maprn == "Hell" :
		availablePets = ["skeleton","demon"]
	elif maprn == "Heaven":
		availablePets = ["angel","Kobe Bryant"]
	elif maprn == "The Promised Land":
		availablePets = ["The Plant"]
	else:
		availablePets = []


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	checkAvailablePets()
	

func checkAvailablePets():
	maprn = gameManager.currentMap
	if maprn == "Grove":
		availablePets = ["fox","goat"]
	elif maprn == "Desert":
		availablePets = ["pixie"]
	elif maprn == "Plain":
		availablePets = ["cow","bear"]
	elif maprn == "Hell" :
		availablePets = ["skeleton","demon"]
	elif maprn == "Heaven":
		availablePets = ["angel","Kobe Bryant"]
	elif maprn == "The Promised Land":
		availablePets = ["The Plant"]
	else:
		availablePets = []
