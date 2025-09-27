extends AnimatedSprite2D
@export var speed := 50.0
@onready var right: RayCast2D = $right
@onready var left: RayCast2D = $left

var dir :int =1
	
func _process(delta: float) -> void:
	if right.is_colliding():
		dir =-1
		flip_h =1
	if left.is_colliding():
		dir =1
		flip_h =0
	position.x += speed*delta*dir
	
