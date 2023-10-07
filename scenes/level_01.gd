extends Node2D



func _on_area_2d_body_entered(body):	
#	get_tree().change_scene_to_file("res://scenes/level_01.tscn")
	print("Morreu")



func _on_next_level_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/level_02.tscn")
	
