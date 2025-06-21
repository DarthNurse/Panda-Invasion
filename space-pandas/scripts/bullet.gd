extends Area2D

@export var speed := 800.0

func _process(delta):
	position.y -= speed * delta

	# Remove if off screen
	if position.y < -10:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		current_health -= 1
		area.queue_free()

		print("Health:", current_health)

		if current_health <= 0:
			print("Player has been vaporized.")
			queue_free()  # Destroys the player

		queue_free()        # Destroy the bullet
		area.queue_free()   # Destroy the enemy


@export var max_health := 3
var current_health := 3
