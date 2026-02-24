extends Control

@onready var thisInterface = $'.'
@onready var gameManager = $"../../../../gameManager"
signal mapChanged()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass


func _on_map_pressed() -> void:
	thisInterface.visible = !thisInterface.visible
	#disable all buttons that are not purchase and close
	$"../../potSection/pot".disabled = !$"../../potSection/pot".disabled
	$"../../statsSection/stats".disabled = !$"../../statsSection/stats".disabled
	$"../../truckSection/truck".disabled = !$"../../truckSection/truck".disabled
	$"../../accessoriesSection/accessories".disabled = !$"../../accessoriesSection/accessories".disabled
	$"../../petSection/pet".disabled = !$"../../petSection/pet".disabled
	$"../../fertilizerSection/fertilizer".disabled = !$"../../fertilizerSection/fertilizer".disabled
	$"../../eventSection/event".disabled = !$"../../eventSection/event".disabled
	$"../../startMenu/openMenu".disabled = !$"../../startMenu/openMenu".disabled
	$"../../ppDisplay".visible = !$"../../ppDisplay".visible

func _on_roadside_pressed() -> void:
	gameManager.currentMap = "Roadside"
	emit_signal("mapChanged")
	


func _on_city_pressed() -> void:
	gameManager.currentMap = "City"
	emit_signal("mapChanged")
	


func _on_grove_pressed() -> void:
	gameManager.currentMap = "Grove"
	emit_signal("mapChanged")


func _on_desert_pressed() -> void:
	gameManager.currentMap = "Desert"
	emit_signal("mapChanged")

func _on_plain_pressed() -> void:
	gameManager.currentMap = "Plain"
	emit_signal("mapChanged")

func _on_hell_pressed() -> void:
	gameManager.currentMap = "Hell"
	emit_signal("mapChanged")

func _on_heaven_pressed() -> void:
	gameManager.currentMap = "Heaven"
	emit_signal("mapChanged")

func _on_the_promised_land_pressed() -> void:
	gameManager.currentMap = "The Promised Land"
	emit_signal("mapChanged")
