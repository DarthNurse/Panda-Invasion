extends Node2D

@export var bullet_scene: PackedScene


@export var speed := 300.0

func _process(delta):
	var direction := 0.0

	if Input.is_action_just_pressed("ui_accept"):
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)
		bullet.position = position

	if Input.is_action_pressed("ui_left"):
		direction -= 1.0
	if Input.is_action_pressed("ui_right"):
		direction += 1.0

	position.x += direction * speed * delta

	# Prevent player from going offscreen
	position.x = clamp(position.x, -720,720)
