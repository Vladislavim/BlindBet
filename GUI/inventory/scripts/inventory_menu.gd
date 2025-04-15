extends CanvasLayer

signal Invshown
signal Invhidden
var is_inventory : bool = false
var capac : int = 0
@onready var item_description: Label = $Control/ItemDescription
@onready var hp_text: Label = $Control/HP_text
@onready var dmg_text: Label = $Control/DMG_text
@onready var armor_text: Label = $Control/ARMOR_text
@onready var luck_text: Label = $Control/LUCK_text
var cards : InventoryData
var items : InventoryData
var stats : PlayerStats
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
	cards = load("res://PlayerResources/player_cardset.tres")
	items = load("res://PlayerResources/player_inventory.tres")
	stats = load("res://PlayerResources/player_stats.tres")
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

func update_stats() -> void:
	hp_text.text = str(stats.hp)
	dmg_text.text = str(stats.dmg)
	armor_text.text = str(stats.armor)
	luck_text.text = str(stats.luck)
	
