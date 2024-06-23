extends Node2D

@onready var player = $Player

func _on_door_right_body_entered(body: PhysicsBody2D):
	if body.is_in_group("Player"):
		get_tree().call_deferred("change_scene_to_file", "res://scenes/maps/map_start.tscn")
