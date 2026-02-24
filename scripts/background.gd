extends Sprite2D

@onready var thisbg = $'.'
@onready var gameManager = $"../gameManager"
var roadside = load("res://assets/backgrounds/BG_roadside.png")
var city = load("res://assets/backgrounds/BG_city.png")
var grove = load("res://assets/backgrounds/BG_grove.png")
var desert = load("res://assets/backgrounds/BG_desert.png")
var plain = load("res://assets/backgrounds/BG_plain.png")
var hell = load("res://assets/backgrounds/BG_hell.png")
var heaven = load("res://assets/backgrounds/BG_heaven.png")
var thePromisedLand = load("res://assets/backgrounds/BG_thePromisedLand.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if gameManager.currentMap == "Roadside":
		thisbg.texture = roadside
	elif gameManager.currentMap == "City":
		thisbg.texture = city
	elif gameManager.currentMap == "Grove":
		thisbg.texture = grove
	elif gameManager.currentMap == "Desert":
		thisbg.texture = desert
	elif gameManager.currentMap == "Plain":
		thisbg.texture = plain
	elif gameManager.currentMap == "Hell":
		thisbg.texture = hell
	elif gameManager.currentMap == "Heaven":
		thisbg.texture = heaven
	elif gameManager.currentMap == "The Promised Land":
		thisbg.texture = thePromisedLand
