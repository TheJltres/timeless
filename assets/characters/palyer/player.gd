extends CharacterBody2D

const SPEED = 100.0
const ACCELERATION = 5.0
const DECELERATION = 20

var USING_CONTROLLER = false
var CAN_SHOOT = true

const scene_bullet = preload("res://assets/bullets/bullet.tscn")

@onready var marker_aim: Node2D = $MarkerAim
@onready var marker_2d = $MarkerAim/Marker2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var shoot_timer: Timer = $ShootTimer

func _physics_process(_delta):
	var direction_x = Input.get_axis("move_left", "move_right")
	if direction_x:
		self.velocity.x = move_toward(self.velocity.x, direction_x * self.SPEED, self.ACCELERATION)
	else:
		self.velocity.x = move_toward(self.velocity.x, 0, self.DECELERATION)
		
	var direction_y = Input.get_axis("move_up", "move_down")
	if direction_y:
		self.velocity.y = move_toward(self.velocity.y, direction_y * self.SPEED, self.ACCELERATION)
	else:
		self.velocity.y = move_toward(self.velocity.y, 0, self.DECELERATION)

	self.move_and_slide()
	self.rotate_to_look()

	if Input.is_action_just_pressed("attack") or Input.is_action_pressed("attack"):
		self.shoot_to_look()

func _input(event):
	if event is InputEventMouse or event is InputEventKey:
		USING_CONTROLLER = false
	elif event is InputEventJoypadMotion or event is InputEventJoypadButton:
		USING_CONTROLLER = true
	else:
		print("Device is not supported, sorry")
		print(event)
		Input.action_press("pause")
		Input.action_release("pause")

func _on_shoot_timer_timeout():
	self.CAN_SHOOT = true

func rotate_to_look():
	var dir = get_look_at_vector2()
	if USING_CONTROLLER:
		self.marker_aim.rotation = dir.angle()
	else:
		self.marker_aim.look_at(dir)

func get_look_at_vector2():
	if USING_CONTROLLER:
		var direction = Input.get_vector("look_left", "look_right", "look_up", "look_down")
		if direction == Vector2.ZERO:
			return self.position.direction_to(self.marker_2d.global_position)
		else:
			return direction
	else:
		return get_global_mouse_position()

func shoot_to_look():
	if !self.CAN_SHOOT:
		return

	self.CAN_SHOOT = false
	self.shoot_timer.start()
	var bullet = self.scene_bullet.instantiate()
	bullet.position = self.marker_2d.global_position
	
	var dir = self.position.direction_to(self.marker_2d.global_position)
	bullet.rotation = dir.angle()
	bullet.direction = dir.normalized()
	get_parent().add_child(bullet)
