extends Area2D


const SPEED: int = 800

var out_of_Shooter: bool = false

func _process(delta: float) -> void:
	z_index = -1
	position += transform.x * SPEED * delta


func _on_kill_timeout() -> void:
	queue_free()





func _on_timer_timeout() -> void:
	out_of_Shooter = true










func _on_body_entered(body:Node2D) -> void:
	if out_of_Shooter:
		queue_free()

