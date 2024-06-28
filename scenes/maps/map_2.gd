extends Node2D

@onready var player = $Player
@onready var enemies = $Enemies


func _on_door_right_body_entered(body: PhysicsBody2D):
	if enemies.get_child_count() > 0:
		return

	if body.is_in_group("Player"):
		get_tree().call_deferred("change_scene_to_file", "res://scenes/maps/map_3.tscn")


func _on_door_down_body_entered(body: PhysicsBody2D):
	if enemies.get_child_count() > 0:
		return

	if body.is_in_group("Player"):
		get_tree().call_deferred("change_scene_to_file", "res://scenes/maps/map_1.tscn")