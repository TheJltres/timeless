extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    if Input.is_action_just_pressed("pickup_item"):
        var bodies = self.get_overlapping_bodies()
        if not bodies.is_empty():
            pass
            # make player faster or some shit
