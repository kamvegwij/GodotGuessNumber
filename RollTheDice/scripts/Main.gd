extends Control

export (NodePath) onready var loadTimer = get_node(loadTimer)
export (NodePath) onready var numText = get_node(numText)
export (NodePath) onready var inputEdit = get_node(inputEdit)

var guess = ""
var timesFailed = 0
var randGen = RandomNumberGenerator.new()
var randGuessNum = RandomNumberGenerator.new()
var numberToGuess = 0
var randNum = 0

var loadDone: bool = false
var sceneReload: bool = false

func _process(_delta):
	changeNumber()
	
func _on_roll_button_down():
	rollTheDice()	
	guess()
	
func rollTheDice():
	loadDone = false #RESET
	loadTimer.start(2) #TAKES 2 SECONDS TO SHOW THE GENERATED NUM
	randGen.randomize()
	randGuessNum.randomize()
	
	var randNum = randGen.randi_range(0,numberToGuess)
	numberToGuess = randGuessNum.randi_range(0, 15) #The number to guess can be any between 0 and 15
	
	print(numberToGuess, ":", randNum)
	
func changeNumber():
	if loadDone == true:
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
	#print("failed ", timesFailed, " times")
	if (timesFailed >= 10):
		loadFailScene()
		
func loadFailScene():
	get_tree().change_scene("res://scenes/Menu.tscn")

func _on_loadTimer_timeout():
	loadDone = true
