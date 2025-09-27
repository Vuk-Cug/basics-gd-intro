extends Area2D
@onready var manager = %manager
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _on_body_entered(body):
	manager.add_point()
	animation_player.play("pickup")
	collision_shape_2d.queue_free()
