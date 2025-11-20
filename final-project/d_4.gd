#d_4 is the compass and level select
extends Node2D
@onready var animated_sprite : AnimatedSprite2D = $animated_sprite

@export var level_names : Array[PackedScene]

var levels := ["forest", "tundra", "desert", "sea"]
@onready var scene_forest = preload("res://forest.tscn")
@onready var scene_tundra = preload("res://tundra.tscn")

var current_roll : int

func _on_compass_pressed() -> void:
	print("the compass spins...")
	animated_sprite.play("Rolling")

func set_dice(new_number : int) -> void:
	animated_sprite.play(levels[new_number -1])
	current_roll = new_number
	wait_and_change_scene()

func wait_and_change_scene():
	await get_tree().create_timer(1).timeout
	if current_roll <2:
		get_tree().change_scene_to_packed(scene_forest)
	else:
		get_tree().change_scene_to_packed(scene_tundra)
