extends Label

@onready var gameManager = $"../../../../../gameManager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text ="Fertilizer Effect Multiplier: " + str(gameManager.fertilizerEffectMultiplier) + "\n"
	text +="Reverse Harmful Gas: " + str(gameManager.reverseDebuff) + "\n"
	text +="Harmful Gas Release Multiplier: " + str(gameManager.harmfulGasReleaseMultiplier) + "\n"
	text +="Light Quality: " + str(gameManager.round_to_dec((gameManager.lightQuality),2)) + "\n"
	text += "PP Gain per Second: " + str(gameManager.round_to_dec((gameManager.amountGained),2)) + "\n"
	text +="Plant Quality: " + str(gameManager.round_to_dec((gameManager.plantQuality),2))


func _on_details_pressed() -> void:
	visible = !visible
