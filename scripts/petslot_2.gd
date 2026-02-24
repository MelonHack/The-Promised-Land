extends Button

var isEmpty = true
@onready var gameManager = $"../../../../../gameManager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var petInThisSlot = gameManager.petsOwned[1]
	if petInThisSlot == "":
		icon = load("res://assets/pets/missing.png")
	elif petInThisSlot == "cow":
		icon = load("res://assets/pets/Cow.png")
	elif petInThisSlot == "fox":
		icon = load("res://assets/pets/fox.tres")
	elif petInThisSlot == "pixie":
		icon = load("res://assets/pets/pixie.tres")
	elif petInThisSlot == "goat":
		icon = load("res://assets/pets/goat.tres")
	elif petInThisSlot == "bear":
		icon = load("res://assets/pets/bear.tres")
	elif petInThisSlot == "skeleton":
		icon = load("res://assets/pets/skele.tres")
	elif petInThisSlot == "demon":
		icon = load("res://assets/pets/demon.tres")
	elif petInThisSlot == "angel":
		icon = load("res://assets/pets/angel.tres")
	elif petInThisSlot == "Kobe Bryant":
		icon = load("res://assets/pets/kobe.tres")
	elif petInThisSlot == "The Plant":
		icon = load("res://assets/pets/thePlant.tres")
