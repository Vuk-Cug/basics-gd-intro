extends RigidBody2D

@onready var sfx: AudioStreamPlayer2D = $sfx
var speed  = 500.0

var velocity
func _ready() -> void:
	randomize()
	var dir = randi_range(0, 1)
	if dir: 
		velocity= Vector2(1000,0).rotated(deg_to_rad(randf_range(-45, 45)))
	else: 
		velocity= Vector2(1000,0).rotated(deg_to_rad(randf_range(135, 225)))
	
	velocity= Vector2(500,0).rotated(randf()*PI)

func _physics_process(delta: float) -> void:
	velocity = velocity.normalized()*speed
	var collision_info =move_and_collide(velocity*delta)
	if collision_info:
		velocity.y +=randf_range(-100,100)
		velocity= velocity.bounce(collision_info.get_normal())
		sfx.pitch_scale = randf_range(0.8, 1.2)
		sfx.play()
		speed += 100
