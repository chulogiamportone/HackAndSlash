extends CharacterBody3D


const SPEED = 10.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_3d: AnimatedSprite3D = $AnimatedSprite3D

func _ready() -> void:
	animated_sprite_3d.play("side_idle")
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	
	var direction_x := Input.get_axis("ui_left", "ui_right")
	if direction_x:
		if Input.is_action_pressed("ui_left"):
			animated_sprite_3d.flip_h = false
			animated_sprite_3d.play("side")
		if Input.is_action_pressed("ui_right"):
			animated_sprite_3d.flip_h = true
			animated_sprite_3d.play("side")
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction_y := Input.get_axis( "ui_down","ui_up")
	if direction_y:
		if Input.is_action_pressed("ui_up"):
			animated_sprite_3d.play("up")
		if Input.is_action_pressed("ui_down"):
			animated_sprite_3d.play("down")
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
