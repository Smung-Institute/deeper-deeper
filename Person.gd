extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2a
# var b = "text"

var is_controlled = true
var direction = Vector2(1,0)
export var speed = 100
var velocity = Vector2(0,0)
export var rotation_rate = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("players")
	linear_velocity = Vector2(1,0) * speed
	connect("body_entered", self, "_handle_body_entered")
	
func _handle_body_entered(body):
	if body.is_in_group("bat"):
		die()
	if body.is_in_group("poison"):
		die()
		
func die():
	print("I died  ")

func _physics_process(delta):
	linear_velocity = linear_velocity.normalized() * speed
	if is_controlled:
		$DirectionalArrow.show()
		rotate_arrow()
		rotate_velocity(delta)
		direction = linear_velocity.normalized()
	else:
#		velocity = Vector2(0,0)
		$DirectionalArrow.hide()
	rotation = 0
	
	$AnimatedSprite.scale.x = -sign(linear_velocity.x)
#	move(delta)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func rotate_velocity(delta):
	if Input.is_action_pressed("keyboard_left"):
		linear_velocity= linear_velocity.rotated(-rotation_rate*delta)
	if Input.is_action_pressed("keyboard_right"):
		linear_velocity= linear_velocity.rotated(rotation_rate*delta)

#func move(delta):
##	direction = velocity.normalized()
#	position += velocity * delta

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
	$DirectionalArrow.rotation = linear_velocity.angle()
