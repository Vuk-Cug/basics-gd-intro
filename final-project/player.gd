extends CharacterBody2D

@onready var animated_sprite :AnimatedSprite2D= $AnimatedSprite2D
@export var speed := 100.0
# @export allows for direct changes from the inspector
@export var jump_speed := -300.0
# pulls default grav from project settings
var gravity :float= ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left","move_right")
	if direction != 0:
		velocity.x=direction*speed
	else:
		velocity.x=move_toward(velocity.x,0,75)
	if ! is_on_floor():
		#delta makes it work regardless of FPS
		velocity.y+=gravity*delta
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y=jump_speed
	move_and_slide()
	if direction >0:
		animated_sprite.flip_h = false
	elif direction <0:
		animated_sprite.flip_h = true
		
	if is_on_floor():
		if direction ==0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
