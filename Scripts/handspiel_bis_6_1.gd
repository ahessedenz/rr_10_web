extends Control


func _ready() -> void:
	randomize()
	$AufgabenPanel/ZweitesPanel.visible = false
	$AufgabenPanel/PanelUntenLinks.visible = false
	$AufgabenPanel/PanelUntenRechts.visible = false
	$AufgabenPanel/Plus.visible = false
	_erzeuge_aufgabe()
	$AnzeigenTimer.start()


func _erzeuge_aufgabe() -> void:
	var zufall_handwert_links : int = randi() %7
	_hand_anzeigen(zufall_handwert_links)
	$AufgabenPanel/PanelUntenLinks/Eingabefeld_Zahl._setze_gesucht(zufall_handwert_links)
	$AufgabenPanel/PanelUntenRechts/Eingabefeld_Zahl2._setze_gesucht(6 - zufall_handwert_links)
	$AufgabenPanel/PanelUntenLinks/Eingabefeld_Zahl.setActive(true)
	var zufallsseite : int = randi() %2 #0 = links wird Zahl angezeigt, 1 = rechts wird Zahl angezeigt
	if zufallsseite == 1:
		_seiten_tauschen(zufall_handwert_links)


func _seiten_tauschen(anzahl : int) -> void:
	$AufgabenPanel/ZweitesPanel/HandLinks.position.x += 500
	$AufgabenPanel/ZweitesPanel/HandRechts.position.x -= 500
	$AufgabenPanel/ZweitesPanel/HandLinks.flip_h = true
	$AufgabenPanel/ZweitesPanel/HandRechts.flip_h = true
	match anzahl:
		1:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.position = Vector2(100, 150)
		2:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.position = Vector2(115, 135)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.position = Vector2(85, 187)
		3:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.position = Vector2(120, 125)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.position = Vector2(80, 200)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.position = Vector2(100, 162)
		4:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.position = Vector2(73, 145)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.position = Vector2(118, 132)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.position = Vector2(88, 191)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.position = Vector2(131, 178)
		5:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.position = Vector2(65, 145)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.position = Vector2(125, 125)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.position = Vector2(80, 205)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.position = Vector2(131, 185)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.position = Vector2(98, 165)
		6:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.position = Vector2(125, 120)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.position = Vector2(80, 135)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.position = Vector2(125, 195)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.position = Vector2(82, 215)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.position = Vector2(125, 158)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel6.position = Vector2(80, 175)
	$AufgabenPanel/PanelUntenLinks.position.x += 500
	$AufgabenPanel/PanelUntenRechts.position.x -= 500
	_feld_anpassen()


func _feld_anpassen() -> void:
	var style_feld_links : StyleBoxFlat = StyleBoxFlat.new()
	style_feld_links.bg_color = Color(1, 0.875, 0.2, 1)
	style_feld_links.border_width_left = 2
	style_feld_links.border_width_top = 2
	style_feld_links.border_width_right = 0
	style_feld_links.border_width_bottom = 2
	style_feld_links.border_color = Color.BLACK
	$AufgabenPanel/PanelUntenRechts.set("theme_override_styles/panel", style_feld_links)
	var style_feld_rechts : StyleBoxFlat = StyleBoxFlat.new()
	style_feld_rechts.bg_color = Color(1, 0.875, 0.2, 1)
	style_feld_rechts.border_width_left = 0
	style_feld_rechts.border_width_top = 2
	style_feld_rechts.border_width_right = 2
	style_feld_rechts.border_width_bottom = 2
	style_feld_rechts.border_color = Color.BLACK
	$AufgabenPanel/PanelUntenLinks.set("theme_override_styles/panel", style_feld_rechts)


func _hand_anzeigen(zahl : int) -> void:
	match zahl:
		0:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel6.visible = false
		1:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.position = Vector2(113, 165)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel6.visible = false
		2:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.position = Vector2(140, 145)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.position = Vector2(90, 177)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel6.visible = false
		3:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.position = Vector2(148, 145)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.position = Vector2(75, 179)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.position = Vector2(113, 165)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel6.visible = false
		4:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.position = Vector2(94, 130)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.position = Vector2(140, 142)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.position = Vector2(87, 179)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.position = Vector2(132, 191)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel6.visible = false
		5:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.position = Vector2(90, 125)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.position = Vector2(148, 145)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.position = Vector2(75, 179)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.position = Vector2(133, 208)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.position = Vector2(113, 165)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel6.visible = false


func _on_timer_timeout() -> void:
	$AufgabenPanel/ZweitesPanel.visible = true
	$AufgabenPanel/PanelUntenLinks.visible = true
	$AufgabenPanel/PanelUntenRechts.visible = true
	$AufgabenPanel/Plus.visible = true
