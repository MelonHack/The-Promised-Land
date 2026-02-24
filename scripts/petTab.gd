extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass


func _on_pet_pressed() -> void:
	visible = true
	#disable all buttons that are not purchase and close
	$"../../potSection/pot".disabled = true
	$"../../statsSection/stats".disabled = true
	$"../../truckSection/truck".disabled = true
	$"../../accessoriesSection/accessories".disabled = true
	$"../pet".disabled = true
	$"../../mapSection/map".disabled = true
	$"../../fertilizerSection/fertilizer".disabled = true
	$"../../eventSection/event".disabled = true
	$"../../startMenu/openMenu".disabled = true
	$"../../ppDisplay".visible = false


func _on_closebutton_pressed() -> void:
	visible = false
	
	$"../../potSection/pot".disabled = false
	$"../../statsSection/stats".disabled = false
	$"../../truckSection/truck".disabled = false
	$"../../accessoriesSection/accessories".disabled = false
	$"../pet".disabled = false
	$"../../mapSection/map".disabled = false
	$"../../fertilizerSection/fertilizer".disabled = false
	$"../../eventSection/event".disabled = false
	$"../../startMenu/openMenu".disabled = false
	$"../../ppDisplay".visible = true
