extends Node

var screensize = Vector2(300,400)
onready var world = $MarginContainer/HBoxContainer2/Viewports/ViewportContainerL/Viewport/GameWorld
onready var worldmap = world.get_node("Map")
onready var playerl = world.get_node("Map/Person1")
onready var playerr = world.get_node("Map/Person2")

onready var viewportr = get_node("MarginContainer/HBoxContainer2/Viewports/ViewportContainerR/Viewport")
onready var viewportl = get_node("MarginContainer/HBoxContainer2/Viewports/ViewportContainerL/Viewport")
onready var pausebutton = $MarginContainer/HBoxContainer2/PauseButton
onready var beginbutton = $StartPanel/BeginButton

onready var camerar = viewportr.get_node("Camera2DR")
onready var cameral = viewportl.get_node("Camera2DL")

func _ready():
	pausebutton.disabled = true
	pausebutton.connect("pressed", self, "_on_pausebutton_pressed")
	beginbutton.connect("pressed", self, "_on_beginbutton_pressed")
	world = viewportl.find_world_2d()
	viewportr.world_2d = world
	playerl.is_controlled = false
	playerr.is_controlled = true
	cameral.position = playerl.position
	camerar.position = playerr.position
	get_tree().paused = true
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		playerl.is_controlled = !playerl.is_controlled
		playerr.is_controlled = !playerr.is_controlled
#	playerl.position.x = clamp(playerl.position.x, 0, screensize.x)
#	playerr.position.x = clamp(playerr.position.x, 0, screensize.x)
#	playerl.position.y = clamp(playerl.position.y, 0, screensize.y)
	cameral.position = playerl.position
	camerar.position = playerr.position
	
	
func _on_beginbutton_pressed():
	get_tree().paused = false
	pausebutton.disabled = false
	$StartPanel.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_walkbutton_toggled(buttonbool):
	playerl.is_controlled = buttonbool
	playerr.is_controlled = !buttonbool
#

func _on_pausebutton_pressed():
	get_tree().paused = !get_tree().paused
