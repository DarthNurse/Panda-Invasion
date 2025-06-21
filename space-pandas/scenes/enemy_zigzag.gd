extends Area2D

@export var speed := 100.0
@export var amplitude := 50.0
@export var frequency := 3.0
@export var bullet_scene: PackedScene
@export var fire_rate := 1.5

var time := 0.0
var base_x := 0.0

func _ready():
	base_x = position.x
	start_firing()

func _process(delta):
	time += delta
	var offset = sin(time * frequency) * amplitude
	position.x = base_x + offset
	position.y += speed * delta

	if position.y > 1400:
		queue_free()

func start_firing():
	await get_tree().create_timer(fire_rate).timeout
	if is_instance_valid(self):
		fire_bullet()
		start_firing()

func fire_bullet():
	if bullet_scene:
		for angle_deg in [-20, 0, 20]:
			var bullet = bullet_scene.instantiate()
			bullet.position = global_position

			var angle_rad = deg_to_rad(angle_deg)
			bullet.direction = Vector2(sin(angle_rad), 1)

			get_parent().add_child(bullet)
