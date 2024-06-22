extends CharacterBody2D

const MAX_TIME: int = 100
@export var time = MAX_TIME

const SPEED = 300.0

func _physics_process(delta):
	pass

func take_damage(amount: int):
	self.time -= amount
	
	if self.time <= 0:
		self.queue_free()
