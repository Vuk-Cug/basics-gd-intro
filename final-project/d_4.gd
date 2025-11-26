#d_4 is the compass and level select
extends Node2D
@onready var animated_sprite : AnimatedSprite2D = $animated_sprite
@export var level_names : Array[PackedScene]

var levels := ["forest", "tundra", "desert", "sea"]
@onready var scene_forest = preload("res://forest.tscn")
@onready var scene_tundra = preload("res://tundra.tscn")
#@onready var scene_tundra = preload("res://third.tscn")
#@onready var scene_tundra = preload("res://fourth.tscn")

var current_roll : int

#i pressa da button, i getta da animation
func _on_compass_pressed():
	play_animation()
	roll_dice()

#when animation done
func animation_finished() -> void:
	wait_and_change_scene()




#choose a random number between 1 and 4
func roll_dice() -> void:
	return randi_range(1, 4)


#compass animation
func play_animation() -> void:
	animated_sprite.play("Rolling")


#wait before chaning the scene
func wait_and_change_scene():
	await get_tree().create_timer(1).timeout
	if current_roll <2:
		get_tree().change_scene_to_packed(scene_forest)
	else:
		get_tree().change_scene_to_packed(scene_tundra)
