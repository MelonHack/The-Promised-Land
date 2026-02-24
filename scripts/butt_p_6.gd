extends Button

@onready var gameManager = $"../../../../../../../gameManager"
var cost = 9000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if gameManager.pp >= cost:
		gameManager.pp -= cost
		gameManager.currentPotTier = "Elderitch Pot of Greed"
		disabled = true
