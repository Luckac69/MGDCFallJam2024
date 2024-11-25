extends CharacterBody2D


var direction = Vector2.ZERO
var friction = .05

@export var speed = 400

@export var inv: Inv

func get_input():
	set_process_unhandled_input(false)
	direction = \
			lerp(direction,\
			Input.get_vector("Left", "Right", "Up", "Down"),\
			friction)
	

func _physics_process(delta: float) -> void:

	get_input()
	if(direction == Vector2.ZERO):
		velocity = lerp(velocity, direction * speed,friction)
	else:
		velocity = lerp(velocity, direction * speed,1)
	

	move_and_slide()

