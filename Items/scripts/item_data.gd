class_name ItemData extends Resource

@export var name : String = ""
@export_multiline var description : String = ""
@export var texture : Texture2D
# card/item
@export var type : String = ""
#spades/crosses/diamonds/hearts
@export var cardtype : String = ""
# 2 - A
@export var cardvalue : int = 2

func use():
	if (type == "Heal"):
		print("heal")

func card_buff() -> void:
	match cardtype:
		"diamonds":
			InventoryMenu.stats.luck += cardvalue
		"crosses":
			InventoryMenu.stats.armor += cardvalue
		"spades":
			InventoryMenu.stats.dmg += cardvalue
		"hearts":
			InventoryMenu.stats.hp += cardvalue
			InventoryMenu.stats.max_hp += cardvalue
			PlayerHud.update_hp(InventoryMenu.stats.hp,InventoryMenu.stats.max_hp)

func card_debuff() -> void:
	match cardtype:
		"diamonds":
			InventoryMenu.stats.luck += cardvalue
		"crosses":
			InventoryMenu.stats.armor += cardvalue
		"spades":
			InventoryMenu.stats.dmg -= cardvalue
		"hearts":
			InventoryMenu.stats.hp -= cardvalue
			InventoryMenu.stats.max_hp -= cardvalue
			PlayerHud.update_hp(InventoryMenu.stats.hp,InventoryMenu.stats.max_hp)
