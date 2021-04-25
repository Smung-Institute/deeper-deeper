extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var panel = $Panel
onready var quitbutton = $Panel/QuitButton
onready var restartbutton = $Panel/RestartButton

# Called when the node enters the scene tree for the first time.
func _ready():
	restartbutton.connect("pressed", self, "_on_restartbutton_pressed")
	quitbutton.connect("pressed", self, "_on_quitbutton_pressed")
	var tween = get_node("Tween")
	tween.interpolate_property(panel, "rect_position",
		Vector2(500, -1000), Vector2(500,0), 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
func _on_restartbutton_pressed():
	get_tree().change_scene("res://Main.tscn")
	
func _on_quitbutton_pressed():
	get_tree().quit()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
