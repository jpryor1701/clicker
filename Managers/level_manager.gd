class_name LevelManager
extends Node2D



@onready var spawner: Marker2D = $Spawner
@onready var beer_bottle: PackedScene = preload("res://Scenes/beer_bottle/beer_bottle.tscn")
@onready var beer_stock: Label = $CanvasLayer/BeerStock


func _ready() -> void:
	GlobalSignals.beer_stats_update.connect(update_label)
	update_label()

func update_label() -> void:
	beer_stock.text = "Stock: %s" % GameData.beer_stats[GameData.beer_stats_enum.STOCK]



func _on_button_pressed() -> void:
	for bottle in GameData.beer_stats[GameData.beer_stats_enum.BEER]:
		var new_beer_bottle = beer_bottle.instantiate()
		add_child(new_beer_bottle)
		new_beer_bottle.global_position = Vector2(spawner.global_position.x, spawner.global_position.y + randf_range(-100, 100))


func _on_buy_beer_button_pressed() -> void:
	if GameData.game_stats[GameData.game_stats_enum.GOLD] <= 0:
		return
	GameData.beer_stats[GameData.beer_stats_enum.STOCK] += 6
	GameData.game_stats[GameData.game_stats_enum.GOLD] -= 3
	GlobalSignals.beer_stats_update.emit()
	GlobalSignals.gold_update.emit()
