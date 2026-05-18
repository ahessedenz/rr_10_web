extends Button


@export var inactive: bool


func _ready():
	if inactive:
		$ColorRect.color = Color(0.39, 0.39, 0.39)
		disabled = true


func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/legeseite.tscn")
