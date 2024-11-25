extends Control

@onready var main_menu = preload("res://main_menu.tscn") as PackedScene

var _is_paused:bool = false: 
	set = set_paused
	
	
func _unhandled_input(event: InputEvent) -> void: 
	if event.is_action_pressed("pause"):
		_is_paused = !_is_paused
	
func set_paused(value:bool) ->void: 
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused

func _on_resume_btn_pressed():
	_is_paused = false


func _on_settings_btn_pressed():
	pass


func _on_quit_btn_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_packed(main_menu)
