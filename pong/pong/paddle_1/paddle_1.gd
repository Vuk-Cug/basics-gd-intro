extends CharacterBody2D
var speed = 30000

func _physics_process(delta: float) -> void:
	var direction := -Input.get_axis("down_right_p", "up_right_p")
	if direction != 0:
		velocity.y=direction*speed*delta
	else:
		velocity.y=move_toward(velocity.y, 0, 50)
	
	move_and_slide()
