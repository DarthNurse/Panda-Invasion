extends Node2D

@export var zigzag_enemy_scene: PackedScene


@export var enemy_scene: PackedScene

func _ready():
	$Timer.timeout.connect(spawn_enemy)

func spawn_enemy():
	var enemy
	if randi() % 2 == 0:
		enemy = enemy_scene.instantiate()
	else:
		enemy = zigzag_enemy_scene.instantiate()

	add_child(enemy)

	# Determine enemy sprite width
	var sprite = enemy.get_node("Sprite2D")
	var enemy_width = sprite.texture.get_width()

	# Adjust X range to keep fully onscreen
	var screen_width = get_viewport().size.x
	var min_x = enemy_width / 2
	var max_x = screen_width - enemy_width / 2
	var x_position = randf_range(min_x, max_x)

	# Spawn just above top of screen
	enemy.position = Vector2(x_position, -enemy_width)
