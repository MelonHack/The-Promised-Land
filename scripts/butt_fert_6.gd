extends Button

@onready var gameManager = $"../../../../../../../gameManager"
signal fertilizerUsed()
var cost = 15000

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


func _on_celestial_infusion_timer_timeout() -> void:
	disabled = false

func updateFertilizerBuff(isApplying: bool):
	if isApplying:
		gameManager.ppGainMultiplier += 0.8
		gameManager.lightQuality += 2
		gameManager.baseHarmfulGas += 10
		gameManager.electricityCostMultiplier += 0.15
		gameManager.ppGainMultiplier *= gameManager.fertilizerEffectMultiplier
		gameManager.lightQuality *= gameManager.fertilizerEffectMultiplier
		gameManager.baseHarmfulGas *= gameManager.fertilizerEffectMultiplier
		gameManager.electricityCostMultiplier *= gameManager.fertilizerEffectMultiplier
	else:
		gameManager.ppGainMultiplier -= 0.8
		gameManager.lightQuality -= 2
		gameManager.baseHarmfulGas -= 10
		gameManager.electricityCostMultiplier -= 0.15
		gameManager.ppGainMultiplier /= gameManager.fertilizerEffectMultiplier
		gameManager.lightQuality /= gameManager.fertilizerEffectMultiplier
		gameManager.baseHarmfulGas /= gameManager.fertilizerEffectMultiplier
		gameManager.electricityCostMultiplier /= gameManager.fertilizerEffectMultiplier
