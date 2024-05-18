extends Node

signal health_changed
signal speed_changed
signal boost_changed
signal max_shield_changed
signal shield_changed
signal shield_recharge_time_changed
signal money_changed

var player_max_health: int = 100
var player_current_health: int:
	set(value):
		player_current_health = clamp(value, 0, player_max_health)
		health_changed.emit()

var player_speed: int = 100:
	set(value):
		player_speed = value
		speed_changed.emit()
var player_boost: int = 100:
	set(value):
		player_boost = value
		boost_changed.emit()

var player_max_shield: int = 100:
	set(value):
		player_max_shield = value
		max_shield_changed.emit()
var player_current_shield: int:
	set(value):
		player_current_shield = clamp(value, 0, player_max_shield)
		shield_changed.emit()
var shield_recharge_time: int = 5:
	set(value):
		shield_recharge_time = value
		shield_recharge_time_changed.emit()
var player_shield_is_recharging: bool = false
var shield_recharging_value: float = 0.0



var player_money: int = 200:
	set(value):
		player_money = value
		money_changed.emit()

# MAIN SCENES AND LEVELS
var main_scene: PackedScene = preload("res://Scenes/Game/main.tscn")
var player_upgrade_scene: PackedScene = preload("res://Scenes/UI/player_upgrade_scene.tscn")

# SMALLER SCENES
var bullet_scene: PackedScene = preload("res://Scenes/Projectiles/bullet.tscn")
var laser_scene: PackedScene = preload("res://Scenes/Projectiles/laser.tscn")
var missile_scene: PackedScene = preload("res://Scenes/Projectiles/missile.tscn")
var coin_scene: PackedScene = preload("res://Scenes/coin_pickup.tscn")

var enemy_bullet_scene: PackedScene = preload("res://Scenes/Enemies/EnemyProjectiles/enemy_bullet.tscn")


func _ready():
	randomize()



