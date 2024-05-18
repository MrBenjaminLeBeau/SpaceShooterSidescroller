class_name Player
extends CharacterBody2D


func _ready():
	Globals.player_current_health = Globals.player_max_health


func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * Globals.player_speed
	move_and_slide()
	global_position.x = clamp(global_position.x, 16, get_viewport_rect().size.x - 16)
	global_position.y = clamp(global_position.y, 16, get_viewport_rect().size.y - 56)


func take_damage(damage):
	Globals.player_current_health -= damage
	if Globals.player_current_health <= 0:
		queue_free()
		# eventually make this better with ui
		get_tree().change_scene_to_packed(Globals.player_upgrade_scene)


func _on_coin_pickup_area_area_entered(area):
	if area is Coin:
		Globals.player_money += 1
		area.queue_free()
