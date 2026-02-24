extends ColorRect

@onready var thistab = $'.'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pet_pressed() -> void:
	if thistab.visible:
		thistab.visible = !thistab.visible

func _on_petslot_1_pressed() -> void:
	if !thistab.visible:
		thistab.visible = !thistab.visible
	if !$"../petTab/petslot1".isEmpty:
		$filledOption.visible = true
	else:
		$emptyOption.visible = true


func _on_petslot_2_pressed() -> void:
	if !thistab.visible:
		thistab.visible = !thistab.visible
	if !$"../petTab/petslot2".isEmpty:
		$filledOption.visible = true
	else:
		$emptyOption.visible = true


func _on_petslot_3_pressed() -> void:
	if !thistab.visible:
		thistab.visible = !thistab.visible
	if !$"../petTab/petslot3".isEmpty:
		$filledOption.visible = true
	else:
		$emptyOption.visible = true


func _on_petslot_4_pressed() -> void:
	if !thistab.visible:
		thistab.visible = !thistab.visible
	if !"../petTab/petslot4".isEmpty:
		$filledOption.visible = true
	else:
		$emptyOption.visible = true


func _on_close_pressed() -> void:
	thistab.visible = false
	$filledOption.visible = false
	$emptyOption.visible = false
