extends Node2D

@export var max_health := 3
var current_health := max_health


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


func _ready():
	_update_health_bar()



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		current_health -= 1
		area.queue_free()

		print("Health:", current_health)
		_update_health_bar()

		if current_health <= 0:
			print("Player has been vaporized.")
			queue_free()


			
func _update_health_bar():
	var bar = get_tree().root.get_node_or_null("Main/UI/ProgressBar")
	if bar:
		bar.value = current_health
	else:
		print("Health bar not found!")


	
func take_damage():
	current_health -= 1
	_update_health_bar()
	print("Hit by enemy! Health:", current_health)
	if current_health <= 0:
		print("Player has been vaporized.")
		queue_free()
