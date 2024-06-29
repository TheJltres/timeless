extends CanvasLayer

var already_paused = false

func _on_button_resume_pressed():
    self.TogglePause()

func _on_button_quit_pressed():
    self.get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    if Input.is_action_just_pressed("pause"):
        self.TogglePause()

func TogglePause():
    self.get_tree().paused = !self.already_paused

    if self.already_paused:
        self.hide()
    else:
        self.show()

    self.already_paused = !self.already_paused
