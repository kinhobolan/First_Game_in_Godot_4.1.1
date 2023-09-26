extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -320.0
@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var jump_sound = $JumpSound
@onready var marker_2d = $Node2D/Shotgun/Marker2D


@export var bullets_node2D : Node2D

@onready var node_2d = $Node2D
@onready var shotgun  =$Node2D/Shotgun

var _bullet = preload("res://scenes/bullet.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var cont = 0;

func _ready():
	print("ready")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_sound.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if velocity.x !=0 and is_on_floor():
		animation_player.play("run")
	else:
		animation_player.play("idle")
		
	if !is_on_floor():
		animation_player.play("jump")
		
		
	if velocity.x >= 0:
		sprite_2d.flip_h = false
	else:
		sprite_2d.flip_h = true
		
		

	move_and_slide()
	
	
func _input(event):
	if event is InputEventMouseMotion:
		var mousePos = get_global_mouse_position()
		node_2d.look_at(mousePos)
		
		
		if mousePos.x < node_2d.global_position.x:
			node_2d.scale = Vector2(1,-1)  
		elif mousePos.x > node_2d.global_position.x:
			node_2d.scale = Vector2(1,1)  
			
		
	if Input.is_action_just_pressed("shoot"):
		var bullet = _bullet.instantiate()
		bullets_node2D.add_child(bullet)
		bullet.look_at(get_global_mouse_position())
		bullet.global_position = marker_2d.global_position
		print (get_global_mouse_position())
	
		
		
		
		
