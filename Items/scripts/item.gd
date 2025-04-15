extends Area2D

@export var item_data : ItemData 
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = item_data.texture
	area_entered.connect(_on_area_entered)
	pass # Replace with function body.
func _on_area_entered(area: Node) -> void:
	var data : InventoryData = load("res://PlayerResources/player_inventory.tres")
	data.add_item(item_data)
	queue_free()  # Удаляем предмет с карты
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
