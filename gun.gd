extends Node2D


const BULLET = preload("res://Bullet.tscn")


func _process(delta: float) -> void:

	look_at(get_global_mouse_position())

	rotation_degrees = wrap(rotation_degrees, 0, 360)

	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -.2
	else:
		scale.y = .2

	if Input.is_action_just_pressed("Fire"):
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = global_position
		bullet_instance.rotation = rotation
	
