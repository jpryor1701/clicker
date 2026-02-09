class_name BeerButton
extends GameButton


func _ready() -> void:
	#GlobalSignals.upgrade_beer_amount.connect(update_label)
	GlobalSignals.beer_stats_update.connect(update_label)
	update_label()


func button_interaction() -> void:
	if GameData.beer_stats[GameData.beer_stats_enum.STOCK] <= 0:
		return
	GameData.game_stats[GameData.game_stats_enum.GOLD] += GameData.beer_stats[GameData.beer_stats_enum.SELL_PRICE] * GameData.beer_stats[GameData.beer_stats_enum.BEER]
	GameData.beer_stats[GameData.beer_stats_enum.STOCK] -= GameData.beer_stats[GameData.beer_stats_enum.BEER]
	GlobalSignals.beer_stats_update.emit()
	GlobalSignals.gold_update.emit()


func update_label() -> void:
	label.text = "Sell %s beer for %s gold" % [GameData.beer_stats[GameData.beer_stats_enum.BEER], GameData.beer_stats[GameData.beer_stats_enum.SELL_PRICE]] \
		if GameData.beer_stats[GameData.beer_stats_enum.BEER] == 1 \
		else "Sell %s beers for %s gold" % [GameData.beer_stats[GameData.beer_stats_enum.BEER], GameData.beer_stats[GameData.beer_stats_enum.SELL_PRICE]]
