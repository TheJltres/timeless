extends CharacterBody2D

const SPEED = 200.0

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(_delta):
	var direction_x = Input.get_axis("move_left", "move_right")
	if direction_x:
		self.velocity.x = direction_x * self.SPEED
		self.animated_sprite_2d.flip_h = direction_x < 0;
	else:
		self.velocity.x = move_toward(self.velocity.x, 0, self.SPEED)
		
	var direction_y = Input.get_axis("move_up", "move_down")
	if direction_y:
		self.velocity.y = direction_y * self.SPEED
	else:
		self.velocity.y = move_toward(self.velocity.y, 0, self.SPEED)

	self.move_and_slide()
	
	var shoot = Input.is_action_just_pressed("attack")
	if shoot:
		print("What to do?")
