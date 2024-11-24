extends Area2D


const SPEED: int = 800

	

func _process(delta: float) -> void:
	position += transform.x * SPEED * delta


func _on_kill_timeout() -> void:
	self.get_parent().remove_child(self)
