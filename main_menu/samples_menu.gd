extends Control


func _on_ff7_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ff7_main_menu/ff7_main_menu.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")
