extends Area2D

var damage: int = 10

@onready var explosion_timer: Timer = $ExplosionTimer


func _ready():
	explosion_timer.start()


func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		print("enemy detected")
		area.take_damage(damage)


func _on_timer_timeout():
	queue_free()
