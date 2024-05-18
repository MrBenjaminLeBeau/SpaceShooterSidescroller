extends Node2D

@onready var player_money_text: RichTextLabel = $CanvasLayer/PlayerMoney

# Engine Upgrade References
@onready var engine_upgrades_menu: HBoxContainer = $CanvasLayer/EnginesUpgrades
@onready var engine_speed_text: Label = $CanvasLayer/EnginesUpgrades/EngineSpeed/CurrentSpeed
@onready var engine_boost_text: Label = $CanvasLayer/EnginesUpgrades/EngineBoost/CurrentBoost

# Shield Upgrade References
@onready var shield_upgrades_menu: HBoxContainer = $CanvasLayer/ShieldsUpgrades
@onready var shield_amount_text: Label = $CanvasLayer/ShieldsUpgrades/ShieldAmount/CurrentShieldAmount
@onready var shield_recharge_text: Label = $CanvasLayer/ShieldsUpgrades/RechargeTime/CurrentShieldRecharge

func _ready():
	player_money_text.text = str(Globals.player_money) + " [img]res://Graphics/coin.png[/img]"
	Globals.connect("money_changed", update_money_text)
	
	# Connect Engine Signals
	Globals.connect("speed_changed", update_engine_speed_text)
	engine_speed_text.text = "Current Engine Speed: " + str(Globals.player_speed)
	Globals.connect("boost_changed", update_engine_boost_text)
	engine_boost_text.text = "Current Boost Amount: " + str(Globals.player_boost)
	
	# Connect Shield Signals
	Globals.connect("max_shield_changed", update_shield_amount_text)
	shield_amount_text.text = "Current Shields: " + str(Globals.player_max_shield)
	Globals.connect("shield_recharge_time_changed", update_shield_recharge_text)
	shield_recharge_text.text = "Current Shield Recharge: " + str(Globals.shield_recharge_time) + " seconds"


func update_money_text():
	player_money_text.text = str(Globals.player_money) + " [img]res://Graphics/coin.png[/img]"


func _on_engines_button_pressed():
	if engine_upgrades_menu.visible == false:
		engine_upgrades_menu.visible = true
		shield_upgrades_menu.visible = false
	else:
		engine_upgrades_menu.visible = false


func update_engine_speed_text():
	engine_speed_text.text = "Current Engine Speed: " + str(Globals.player_speed)


func _on_speed_upgrade_button_pressed():
	if Globals.player_money >= 100:
		Globals.player_money -= 100
		Globals.player_speed += 25


func update_engine_boost_text():
	engine_boost_text.text = "Current Boost Amount: " + str(Globals.player_boost)


func _on_boost_upgrade_button_pressed():
	if Globals.player_money >= 100:
		Globals.player_money -= 100
		Globals.player_boost += 25


func _on_shields_button_pressed():
	if shield_upgrades_menu.visible == false:
		engine_upgrades_menu.visible = false
		shield_upgrades_menu.visible = true
	else:
		shield_upgrades_menu.visible = false


func update_shield_amount_text():
	shield_amount_text.text = "Current Shields: " + str(Globals.player_max_shield)


func _on_shield_upgrade_button_pressed():
	if Globals.player_money >= 100:
		Globals.player_money -= 100
		Globals.player_max_shield += 25


func update_shield_recharge_text():
	shield_recharge_text.text = "Current Shield Recharge: " + str(Globals.shield_recharge_time) + " seconds"


func _on_recharge_upgrade_button_pressed():
	if Globals.player_money >= 100:
		Globals.player_money -= 100
		Globals.shield_recharge_time -= 1





func _on_next_flight_button_pressed():
	get_tree().change_scene_to_packed(Globals.main_scene)









