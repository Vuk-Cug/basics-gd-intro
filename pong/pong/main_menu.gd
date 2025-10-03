extends PanelContainer

@onready var main_container: VBoxContainer = $VBoxContainer
@onready var credits_container: VBoxContainer = $credits_container
@onready var h_2p: VBoxContainer = $h2p
@onready var play_sound: AudioStreamPlayer2D = $play_sound

func _ready() -> void:
	main_container.visible = true
	credits_container.visible = false 
	h_2p.visible = false

#play
func _on_play_pressed() -> void:
	play_sound.play()
	
	
#exit
func _on_exit_pressed() -> void:
	get_tree().quit()

#credits
func _on_credits_pressed() -> void:
	main_container.visible = false
	credits_container.visible = true 

#back from credits
func _on_back_pressed() -> void:
	main_container.visible = true
	credits_container.visible = false 

#how to play
func _on_h_2p_pressed() -> void:
	main_container.visible = false
	h_2p.visible = true
	
#back from how to play
func _on_back_h_2p_pressed() -> void:
	main_container.visible = true
	h_2p.visible = false


func _on_play_sound_finished() -> void:
	get_tree().change_scene_to_file("res://game.tscn")
