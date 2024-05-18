class_name Enemy
extends Area2D

# Reminders When Inheriting:
##### Set Collision Layers/Masks
##### Connect 2 Base Signals
##### Add to Group "Enemy"
##### Include Movement in _physics_process

# Set these values in the _ready() function when inherited
var health: int
var direction: Vector2
var speed: int
var collision_damage: int


func take_damage(damage):
	health -= damage
	if health <= 0:
		if (randi() % 100 + 1) > 50:
			var coin = Globals.coin_scene.instantiate()
			get_tree().root.add_child.call_deferred(coin)
			coin.position = global_position
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body is Player:
		body.take_damage(collision_damage)
		queue_free()
