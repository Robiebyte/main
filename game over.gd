extends Node2D

@export var audio_player: AudioStreamPlayer
@onready var fade_overlay = $ColorRect  # Reference to the ColorRect overlay
@onready var timer = $Timer  # Reference to the Timer node
@onready var countdown_label = $Label3  # Reference to the Label node for the countdown display
var tween  # Declare the tween variable

func _ready():

	fade_overlay.modulate.a = 1.0
	tween = create_tween()
	fade_in_scene(1.0)
	if audio_player:
		audio_player.play()
	timer.start()
	timer.timeout.connect(_on_Timer_timeout)


func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)



func _process(delta):
	run_dialogue("Game_Over")
	var minutes = int(timer.time_left) / 60
	var seconds = int(timer.time_left) % 60
	countdown_label.text = "Time Left: %d:%02d" % [minutes, seconds]

# Function to fade in the scene by fading out the overlay
func fade_in_scene(duration: float = 1.0):
	tween.tween_property(
		fade_overlay, "modulate:a", 0, duration
	)

# Function to handle the timer's timeout
func _on_Timer_timeout():
	print("Timer completed. Proceeding to the next action.")
	countdown_label.text = "Time's up!"
	# Example action: transition to another scene or show a menu
	get_tree().change_scene_to_file("res://scene/MainScene.tscn")
