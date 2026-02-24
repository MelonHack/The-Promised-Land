extends Button

@onready var gameManager = $"../../../../gameManager"
var sunny = load("res://assets/weather/sunny.png")
var rain = load("res://assets/weather/rain.png")
var storm = load("res://assets/weather/storm.png")
var drought = load("res://assets/weather/drought.png")
var toxicWind = load("res://assets/weather/toxicWind.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if gameManager.weather == "sunny":
		icon = sunny
	elif gameManager.weather == "rain":
		icon = rain
	elif gameManager.weather == "storm":
		icon = storm
	elif gameManager.weather == "drought":
		icon = drought
	elif gameManager.weather == "toxic wind":
		icon = toxicWind
