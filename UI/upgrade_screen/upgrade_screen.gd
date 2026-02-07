class_name UpgradeScreen
extends Control


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_Q and event.is_pressed():
			visible = !visible


func _on_exit_screen_button_pressed() -> void:
	hide()
