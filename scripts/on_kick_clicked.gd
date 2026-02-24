extends Node2D

@onready var gameManager = $"../../../../gameManager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func kick(index: int):
	gameManager.petsOwned[index] = ""

func _on_closepet_4_pressed() -> void:
	kick(3)


func _on_closepet_3_pressed() -> void:
	kick(2)


func _on_closepet_2_pressed() -> void:
	kick(1)


func _on_closepet_1_pressed() -> void:
	kick(0)
