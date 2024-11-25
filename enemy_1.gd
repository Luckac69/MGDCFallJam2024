extends CharacterBody2D



@export var speed : int = 200

var player_position
var health : int = 100
var direction: Vector2 = Vector2.ZERO

@onready var player =\
		get_parent().get_parent().get_node("MainCharacter")

var chase: bool = false

func _physics_process(delta: float) -> void:
	
	player_position = player.position

	if chase:
		direction = (player_position - position).normalized()
		pass
	else: 
		direction = Vector2.ZERO
	
	move_and_collide(direction * speed * delta)



func is_dead() -> bool:
	if health < 0:
		return true
	return false



func _on_hit_box_area_entered(area: Area2D) -> void:
	health -= 10
	if is_dead():
		queue_free()




func _on_detection_area_body_entered(body:Node2D) -> void:
	if body.is_in_group("Player"):
		chase = true

func _on_detection_area_body_exited(body:Node2D) -> void:
	if body.is_in_group("Player"):
		chase = false
