extends Area2D

const SPEED = 300.0
var direction: Vector2

func _physics_process(delta):
	self.position += self.direction * self.SPEED * delta

func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		body.take_damage(50)
		self.queue_free()
