extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var panel = $Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_node("Tween")
	tween.interpolate_property(panel, "rect_position",
		Vector2(500, -500), Vector2(500,100), 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
