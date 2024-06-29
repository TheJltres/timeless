extends CharacterBody2D

const MAX_LIVE: int = 100
const SPEED = 300.0
const ACCELERATION = 20.0
@export var live = MAX_LIVE
var flag_touched = false

@onready var PLAYER: CharacterBody2D = $"../../Player"
@onready var area_2d = $Area2D
@onready var timer = $Timer

func _physics_process(delta):
    self.rotation = self.PLAYER.position.angle_to_point(self.position)
    var direction = self.PLAYER.position.direction_to(self.position)
    if flag_touched:
        direction = -direction
        self.velocity.x = -move_toward(self.velocity.x, direction.x * self.SPEED, self.ACCELERATION * 3)
        self.velocity.y = -move_toward(self.velocity.y, direction.y * self.SPEED, self.ACCELERATION * 3)
    else:
        self.velocity.x = -move_toward(self.velocity.x, direction.x * self.SPEED, self.ACCELERATION)
        self.velocity.y = -move_toward(self.velocity.y, direction.y * self.SPEED, self.ACCELERATION)

    self.move_and_slide()

func take_damage(amount: int):
    self.live -= amount
    if self.live <= 0:
        self.queue_free()


func _on_body_entered(body):
    if body.is_in_group("Player"):
        flag_touched = true
        timer.start()

func _on_timer_timeout():
    flag_touched = false
