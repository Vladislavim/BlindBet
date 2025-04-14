class_name InventoryUI extends Control

const INVENTORY_SLOT = preload("res://GUI/inventory/inventory_slot.tscn")

@export var data : InventoryData
var active_slot : int = 0
var a : int = 1

func _ready() -> void:

	InventoryMenu.Invshown.connect( build_inventory )
	InventoryMenu.Invhidden.connect( clear_inventory )
	clear_inventory()
	pass

func clear_inventory() -> void:
	for c in get_children():
		c.queue_free()

func build_inventory() -> void:
	for s in data.slots:
		var new_slot = INVENTORY_SLOT.instantiate()
		add_child( new_slot )
		new_slot.slot_data = s
	get_child(active_slot).grab_focus()
	
	pass
func update_inventory() -> void:
	var focused_slot = get_viewport().gui_get_focus_owner()
	var focused_index = -1
	if focused_slot and focused_slot is InventorySlotUI:
		focused_index = get_children().find(focused_slot)
	active_slot = focused_index
	# Обновляем существующие слоты
	for i in range(min(data.slots.size(), get_children().size())):
		get_child(i).slot_data = data.slots[i]

	# Восстанавливаем фокус
	if focused_index != -1 and focused_index < get_children().size():
		get_child(focused_index).grab_focus()
