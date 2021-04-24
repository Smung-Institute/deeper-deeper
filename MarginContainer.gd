extends MarginContainer

export var usermargins = 10

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	margin_left = usermargins
	margin_top = usermargins
	margin_bottom = usermargins
	margin_right = -usermargins


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
