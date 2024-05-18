extends Sprite2D

const SPEED: int = 20

var direction: Vector2 = Vector2.LEFT


func _ready():
	modulate.a = randf_range(0.2, 0.7)


func _physics_process(delta):
	position += direction * SPEED * delta
