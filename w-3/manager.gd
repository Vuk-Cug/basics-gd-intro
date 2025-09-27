extends Node

var score = 0
@onready var score_text: Label = $score

func add_point():
	score += 1
	score_text.text = "You got " + str(score) + " coins."
