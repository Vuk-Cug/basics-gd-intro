extends Node2D
@onready var score: Label = $score
@onready var score_sound: AudioStreamPlayer2D = $score_sound

var left_score = 0

var right_score = 0
func _ready() -> void:
	var ballball = preload("res://ball.tscn").instantiate()
	add_child(ballball)
	ballball.position.x = 1920/2.0
	ballball.position.y = 1080/2.0

func _on_left_body_entered(body: Node2D) -> void:
	right_score += 1
	reset()


func _on_right_body_entered(body: Node2D) -> void:
	left_score += 1
	reset()
	
#score text
func _process(delta: float) -> void:
	score.text = str(left_score) + " - " + str(right_score)

#new round
func reset() -> void:
	score_sound.play()
	var balls = get_tree().get_nodes_in_group("ball")
	balls[0].queue_free()
	var ballball = preload("res://ball.tscn").instantiate()
	add_child(ballball)
	ballball.position.x = 1920/2.0
	ballball.position.y = 1080/2.0
	
