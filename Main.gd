extends Node

var screensize = Vector2(600,400)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/HBoxContainer/WalkButton.connect("toggled", self, "_on_walkbutton_toggled")
	$Person1.is_controlled = false
	$Person2.is_controlled = true
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$Person1.is_controlled = !$Person1.is_controlled
		$Person2.is_controlled = !$Person2.is_controlled
	clamp($Person1.position.x, 0, screensize.x)
	clamp($Person2.position.x, 0, screensize.x)
	clamp($Person1.position.y, 0, screensize.y)
	clamp($Person2.position.y, 0, screensize.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_walkbutton_toggled(buttonbool):
	$Person1.is_controlled = buttonbool
	$Person2.is_controlled = !buttonbool
#
#func _on_returnbutton_pressed():
#	$Person1.position = Vector2(300,300)
#	$Person2.position = Vector2(600,300)
