extends Button

@onready var gameManager = $"../../../../../../../gameManager"
signal fertilizerUsed()
var cost = 1200

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


func _on_nitrogen_rush_timer_timeout() -> void:
	disabled = false

func updateFertilizerBuff(isApplying: bool):
	if isApplying:
		gameManager.ppGainMultiplier += 0.4
		gameManager.baseHarmfulGas += 5
		gameManager.ppGainMultiplier *= gameManager.fertilizerEffectMultiplier
		gameManager.baseHarmfulGas *= gameManager.fertilizerEffectMultiplier
	else:
		gameManager.ppGainMultiplier -= 0.4
		gameManager.baseHarmfulGas -= 5
		gameManager.ppGainMultiplier /= gameManager.fertilizerEffectMultiplier
		gameManager.baseHarmfulGas /= gameManager.fertilizerEffectMultiplier
