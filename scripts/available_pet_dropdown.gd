extends OptionButton

@onready var petManager = $"../../../../../petsAndAccessoriesManager"
@onready var available_pets = petManager.availablePets
@onready var gameManager = $"../../../../../gameManager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	available_pets = petManager.availablePets
	clear()
	for pet in available_pets:
		add_item(pet)
	if available_pets.size() == 0:
		add_item("none")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass

func update_pet_dropdown():
	available_pets = petManager.availablePets
	clear()
	for pet in available_pets:
		add_item(pet)
	if available_pets.size() == 0:
		add_item("none")


func _on_item_selected(index: int) -> void:
	var selected_pet = get_item_text(index)
	if selected_pet != "" && selected_pet != "none":
		for i in range(4):
			if gameManager.petsOwned[i] == "" || gameManager.petsOwned[i] == "none":
				gameManager.petsOwned[i] = selected_pet
				break
