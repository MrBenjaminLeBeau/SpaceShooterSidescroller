class_name Bullet
extends Projectile


func _ready():
	direction = Vector2.RIGHT
	damage = 1
	projectile_speed = 200


func _physics_process(delta):
	position += direction * projectile_speed * delta
