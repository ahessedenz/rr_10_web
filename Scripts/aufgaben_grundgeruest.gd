extends Control


var eingabefelder : Array = []


func _ready():
	eingabefelder.append_array(get_tree().get_nodes_in_group("Eingabefeld"))


func _on_zurueck_button_pressed():
	if !GlobaleVariablen.aktuelles_zwischenmenue == null:
		get_tree().change_scene_to_file(GlobaleVariablen.aktuelles_zwischenmenue)
	else:
		get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_naechste_aufgabe_timer_timeout():
	get_tree().reload_current_scene()


func korrekt_geloest():
	if eingabefelder.size() == 0:
		return
	for e in eingabefelder:
		if !e.korrekt:
			return
	$NaechsteAufgabeTimer.start()


func _einagbefeld_hinzufuegen(feld : Label) -> void:
	eingabefelder.append(feld)
