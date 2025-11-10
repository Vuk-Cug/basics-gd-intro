extends Node2D

var level_names = ["forest", "tundra", "desert", "sea"]

#d4 chooses the level
var d4 = RandomNumberGenerator.new()


func _ready() -> void:
	load(level_names.pick_random())

func _on_compass_pressed() -> void:
	d4.randomize()
	print(d4.randi_range(1,4))
