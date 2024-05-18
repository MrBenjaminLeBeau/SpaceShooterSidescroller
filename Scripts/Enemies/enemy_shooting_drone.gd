extends Enemy

var projectile_scene: PackedScene

@onready var shot_cooldown_timer: Timer = $ShootingTimer
@onready var firing_point: Marker2D = $Marker2D


func _ready():
	projectile_scene = Globals.enemy_bullet_scene
	health = 5
	direction = Vector2.LEFT
	speed = 50
	collision_damage = 5


func _physics_process(delta):
	position += direction * speed * delta


func _on_shooting_timer_timeout():
	fire_projectile()


func fire_projectile():
	shot_cooldown_timer.start()
	var projectile = projectile_scene.instantiate()
	get_tree().root.add_child(projectile)
	projectile.position = firing_point.global_position
