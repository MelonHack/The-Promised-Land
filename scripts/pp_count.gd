extends Label

@onready var gameManager = $"../../../../gameManager"
@onready var thislabel = $'.'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var money = gameManager.round_to_dec(gameManager.pp,2)
	thislabel.text = str(money)
