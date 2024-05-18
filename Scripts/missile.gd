class_name Missile
extends Projectile

var initial_position: Vector2
var max_distance: int = 500

@export var explosion_scene: PackedScene


func _ready():
	direction = Vector2.RIGHT
	damage = 10
	projectile_speed = 100
	initial_position = global_position


func _physics_process(delta):
	position += direction * projectile_speed * delta
	if global_position.x >= initial_position.x + max_distance:
		print("explode")
		explode()


func explode():
	var explosion = explosion_scene.instantiate()
	get_tree().root.add_child.call_deferred(explosion)
	explosion.position = global_position
	queue_free()


func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		area.take_damage(damage)
		explode()
