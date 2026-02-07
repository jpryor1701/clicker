class_name UpgradeBeerAmountButton
extends Button

@onready var label: Label = $Label

var upgrade_cost: int = 2

func _ready() -> void:
	update_label()


func _on_pressed() -> void:
	if upgrade_cost < GameData.stats["gold"]:
		GameData.beer_stats["beers"] += 1
		GameData.stats["gold"] -= upgrade_cost
		upgrade_cost += upgrade_cost
		GlobalSignals.gold_update.emit()
		GlobalSignals.upgrade_beer_amount.emit()
		update_label()


func update_label() -> void:
	label.text = "Add 1 beer for %s gold" % upgrade_cost
