extends Node

@onready var button1=$Control/button1
@onready var button2=$Control/button2
@onready var button3=$Control/button3
@onready var button4=$Control/button4
@onready var button5=$Control/button5
@onready var button6=$Control/button6
@onready var button7=$Control/button7
@onready var button8=$Control/button8
@onready var button9=$Control/button9
@onready var button10=$Control/button10
@onready var scoreText=$scoreText
@onready var hsText=$highScoreButton
var end=false
var random=0
@onready var buttonList=[button1,button2,button3,button4,button5,button6,button7,button8,button9,button10]
var inputEnabled=false
var pattern=[]
var userInput=[]
var correct=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(buttonList.size()):
		buttonList[i].pressed.connect(on_button_pressed.bind(i))
		buttonList[i].modulate = Color(0.043, 0.239, 0.337, 0.85)
	
var start=false
func _on_start_button_pressed() -> void:
	inputEnabled = false

	random = randi_range(0, 9)
	pattern.append(random)
	
	await showPattern()
	userInput.clear()
	inputEnabled = true

func showPattern():
	for index in pattern:
		buttonList[index].modulate = Color(0.617, 0.781, 0.948, 1.0)
		await get_tree().create_timer(0.8).timeout
		buttonList[index].modulate = Color(0.043, 0.239, 0.337, 0.85)
		await get_tree().create_timer(0.2).timeout
var currentStep = 0
var hs=0
func on_button_pressed(index: int) -> void:
	
	if !inputEnabled:
		return
	userInput.append(index)
	currentStep = userInput.size() - 1
	if userInput[currentStep] != pattern[currentStep]:
		if correct>hs:
			hs=correct
			hsText.text="HIGH SCORE: "+str(hs)
		correct=0
		scoreText.text="SCORE: "+str(correct)
		end=false
		inputEnabled=false
		pattern=[]
		userInput=[]
		return
		
	if userInput[currentStep] == pattern[currentStep]:
		if userInput.size() == pattern.size():
			await get_tree().create_timer(0.8).timeout
			inputEnabled = false
			
			
			correct+=1
			

			scoreText.text="SCORE: "+str(correct)
			if correct>hs:
				hs=correct
				hsText.text="HIGH SCORE: "+str(hs)
				random = randi_range(0, 9)
			random = randi_range(0, 9)
			pattern.append(random)
			
			userInput.clear()
			
			await showPattern()
			inputEnabled = true
		
		
		
