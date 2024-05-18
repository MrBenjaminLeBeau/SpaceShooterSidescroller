class_name Coin
extends Area2D

var direction: Vector2 = Vector2.LEFT
var speed: int = 50


func _physics_process(delta):
	position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
