extends ItemList

@onready var petAndAccessoriesManager = $"../../../../../../petsAndAccessoriesManager"
@onready var availablePets = petAndAccessoriesManager.availablePets

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	availablePets = petAndAccessoriesManager.availablePets
	for item in availablePets:
		add_item(item)
		
func _physics_process(delta: float) -> void:
	availablePets = petAndAccessoriesManager.availablePets


func _on_map_selection_map_changed() -> void:
	clear()
	for item in availablePets:
		add_item(item)
