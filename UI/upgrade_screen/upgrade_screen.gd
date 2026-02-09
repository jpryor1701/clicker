class_name UpgradeScreen
extends Control

@onready var beers: Label = $Panel/MarginContainer/VBoxContainer/Beers
@onready var beer_price: Label = $"Panel/MarginContainer/VBoxContainer/Beer Price"


func _ready() -> void:
	GlobalSignals.beer_stats_update.connect(_on_update_beer_stats)
	update_labels()

func update_labels() -> void:
	beers.text = "Beers: %s" % GameData.beer_stats[GameData.beer_stats_enum.BEER]
	beer_price.text = "Beer Price: %s" % GameData.beer_stats[GameData.beer_stats_enum.SELL_PRICE]


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_Q and event.is_pressed():
			visible = !visible


func _on_update_beer_stats() -> void:
	update_labels()

func _on_exit_screen_button_pressed() -> void:
	hide()
