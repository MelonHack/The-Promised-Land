extends ProgressBar

@onready var gameManager = $"../../../../../../../gameManager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	min_value = gameManager.mapUnlockPQuality[gameManager.currentMap]
	value = gameManager.plantQuality
	max_value = gameManager.mapNextPQuality[gameManager.currentMap]
