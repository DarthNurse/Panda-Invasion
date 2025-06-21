extends Node2D

@export var enemy_scene: PackedScene

func _ready():
	$Timer.timeout.connect(spawn_enemy)

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	add_child(enemy)

	# Random x within screen bounds
	var x_position = randi_range(50, 670)
	enemy.position = Vector2(x_position, -50)
