extends Control

export (NodePath) onready var numText = get_node(numText)
export (NodePath) onready var inputEdit = get_node(inputEdit)

var guess = ""
var numberToGuess = 5 #initially set the guess to 3
var timesFailed = 0
var randGen = RandomNumberGenerator.new()
var randNum = 0

func _on_roll_button_down():
	rollTheDice()	
	guess()
	
func rollTheDice():
	randGen.randomize()
	randNum = randGen.randi_range(0,numberToGuess)
	numText.text = str(randNum)
	
func guess():
	guess = inputEdit.text
	if int(guess) == randNum:
		success()
		
	else:
		fail()
		
func success():
	get_tree().change_scene("res://scenes/Success.tscn")

func fail():
	timesFailed += 1
	print("failed ", timesFailed, " times")
	if (timesFailed >= 5):
		loadFailScene()
		
func loadFailScene():
	get_tree().change_scene("res://scenes/Menu.tscn")
	



