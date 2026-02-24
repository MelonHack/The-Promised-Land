extends Button

@onready var gameManager = $"../../../../../../gameManager"
var cost = 800

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var level = gameManager.efficientWiring1
	if level > 0:
		disabled = true


func _on_pressed() -> void:
	if (gameManager.pp >= cost):
		gameManager.pp -= cost
		gameManager.efficientWiring1 += 1
