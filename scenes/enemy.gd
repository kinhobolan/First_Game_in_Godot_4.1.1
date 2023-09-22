extends CharacterBody2D

@export var path_fallow : PathFollow2D = get_parent()

@export var speed : float

@onready var animated_sprite_2d = $AnimatedSprite2D

var past_x = null

func _physics_process(delta):
	
	if past_x != null:
		if global_position.x <= past_x:
			animated_sprite_2d.flip_h = false;
		else:
			animated_sprite_2d.flip_h = true;
	
	past_x = global_position.x
		
	if path_fallow:
		path_fallow.progress_ratio += speed * delta
	
