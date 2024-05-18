extends Enemy


func _ready():
	health = 10
	direction = Vector2.LEFT
	speed = 100
	collision_damage = 10


func _physics_process(delta):
	position += direction * speed * delta

