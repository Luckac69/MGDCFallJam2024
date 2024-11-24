extends CharacterBody2D



@export var speed : int = 200

var player_position
var health : int = 100
var direction: Vector2 = Vector2.ZERO

@onready var player = get_parent().get_node("MainCharacter")


func _physics_process(delta: float) -> void:
	
	player_position = player.position

	direction = (player_position - position).normalized()\
			* speed * delta
	
	move_and_collide(direction)



func is_dead() -> bool:
	if health < 0:
		return true
	return false



func _on_hit_box_area_entered(area: Area2D) -> void:
	health -= 10
	if is_dead():
		queue_free()
