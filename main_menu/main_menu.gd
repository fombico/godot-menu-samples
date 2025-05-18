extends Control

func _on_samples_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/samples_menu.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/options_menu.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
