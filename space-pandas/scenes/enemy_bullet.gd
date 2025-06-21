extends Area2D

@export var speed := 400.0

func _process(delta):
	position.y += speed * delta

	if position.y > 1400:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		area.take_damage()  # We'll add this method to the player
		queue_free()
