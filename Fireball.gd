extends Area2D

var SPEED = 150
var VELOCITY_VECTOR = SPEED * Vector2(1,0).rotated(PI/6)

func _ready():
	connect("body_entered", self, "_handle_body_entered")
	
func _handle_body_entered(body):
	print("diedie")
	
func _process(delta):
	position += VELOCITY_VECTOR * delta
