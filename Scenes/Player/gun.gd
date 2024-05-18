class_name Gun
extends Node2D

var projectile_scene: PackedScene

var can_shoot: bool = true

@onready var firing_point: Marker2D = $FiringPoint
@onready var shot_cooldown_timer: Timer = $ShotCooldownTimer


func _ready():
	projectile_scene = Globals.bullet_scene


func _process(_delta):
	if Input.is_action_pressed("weapon1") and can_shoot:
		fire_projectile()


func fire_projectile():
	can_shoot = false
	shot_cooldown_timer.start()
	var projectile = projectile_scene.instantiate()
	get_tree().root.add_child(projectile)
	projectile.position = firing_point.global_position


func _on_shot_cooldown_timer_timeout():
	can_shoot = true
	# fire_projectile()		turn on for autofire
