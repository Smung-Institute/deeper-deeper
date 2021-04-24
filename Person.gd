extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	move()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func move():
	linear_velocity = Vector2(0,0)
	if Input.is_action_pressed("keyboard_down"):
		linear_velocity += Vector2(0,1)
	if Input.is_action_pressed("keyboard_left"):
		linear_velocity += Vector2(-1,0)
	if Input.is_action_pressed("keyboard_right"):
		linear_velocity += Vector2(1,0)
	if Input.is_action_pressed("keyboard_up"):
		linear_velocity += Vector2(0,-1)
	if linear_velocity != Vector2(0,0):
		linear_velocity = linear_velocity.normalized() * speed
		
