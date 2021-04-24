extends Node

var screensize = Vector2(600,400)
onready var world = $GameWorld
onready var worldmap = world.get_node("Map")
onready var playerl = $GameWorld/Map/Person1
onready var playerr = $GameWorld/Map/Person2



func _ready():
	playerl.is_controlled = false
	playerr.is_controlled = true
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		playerl.is_controlled = !playerl.is_controlled
		playerr.is_controlled = !playerr.is_controlled
	clamp(playerl.position.x, 0, screensize.x)
	clamp(playerr.position.x, 0, screensize.x)
	clamp(playerl.position.y, 0, screensize.y)
	clamp(playerr.position.y, 0, screensize.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_walkbutton_toggled(buttonbool):
	playerl.is_controlled = buttonbool
	playerr.is_controlled = !buttonbool
#
#func _on_returnbutton_pressed():
#	playerl.position = Vector2(300,300)
#	playerr.position = Vector2(600,300)
