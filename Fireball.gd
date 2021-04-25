extends Area2D

var SPEED = 150
var velocity_vector = SPEED * Vector2(1,0).rotated(PI/6)

func _ready():
	add_to_group("fireball")
	connect("body_entered", self, "_handle_body_entered")
	velocity_vector.x = velocity_vector.x * scale.x
	
func _handle_body_entered(body):
	if body.is_in_group("players"):
		body._handle_body_entered(self)
	queue_free()
	
func _process(delta):
	
	position += velocity_vector * delta
