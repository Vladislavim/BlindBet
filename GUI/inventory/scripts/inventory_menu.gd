extends CanvasLayer

signal Invshown
signal Invhidden
var is_inventory : bool = false
var capac : int = 0
@onready var item_description: Label = $Control/ItemDescription

func show_inventory() -> void:
	get_tree().paused = true
	visible = true
	is_inventory = true
	Invshown.emit()



func hide_inventory() -> void:

	get_tree().paused = false
	visible = false
	is_inventory = false
	Invhidden.emit()

func update_item_description( new_text : String ) -> void:
	item_description.text = new_text


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_inventory()
	pass # Replace with function body.
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory") and !PauseMenu.is_paused:	
		if is_inventory == false:
			show_inventory()
		else:
			hide_inventory()
	elif event.is_action_pressed("pause") and is_inventory == true:
		hide_inventory()
		get_viewport().set_input_as_handled()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
