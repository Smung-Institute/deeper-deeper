extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var original_position = position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	position += Vector2(randi(),randi())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
