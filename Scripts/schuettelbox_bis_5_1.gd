extends Control


var style_ergebnisFeld : StyleBoxFlat = StyleBoxFlat.new()


func _ready() -> void:
	randomize()
	$AufgabenPanel/PanelUntenLinks.visible = false
	$AufgabenPanel/Eingabefeld_kugeln.visible = false
	$Kugelbuttons.visible = false
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var zufallswert : int = randi() %4 +2
	_aufgabe_anzeigen(zufallswert)
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(zufallswert)
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
	_hand_anzeigen(zufall_handwert_links)
	$AufgabenPanel/Eingabefeld_kugeln._setze_gesucht(zufallswert - zufall_handwert_links)
	var zufall_seite : int = randi() %2 #0 = links angezeigt, 1 = rechts angezeigt
	if zufall_seite == 1:
		$AufgabenPanel/PanelUntenLinks.position.x = 535
		$AufgabenPanel/Eingabefeld_kugeln.position.x = 0
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)


func _aufgabe_anzeigen(zahl : int) -> void:
	match zahl:
		2:
			$AufgabenPanel/PanelUnten/Kugeln/Kugel1.visible = false
			$AufgabenPanel/PanelUnten/Kugeln/Kugel2.position.x += 62
			$AufgabenPanel/PanelUnten/Kugeln/Kugel3.position.x += 62
			$AufgabenPanel/PanelUnten/Kugeln/Kugel4.visible = false
			$AufgabenPanel/PanelUnten/Kugeln/Kugel5.visible = false
		3:
			$AufgabenPanel/PanelUnten/Kugeln/Kugel1.visible = false
			$AufgabenPanel/PanelUnten/Kugeln/Kugel5.visible = false
		4:
			$AufgabenPanel/PanelUnten/Kugeln/Kugel1.position.x += 62
			$AufgabenPanel/PanelUnten/Kugeln/Kugel2.position.x += 62
			$AufgabenPanel/PanelUnten/Kugeln/Kugel3.position.x += 62
			$AufgabenPanel/PanelUnten/Kugeln/Kugel4.position.x += 62
			$AufgabenPanel/PanelUnten/Kugeln/Kugel5.visible = false


func _hand_anzeigen(zahl : int) -> void:
	match zahl:
		0:
			$AufgabenPanel/PanelUntenLinks/Kugel1.visible = false
			$AufgabenPanel/PanelUntenLinks/Kugel2.visible = false
			$AufgabenPanel/PanelUntenLinks/Kugel3.visible = false
			$AufgabenPanel/PanelUntenLinks/Kugel4.visible = false
			$AufgabenPanel/PanelUntenLinks/Kugel5.visible = false
		1:
			$AufgabenPanel/PanelUntenLinks/Kugel1.visible = false
			$AufgabenPanel/PanelUntenLinks/Kugel2.visible = false
			$AufgabenPanel/PanelUntenLinks/Kugel4.visible = false
			$AufgabenPanel/PanelUntenLinks/Kugel5.visible = false
		2:
			$AufgabenPanel/PanelUntenLinks/Kugel1.visible = false
			$AufgabenPanel/PanelUntenLinks/Kugel2.position.x += 48
			$AufgabenPanel/PanelUntenLinks/Kugel3.position.x += 48
			$AufgabenPanel/PanelUntenLinks/Kugel4.visible = false
			$AufgabenPanel/PanelUntenLinks/Kugel5.visible = false
		3:
			$AufgabenPanel/PanelUntenLinks/Kugel1.visible = false
			$AufgabenPanel/PanelUntenLinks/Kugel5.visible = false
		4:
			$AufgabenPanel/PanelUntenLinks/Kugel1.position.x += 48
			$AufgabenPanel/PanelUntenLinks/Kugel2.position.x += 48
			$AufgabenPanel/PanelUntenLinks/Kugel3.position.x += 48
			$AufgabenPanel/PanelUntenLinks/Kugel4.position.x += 48
			$AufgabenPanel/PanelUntenLinks/Kugel5.visible = false


func _aktualisiere_Anzeige() -> void:
	$AufgabenPanel/PanelUnten/Kugeln.visible = false
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer.play("schuetteln")


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	$AufgabenPanel/PanelUntenLinks.visible = true
	$AufgabenPanel/Eingabefeld_kugeln.visible = true
	$Zahlbuttons.visible = false
	$Kugelbuttons.visible = true
