extends Control

export (NodePath) onready var loadTimer = get_node(loadTimer)
export (NodePath) onready var numText = get_node(numText)
export (NodePath) onready var inputEdit = get_node(inputEdit)

var guess = ""
var numberToGuess = 1 #initially set the guess to 3
var timesFailed = 0
var randGen = RandomNumberGenerator.new()
var randNum = 0

var loadDone: bool = false

func _on_roll_button_down():
	rollTheDice()	
	guess()
	
func rollTheDice():
	loadTimer.start(5) #TAKES 5 SECONDS TO SHOW THE GENERATED NUM
	randGen.randomize()
	randNum = randGen.randi_range(0,numberToGuess)
	
	if loadDone:
		#SHOW AFTER TIMER IS DONE
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

func _on_loadTimer_timeout():
	loadDone = true
