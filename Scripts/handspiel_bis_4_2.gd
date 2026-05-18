extends Control


func _ready() -> void:
	randomize()
	$AufgabenPanel/ZweitesPanel.visible = false
	$AufgabenPanel/PanelUntenLinks.visible = false
	$AufgabenPanel/PanelUntenRechts.visible = false
	_erzeuge_aufgabe()
	$AnzeigenTimer.start()


func _erzeuge_aufgabe() -> void:
	var zufall_handwert_links : int = randi() %5
	_hand_anzeigen(zufall_handwert_links)
	$AufgabenPanel/PanelUntenLinks/Eingabefeld_Zahl._setze_gesucht(zufall_handwert_links)
	$AufgabenPanel/PanelUntenRechts/Eingabefeld_Zahl2._setze_gesucht(4 - zufall_handwert_links)
	$AufgabenPanel/PanelUntenLinks/Eingabefeld_Zahl.setActive(true)
	#var zufallsseite : int = randi() %2 #0 = links wird Zahl angezeigt, 1 = rechts wird Zahl angezeigt
	#if zufallsseite == 1:
		#_seiten_tauschen()


func _seiten_tauschen() -> void:
	$AufgabenPanel/ZweitesPanel/HandLinks.position.x += 500
	$AufgabenPanel/ZweitesPanel/HandRechts.position.x -= 500
	$AufgabenPanel/ZweitesPanel/HandLinks.flip_h = true
	$AufgabenPanel/ZweitesPanel/HandRechts.flip_h = true
	$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.position = Vector2(62, 146)
	$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.position = Vector2(121, 127)
	$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.position = Vector2(82, 211)
	$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.position = Vector2(135, 180)
	$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.position = Vector2(97, 170)
	$AufgabenPanel/PanelUntenLinks.position.x += 500
	$AufgabenPanel/PanelUntenRechts.position.x -= 500


func _hand_anzeigen(zahl : int) -> void:
	match zahl:
		0:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.visible = false
		1:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.visible = false
		2:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.position = Vector2(140, 145)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.position = Vector2(90, 177)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.visible = false
		3:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.visible = false
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.visible = false
		4:
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel1.position = Vector2(94, 130)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel2.position = Vector2(140, 142)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel3.position = Vector2(87, 179)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel4.position = Vector2(132, 191)
			$AufgabenPanel/ZweitesPanel/HandLinks/Kugel5.visible = false


func _on_timer_timeout() -> void:
	$AufgabenPanel/ZweitesPanel.visible = true
	$AufgabenPanel/PanelUntenLinks.visible = true
	$AufgabenPanel/PanelUntenRechts.visible = true
