extends Panel
var player1 = preload("res://x.tscn")
var player2 = preload("res://o.tscn")

#boolean shit
var boo = true

func _ready() -> void:
	pass

#variable signal sends strings to each button name
func _on_button_pressed(button_name) -> void:
	var button = get_node("GridContainer/"+button_name)
	if boo:
		var instance = player1.instantiate()
		button.add_child(instance)
	else:
		var instance = player2.instantiate()
		button.add_child(instance)
	boo = !boo
	button.disabled = true
