extends ColorRect

@onready var thistab = $'.'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_truck_pressed() -> void:
	thistab.visible = true
	#disable all buttons that are not purchase and close
	$"../../potSection/pot".disabled = true
	$"../../statsSection/stats".disabled = true
	$"../truck".disabled = true
	$"../../accessoriesSection/accessories".disabled = true
	$"../../petSection/pet".disabled = true
	$"../../mapSection/map".disabled = true
	$"../../fertilizerSection/fertilizer".disabled = true
	$"../../eventSection/event".disabled = true
	$"../../startMenu/openMenu".disabled = true
	$"../../ppDisplay".visible = false

func _on_closebutton_pressed() -> void:
	thistab.visible = false
	#reenables all buttons that are not purchase and close
	$"../../potSection/pot".disabled = false
	$"../../statsSection/stats".disabled = false
	$"../truck".disabled = false
	$"../../accessoriesSection/accessories".disabled = false
	$"../../petSection/pet".disabled = false
	$"../../mapSection/map".disabled = false
	$"../../fertilizerSection/fertilizer".disabled = false
	$"../../eventSection/event".disabled = false
	$"../../startMenu/openMenu".disabled = false
	$"../../ppDisplay".visible = true
