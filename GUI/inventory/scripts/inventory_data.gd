class_name InventoryData extends Resource

@export var slots : Array[ SlotData ]






func add_item(item : ItemData) -> bool:
	var i : int = 0
	var success : bool = false
	for s in slots:
		if !s == null:
			if s.item_data.name == item.name and s.item_data.cardtype == item.cardtype and s.item_data.cardvalue == item.cardvalue: 
				s.quantity+=1
				success = true
				break
		else :
			var item1 : SlotData
			item1 = SlotData.new()
			item1.init(item,1)
			slots[i] = item1
			success = true
			break
		i+=1
	return success

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
