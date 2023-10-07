extends Area2D

var speed: int = 850

func _process(delta):
	position += transform.x * speed * delta



func _on_body_entered(body):
	body.queue_free()
	queue_free()


func _on_timer_timeout():
	queue_free()
