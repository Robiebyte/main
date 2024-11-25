extends Node2D


var reed_in_chat_zone = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)


func _process(delta):
	if reed_in_chat_zone:
		if Input.is_action_just_pressed("Interact"):
			ControlManager.hide_controls()
			run_dialogue("Chapter_2_level_1")
			Global.inspector = true

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
	
func DialogicSignal(arg: String):
	if arg == "show_controls":
		print("Showing controls")
		ControlManager.show_controls()

func _on_clue_1_body_entered(body):
	if body is Reed:
		reed_in_chat_zone = true


func _on_clue_1_body_exited(body):
	if body is Reed:
		reed_in_chat_zone = false


func _on_area_2d_body_entered(body):
	

func _on_area_2d_body_exited(body):
	pass # Replace with function body.
