extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var is_controlled = true
var direction = Vector2(1,0)
export var speed = 100
var velocity = Vector2(0,0)
export var rotation_rate = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(1,0) * speed

func _process(delta):
	if is_controlled:
		$DirectionalArrow.show()
		rotate_arrow()
		rotate_velocity(delta)
		direction = velocity.normalized()
	else:
#		velocity = Vector2(0,0)
		$DirectionalArrow.hide()
	move(delta)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func rotate_velocity(delta):
	if Input.is_action_pressed("keyboard_left"):
		velocity= velocity.rotated(-rotation_rate*delta)
	if Input.is_action_pressed("keyboard_right"):
		velocity= velocity.rotated(rotation_rate*delta)

func move(delta):
#	direction = velocity.normalized()
	position += velocity * delta

#func move():
#	var direction = Vector2(0,0)
##	if Input.is_action_pressed("keyboard_down"):
##		direction += Vector2(0,1)
#	if Input.is_action_pressed("keyboard_left"):
#		direction += Vector2(-1,0)
#	if Input.is_action_pressed("keyboard_right"):
#		direction += Vector2(1,0)
##	if Input.is_action_pressed("keyboard_up"):
##		direction += Vector2(0,-1)
##	if direction != Vector2(0,0):
##		linear_velocity = direction.normalized() * speed
##		is_walking = true
##	else:
##		is_walking = false

func rotate_arrow():
	$DirectionalArrow.rotation = velocity.angle()
