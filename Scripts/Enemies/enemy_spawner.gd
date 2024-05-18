extends Node2D

var drone = preload("res://Scenes/Enemies/enemy_drone.tscn")


func vertical_line():
	for x in range(10):
		var enemy = drone.instantiate()
		get_tree().root.add_child(enemy)
		enemy.position = Vector2(700, 32 * x + 16)


func flying_v():
	var enemy1 = drone.instantiate()
	get_tree().root.add_child(enemy1)
	enemy1.position = Vector2(700, 180)
	
	var enemy2 = drone.instantiate()
	get_tree().root.add_child(enemy2)
	enemy2.position = Vector2(732, 212)
	
	var enemy3 = drone.instantiate()
	get_tree().root.add_child(enemy3)
	enemy3.position = Vector2(732, 148)
	
	var enemy4 = drone.instantiate()
	get_tree().root.add_child(enemy4)
	enemy4.position = Vector2(764, 244)
	
	var enemy5 = drone.instantiate()
	get_tree().root.add_child(enemy5)
	enemy5.position = Vector2(764, 116)


func _on_timer_timeout():
	vertical_line()
