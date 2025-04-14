class_name InventoryData extends Resource

@export var slots : Array[ SlotData ]
@export var hp : int 
@export var max_hp : int


func update_hp( delta : int ) -> void:
	hp = clampi( hp + delta, 0, max_hp )
	PlayerHud.update_hp( hp, max_hp )
	pass


func add_item(item : ItemData) -> void:
	var i : int = 0
	for s in slots:
		if !s == null:
			if s.item_data.name == item.name: 
				s.quantity+=1
				break
		else :
			var item1 : SlotData
			item1 = SlotData.new()
			item1.init(item,1)
			slots[i] = item1
			break
		i+=1
	pass

func remove_item(slot : int) -> void:
	var i : int = 0
	for s in slots:
		if i == slot and s!=null:
			if s.quantity > 1: 
				s.quantity -= 1
			else: 
				slots[slot] = null
		i+=1
	pass

func use_item(slot : int) -> void:
	var i : int = 0
	for s in slots:
		if i == slot and s!=null:
			s.item_data.use()
		i+=1
	pass
