extends Area2D

var speed: int = 850

func _process(delta):
	position += transform.x * speed * delta

