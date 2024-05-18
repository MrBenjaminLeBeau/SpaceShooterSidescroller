extends Control



@onready var player_health_bar: TextureProgressBar = $CanvasLayer/MarginContainer/HBoxContainer/PlayerHealthBar
@onready var player_shield_bar: TextureProgressBar = $CanvasLayer/MarginContainer/HBoxContainer/PlayerShieldBar
@onready var player_money_text: RichTextLabel = $CanvasLayer/MarginContainer2/PlayerMoney


func _ready():
	Globals.connect("health_changed", update_health_text)
	Globals.connect("shield_changed", update_shield_text)
	Globals.connect("money_changed", update_money_text)


func _process(delta):
	if Globals.player_shield_is_recharging:
		player_shield_bar.tint_progress.a = 0.25
		Globals.shield_recharging_value += delta * Globals.player_max_shield / Globals.shield_recharge_time
		player_shield_bar.value = Globals.shield_recharging_value
	else:
		player_shield_bar.tint_progress.a = 1
		Globals.shield_recharging_value = 0


func update_health_text():
	player_health_bar.value = Globals.player_current_health


func update_shield_text():
	player_shield_bar.value = Globals.player_current_shield


func update_money_text():
	player_money_text.text = str(Globals.player_money) + " [img]res://Graphics/coin.png[/img]"

