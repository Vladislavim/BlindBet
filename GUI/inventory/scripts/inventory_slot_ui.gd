class_name InventorySlotUI extends Button


var slot_data : SlotData : set = set_slot_data
var type : String #items/cards
@onready var texture_rect: TextureRect = $TextureRect
@onready var label: Label = $Label
@onready var card_slots: InventoryUI = $"../../../../Control2/PanelContainer/CardSlots"
@onready var inventory_slots: InventoryUI = $"../../../../Control/PanelContainer/InventorySlots"
var cards : InventoryData
var items : InventoryData
var par : InventoryUI


func _ready() -> void:
	par = get_parent()
	cards = load("res://GUI/inventory/player_cardset.tres")
	items = load("res://GUI/inventory/player_inventory.tres")
	if par.name == "CardSlots":
		type = "cards"
	elif par.name == "InventorySlots":
		type = "items"
	texture_rect.texture = null
	label.text = ""
	focus_entered.connect( item_focused )
	focus_exited.connect( item_unfocused )
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	button_down.connect(_on_button_down)
	pressed.connect(item_pressed)

func _on_button_down() -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		item_pressed()
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		item_right_clicked()
		
func item_pressed() -> void:
	if slot_data != null:
		if type == "items" :
			if slot_data.item_data.type == "card":
				print("inv->cards")
				cards.add_item(slot_data.item_data)
				items.remove_item(get_index())
				par.update_inventory()
				card_slots.update_inventory()
				InventoryMenu.update_item_description("")
			else:
				par.data.use_item(get_index()) 
				par.update_inventory()
		elif type == "cards":
			print("cards->inv")
			items.add_item(slot_data.item_data)
			cards.remove_item(get_index())
			par.update_inventory()
			inventory_slots.update_inventory()
			InventoryMenu.update_item_description("")
	pass


func item_right_clicked() -> void:
	par.data.remove_item(get_index())
	par.update_inventory()
	# Ваша логика для ПКМ (например, контекстное меню)
func _on_mouse_entered() -> void:
	pass

func _on_mouse_exited() -> void:
	pass
		
func set_slot_data( value : SlotData ) -> void:
	slot_data = value
	if slot_data == null:
		# Очищаем отображение
		texture_rect.texture = null
		label.text = ""
		return
	texture_rect.texture = slot_data.item_data.texture
	label.text = str( slot_data.quantity )


func item_focused() -> void:
	par.active_slot = par.get_children().find(self)
	if slot_data != null:
		if slot_data.item_data != null:
			InventoryMenu.update_item_description( slot_data.item_data.description )
	pass


func item_unfocused() -> void:
	InventoryMenu.update_item_description( "" )
	pass
