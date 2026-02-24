extends Button

@onready var gameManager = $"../../../../../../../gameManager"
signal fertilizerUsed()
var cost = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if gameManager.pp >= cost:
		gameManager.pp -= cost
		fertilizerUsed.emit()
		disabled = true


func _on_mineral_mix_timer_timeout() -> void:
	disabled = false

func updateFertilizerBuff(isApplying: bool):
	if isApplying:
		gameManager.fertilizerEffectMultiplier += 0.25
		gameManager.waterQuality -= 0.5
		gameManager.fertilizerEffectMultiplier *= gameManager.fertilizerEffectMultiplier
		gameManager.waterQuality *= gameManager.fertilizerEffectMultiplier
	else:
		gameManager.fertilizerEffectMultiplier -= 0.25
		gameManager.waterQuality += 0.5
		gameManager.fertilizerEffectMultiplier /= gameManager.fertilizerEffectMultiplier
		gameManager.waterQuality /= gameManager.fertilizerEffectMultiplier
