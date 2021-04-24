extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var startbutton = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Panel/StartButton
var fliprate = 0.1
onready var topl = $MarginContainer/VBoxContainer/HBoxContainer/Panel2/AnimatedSprite
onready var topr = $MarginContainer/VBoxContainer/HBoxContainer/Panel/AnimatedSprite2
onready var tween = $Fader/Tween




# Called when the node enters the scene tree for the first time.
func _ready():
	$Fader.show()
	tween.interpolate_property($Fader, "color",
		Color(0,0,0,1),Color(0,0,0,0), 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	tween.connect("tween_all_completed", self, "_on_fade_finished")
	startbutton.connect("pressed", self, "_on_startbutton_pressed")
	
func _on_fade_finished():
	$Fader.hide()
	
func _on_startbutton_pressed():
	$Fader.show()
	tween.interpolate_property($Fader, "color",
		Color(0,0,0,0),Color(0,0,0,1), 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
func _process(delta):
	if randf() < fliprate:
		topl.flip_h = !topl.flip_h 
	if randf() < fliprate:
		topr.flip_h = !topr.flip_h


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
