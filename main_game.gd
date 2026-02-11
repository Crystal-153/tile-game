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
var end=false
var random=0
@onready var buttonList=[button1,button2,button3,button4,button5,button6,button7,button8,button9,button10]
var inputEnabled=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(buttonList.size()):
		buttonList[i].pressed.connect(on_button_pressed.bind(i))
		buttonList[i].modulate = Color(0.043, 0.239, 0.337, 0.85)
	
	


var start=false
func _on_start_button_pressed() -> void:
	inputEnabled = false

	random = randi_range(0, 9)
	buttonList[random].modulate = Color(0.617, 0.781, 0.948, 1.0)
	await get_tree().create_timer(0.8).timeout
	buttonList[random].modulate = Color(0.043, 0.239, 0.337, 0.85)

	inputEnabled = true
		

func on_button_pressed(index: int) -> void:
	if !inputEnabled:
		return
	if random!=index:
		end=false
		inputEnabled=false
