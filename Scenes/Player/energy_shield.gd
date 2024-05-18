class_name EnergyShield
extends Area2D

var max_health: int = 50
var current_health: int = 50

var shield_active: bool = true

@onready var recharge_timer = $RechargeTimer


func _ready():
	Globals.player_current_shield = Globals.player_max_shield
	recharge_timer.wait_time = Globals.shield_recharge_time


func take_damage(damage):
	print(damage)
	Globals.player_current_shield -= damage
	recharge_timer.start()
	
	if Globals.player_current_shield <= 0:
		visible = false
		shield_active = false
		Globals.player_shield_is_recharging = true


func _on_recharge_timer_timeout():
	visible = true
	shield_active = true
	Globals.player_shield_is_recharging = false
	Globals.player_current_shield = Globals.player_max_shield
	


func _on_area_entered(area):
	if area.is_in_group("EnemyProjectiles"):
		if shield_active:
			take_damage(area.damage)
			print("shield damage")
			area.queue_free()
			
	elif area.is_in_group("Enemy"):
		visible = false
		shield_active = false
		Globals.player_current_shield = 0
		Globals.shield_recharging_value = 0
		recharge_timer.start()
		Globals.player_shield_is_recharging = true
	
