extends Area2D

var speed = 1000

func _process(delta):
	position += transform.x * speed * delta

