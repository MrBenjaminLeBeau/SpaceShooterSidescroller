extends EnemyProjectile


func _ready():
	direction = Vector2.LEFT
	damage = 35
	projectile_speed = 500


func _physics_process(delta):
	position += direction * projectile_speed * delta


func _on_body_entered(body):
	if body is Player:
		queue_free()
		body.take_damage(damage)
		print("player hit")


