extends Label

@onready var thislabel = $"."
@onready var gameManager = $"../../../../../gameManager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	thislabel.text = "Special Customer Rate Multiplier: " + str(gameManager.specialCustomerRateMultiplier) + "\n"
	thislabel.text += "PP Gain Rate Multiplier: " + str(gameManager.ppGainRateMultiplier) + "\n"
	thislabel.text +="Special Customer Request Level: " + str(gameManager.specialCustomerRequestLevel) + "\n"
	thislabel.text +="PP: " + str(gameManager.round_to_dec((gameManager.pp),2)) + "\n"
	thislabel.text +="Water Quality: " + str(gameManager.round_to_dec((gameManager.waterQuality),2)) + "\n"
	thislabel.text +="Current Map: " + str(gameManager.currentMap) + "\n"
	thislabel.text +="Truck Level: " + str(gameManager.researchCount) + "\n"
	thislabel.text +="PP Gain Multiplier: " + str(gameManager.ppGainMultiplier) + "\n"
	thislabel.text +="Electricity Cost Multiplier: " + str(gameManager.electricityCostMultiplier) + "\n"
	thislabel.text +="Gamble Luck: " + str(gameManager.gambleLuck)
	
func _on_details_pressed() -> void:
	thislabel.visible = !thislabel.visible
