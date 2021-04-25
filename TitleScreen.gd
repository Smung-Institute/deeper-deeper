extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var startbutton = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Panel/StartButton
onready var storybutton = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Panel4/StoryButton
onready var creditsbutton = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Panel5/CreditsButton
var fliprate = 0.1
onready var topl = $MarginContainer/VBoxContainer/HBoxContainer/Panel2/AnimatedSprite
onready var topr = $MarginContainer/VBoxContainer/HBoxContainer/Panel/AnimatedSprite2
onready var tween = $Fader/Tween

onready var story_audio = $Story
onready var credits_audio = $Credits

onready var game_scene_path = "res://Main.tscn"

var fadetime = 1
var fadetimer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(fadetimer)
	fadetimer.wait_time = fadetime
	$Fader.show()
	tween.interpolate_property($Fader, "color",
		Color(0,0,0,1),Color(0,0,0,0), fadetime,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	tween.connect("tween_all_completed", self, "_on_fade_finished")
	startbutton.connect("pressed", self, "_on_startbutton_pressed")
	storybutton.connect("pressed", self, "_on_storybotton_pressed")
	creditsbutton.connect("pressed", self, "_on_creditsbotton_pressed")
	
func _on_fade_finished():
	$Fader.hide()
	
func _on_storybotton_pressed():
	story_audio.play()
	
func _on_creditsbotton_pressed():
	credits_audio.play()
	
	
func _on_startbutton_pressed():
	$Fader.show()
	tween.interpolate_property($Fader, "color",
		Color(0,0,0,0),Color(0,0,0,1), fadetime,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	fadetimer.start()
	yield(
		fadetimer,
		"timeout"
	)
	get_tree().change_scene(game_scene_path)
	
func _process(delta):
	if randf() < fliprate:
		topl.flip_h = !topl.flip_h 
	if randf() < fliprate:
		topr.flip_h = !topr.flip_h


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
