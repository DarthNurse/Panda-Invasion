extends Area2D

@export var speed := 300.0
@export var direction := Vector2(0, 1)

func _process(delta):
	position += direction.normalized() * speed * delta
	if position.y > 1500 or position.y < -100:
		queue_free()
