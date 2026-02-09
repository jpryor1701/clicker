class_name BeerPriceUpgradeButton
extends GameButton

var upgrade_cost: int = 2

func _ready() -> void:
	update_label()


func button_interaction() -> void:
	if upgrade_cost <= GameData.game_stats[GameData.game_stats_enum.GOLD]:
		GameData.beer_stats[GameData.beer_stats_enum.SELL_PRICE] += 1
		GameData.game_stats[GameData.game_stats_enum.GOLD] -= upgrade_cost
		upgrade_cost += 10
		GlobalSignals.gold_update.emit()
		#GlobalSignals.upgrade_beer_amount.emit()
		GlobalSignals.beer_stats_update.emit()
		update_label()


func update_label() -> void:
	label.text = "Increase price by 1 for %s gold" % upgrade_cost
	#label.text = "Add 1 beer for %s gold" % upgrade_cost
