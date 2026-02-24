extends Control

@onready var gameManager = $"../../../../gameManager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_closebutton_pressed() -> void:
	gameManager.gainPauseMultiplier = 1
	
	visible = false
	
	$"../openMenu".disabled = false
	$"../../potSection/pot".disabled = false
	$"../../statsSection/stats".disabled = false
	$"../../truckSection/truck".disabled = false
	$"../../accessoriesSection/accessories".disabled = false
	$"../../petSection/pet".disabled = false
	$"../../mapSection/map".disabled = false
	$"../../fertilizerSection/fertilizer".disabled = false
	$"../../eventSection/event".disabled = false
	$"../../ppDisplay".visible = true


func _on_open_menu_pressed() -> void:
	gameManager.gainPauseMultiplier = 0
	visible = true
	$"../openMenu".disabled = true
	
	$"../../potSection/pot".disabled = true
	$"../../statsSection/stats".disabled = true
	$"../../truckSection/truck".disabled = true
	$"../../accessoriesSection/accessories".disabled = true
	$"../../petSection/pet".disabled = true
	$"../../mapSection/map".disabled = true
	$"../../fertilizerSection/fertilizer".disabled = true
	$"../../eventSection/event".disabled = true
	$"../../ppDisplay".visible = false
