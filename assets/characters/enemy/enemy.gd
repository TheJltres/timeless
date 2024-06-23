extends CharacterBody2D

const MAX_LIVE: int = 100
@export var live = MAX_LIVE

const SPEED = 300.0

func _physics_process(delta):
	pass

func take_damage(amount: int):
	self.live -= amount
	
	if self.live <= 0:
		self.queue_free()
