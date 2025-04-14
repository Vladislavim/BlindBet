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
