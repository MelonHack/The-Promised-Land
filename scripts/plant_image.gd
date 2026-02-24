extends Sprite2D

@onready var thisimg = $'.'
@onready var gameManager = $"../gameManager"
var basic = load("res://assets/plants/basic.tres")
var copper = load("res://assets/plants/copper.tres")
var metal = load("res://assets/plants/metal.tres")
var mechanical = load("res://assets/plants/mechanical.tres")
var yuan = load("res://assets/plants/yuan.tres")
var elderitch = load("res://assets/plants/elderitch.tres")
var angelic = load("res://assets/plants/angelic.tres")
var promised = load("res://assets/plants/promised.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if gameManager.currentPotTier == "Basic Pot":
		thisimg.texture = basic
	elif gameManager.currentPotTier == "Copper Pot":
		thisimg.texture = copper
	elif gameManager.currentPotTier == "Metal Pot":
		thisimg.texture = metal
	elif gameManager.currentPotTier == "Mechanical Pot":
		thisimg.texture = mechanical
	elif gameManager.currentPotTier == "Chinese Yuan Pot":
		thisimg.texture = yuan
	elif gameManager.currentPotTier == "Elderitch Pot of Greed":
		thisimg.texture = elderitch
	elif gameManager.currentPotTier == "Angelic Pot of Light":
		thisimg.texture = angelic
	elif gameManager.currentPotTier == "Pot of the Promised Land":
		thisimg.texture = promised
	
	var pquality = gameManager.plantQuality
	var maxpq = gameManager.mapNextPQuality[gameManager.currentMap]
	update_quality_visual(pquality,maxpq)


func update_quality_visual(quality,max):
	var t = clamp(quality / max, 0.0, 1.0)

	var low_color = Color(0.6, 0.6, 0.6)          # grey
	var high_color = Color(1.2, 0.9, 0.3)        # gold-ish
	modulate = low_color.lerp(high_color, t)
