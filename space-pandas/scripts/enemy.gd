extends Area2D

@export var speed := 150.0

@export var bullet_scene: PackedScene
@export var fire_rate := 1.0

func _ready():
	start_firing()

func start_firing():
	await get_tree().create_timer(fire_rate).timeout
	if is_instance_valid(self):
		fire_bullet()
		start_firing()

func fire_bullet():
	var bullet = bullet_scene.instantiate()
	bullet.position = global_position
	get_parent().add_child(bullet)



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
	


		
