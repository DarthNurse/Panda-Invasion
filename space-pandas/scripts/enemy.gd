extends Area2D

@export var speed := 150.0

func _process(delta):
	position.y += speed * delta

	# Auto-destroy if off screen
	if position.y > 1400:
		queue_free()



@export var enemy_scene: PackedScene


func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	add_child(enemy)

	# Random x within screen bounds
	var x_position = randi_range(50, 670)
	enemy.position = Vector2(x_position, -50)
