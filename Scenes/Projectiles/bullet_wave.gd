class_name BulletWave
extends Projectile

# variables for wave shooting
var time: float = 0.0
var amplitude: float = 2
var frequency: int = 10


func _ready():
	damage = 1
	projectile_speed = 100


func _physics_process(delta):
	var x_pos = projectile_speed * delta
	time += delta
	var y_pos = cos(time * frequency) * amplitude * frequency
	position += Vector2(x_pos, y_pos)
