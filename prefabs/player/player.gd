extends CharacterBody2D

var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var WALK_SPEED = 200.0
@export var ACCEL_RATE = 5
@export var DECEL_RATE = 5
@export var JUMP_PWR = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y += delta * GRAVITY
	
	if Input.is_action_pressed("left"):
		velocity.x = lerp(velocity.x, -WALK_SPEED, ACCEL_RATE * delta)
	elif Input.is_action_pressed("right"):
		velocity.x = lerp(velocity.x, WALK_SPEED, ACCEL_RATE * delta)
	else:
		velocity.x = lerp(velocity.x, 0.0, DECEL_RATE * delta)
		
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_PWR
	
	move_and_slide()
