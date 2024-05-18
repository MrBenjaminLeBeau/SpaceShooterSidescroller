class_name EnemyProjectile
extends Area2D

# Set these values in the _ready() function when inherited
var direction: Vector2
var damage: int
var projectile_speed: int


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

