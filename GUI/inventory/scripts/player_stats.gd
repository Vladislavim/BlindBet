class_name PlayerStats extends Resource
@export var hp : int = 3
@export var max_hp : int = 6
@export var regen_speed : int = 1 # how many hp regen per second/minute/hour/..
@export var luck : int = 1 # or critical dmg
@export var armor : int = 1 # how many dmg points player absorbs per hit
@export var dmg : int = 2 # damage per hit




func change_hp( delta : int ) -> void:
	hp = clampi( hp + delta, 0, max_hp )
	PlayerHud.update_hp( hp, max_hp )
	pass
