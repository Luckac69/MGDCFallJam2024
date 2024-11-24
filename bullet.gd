extends Area2D


const SPEED: int = 800

var out_of_Shooter: bool = false

func _process(delta: float) -> void:
	z_index = -1
	position += transform.x * SPEED * delta


func _on_kill_timeout() -> void:
	queue_free()

func _on_body_entered(body:Node2D) -> void:
	if body.is_in_group("Player"):
		pass
	else:
		queue_free()
