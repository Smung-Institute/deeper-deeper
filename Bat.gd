extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var original_position = position
var SPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("bat")
	
func _process(delta):
	linear_velocity = SPEED * Vector2(2*randf()-1,2*randf()-1)
	rotation = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
