extends Node2D

@export var zigzag_enemy_scene: PackedScene
@export var enemy_scene: PackedScene

func _ready():
	$Timer.timeout.connect(spawn_enemy)

func spawn_enemy():
	var enemy: Node2D

	# Randomly choose enemy type
	if randi() % 2 == 0:
		enemy = enemy_scene.instantiate()
	else:
		enemy = zigzag_enemy_scene.instantiate()

	add_child(enemy)

	# Random X along the spawn line (-240, -300) to (700, -300)
	var min_x = -240
	var max_x = 700
	var spawn_y = -300
	var x_position = randf_range(min_x, max_x)

	enemy.position = Vector2(x_position, spawn_y)
