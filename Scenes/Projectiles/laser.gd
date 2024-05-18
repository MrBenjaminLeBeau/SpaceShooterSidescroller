class_name Laser
extends Projectile

var number_of_chains: int = 15

@onready var chain_detection_area: Area2D = $ChainDetectionArea


func _ready():
	direction = Vector2.RIGHT
	damage = 2
	projectile_speed = 500


func _physics_process(delta):
	position += direction * projectile_speed * delta


func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		area.take_damage(damage)
		
		if number_of_chains <= 0:
			queue_free()
		else:
			number_of_chains -= 1
			var enemies_in_range = chain_detection_area.get_overlapping_areas()
			var new_targets = []
			for enemy in enemies_in_range:
				if enemy != area:
					new_targets.append(enemy)
			if new_targets:
				chain_shot(new_targets)
			else:
				queue_free()
				# Maybe add some sort of "fizzle out" animation if it cant chain


func chain_shot(new_targets):
	# var target = new_targets.pick_random().global_position
	# Chooses Closest Target
	var target = new_targets[0].global_position
	direction = global_position.direction_to(target)
	look_at(target)
