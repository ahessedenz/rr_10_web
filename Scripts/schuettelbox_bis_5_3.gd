extends Control


func _ready() -> void:
	randomize()
	$AufgabenPanel/PanelUntenLinks.visible = false
	$AufgabenPanel/PanelUntenRechts.visible = false
	_erzeuge_aufgabe()
	_schuetteln()


func _erzeuge_aufgabe() -> void:
	var zufallswert : int = randi() %4 +2
	$AufgabenPanel/Zahlanzeige/Zahl.text = str(zufallswert)
	var zufall_handwert_links : int = 0
	var rng : int = randi() %10
	if rng == 0:
		rng = randi() %2
		if rng == 0:
			zufall_handwert_links = 0
		else:
			zufall_handwert_links = zufallswert
	else:
		zufall_handwert_links = randi() %4 +1
		while zufall_handwert_links >= zufallswert:
			zufall_handwert_links = randi() %4 +1
	$AufgabenPanel/PanelUntenLinks/Label/Label.text = str(zufall_handwert_links)
	$AufgabenPanel/PanelUntenRechts/Eingabefeld_Zahl._setze_gesucht(zufallswert - zufall_handwert_links)
	var zufall_seite : int = randi() %2 #0 = links angezeigt, 1 = rechts angezeigt
	if zufall_seite == 1:
		$AufgabenPanel/PanelUntenLinks.position.x = 500
		$AufgabenPanel/PanelUntenRechts.position.x = 0
	$AufgabenPanel/PanelUntenRechts/Eingabefeld_Zahl.setActive(true)


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	$AufgabenPanel/PanelUntenLinks.visible = true
	$AufgabenPanel/PanelUntenRechts.visible = true


func _schuetteln() -> void:
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer.play("schuetteln")
