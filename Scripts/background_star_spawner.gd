extends Node

@export var star_sprite_scene: PackedScene

@onready var star_spawn_timer: Timer = $StarSpawnTimer


func _ready():
	for x in range(24):
		var star = star_sprite_scene.instantiate()
		add_child.call_deferred(star)
		star.position = Vector2(x * 30, randi() % 360)


func _on_star_spawn_timer_timeout():
	star_spawn_timer.wait_time = randf_range(0.2, 2.5)
	var star = star_sprite_scene.instantiate()
	add_child(star)
	star.position = Vector2(700, randi() % 360)
