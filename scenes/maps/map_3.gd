extends Node2D

@onready var player = $Player
@onready var enemies = $Enemies


func _on_door_up_body_entered(body: PhysicsBody2D):
    if enemies.get_child_count() > 0:
        return

    if body.is_in_group("Player"):
        self.get_tree().change_scene_to_file("res://scenes/maps/map_4.tscn")


func _on_door_left_body_entered(body: PhysicsBody2D):
    if enemies.get_child_count() > 0:
        return

    if body.is_in_group("Player"):
        self.get_tree().change_scene_to_file("res://scenes/maps/map_2.tscn")

