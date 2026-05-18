extends Control


var style_ergebnisFeld : StyleBoxFlat = StyleBoxFlat.new()


func _ready() -> void:
	randomize()
	$AufgabenPanel/PanelUntenLinks.visible = false
	$AufgabenPanel/PanelUntenRechts.visible = false
	$Kugelbuttons.visible = false
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var zufallswert : int = randi() %3 +2
	_aufgabe_anzeigen(zufallswert)
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(zufallswert)
	var zufall_handwert_links : int = randi() %5
	while zufall_handwert_links > zufallswert:
		zufall_handwert_links = randi() %5
	_hand_anzeigen(zufall_handwert_links)
	$AufgabenPanel/PanelUntenRechts/Eingabefeld_Hand._setze_gesucht(zufallswert - zufall_handwert_links)
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)


func _aufgabe_anzeigen(zahl : int) -> void:
	match zahl:
		2:
			$AufgabenPanel/PanelUnten/Kugeln/Kugel1.visible = false
			$AufgabenPanel/PanelUnten/Kugeln/Kugel4.visible = false
		3:
			$AufgabenPanel/PanelUnten/Kugeln/Kugel4.visible = false
			$AufgabenPanel/PanelUnten/Kugeln/Kugel1.position.x += 62
			$AufgabenPanel/PanelUnten/Kugeln/Kugel2.position.x += 62
			$AufgabenPanel/PanelUnten/Kugeln/Kugel3.position.x += 62


func _hand_anzeigen(zahl : int) -> void:
	match zahl:
		0:
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel1.visible = false
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel2.visible = false
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel3.visible = false
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel4.visible = false
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel5.visible = false
		1:
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel1.visible = false
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel2.visible = false
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel3.visible = false
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel4.visible = false
		2:
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel1.visible = false
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel2.position = Vector2(140, 145)
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel3.position = Vector2(90, 177)
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel4.visible = false
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel5.visible = false
		3:
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel1.visible = false
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel4.visible = false
		4:
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel1.position = Vector2(94, 130)
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel2.position = Vector2(140, 142)
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel3.position = Vector2(87, 179)
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel4.position = Vector2(132, 191)
			$AufgabenPanel/PanelUntenLinks/Hand/Kugel5.visible = false


func _aktualisiere_Anzeige() -> void:
	$AufgabenPanel/PanelUntenLinks.visible = true
	$AufgabenPanel/PanelUntenRechts.visible = true
	$Zahlbuttons.visible = false
	$Kugelbuttons.visible = true


func _aufmerksamkeitssteuerung_ein() -> void:
	var width : int = 10
	style_ergebnisFeld.bg_color = Color.WHITE
	style_ergebnisFeld.border_width_bottom = width
	style_ergebnisFeld.border_width_left = width
	style_ergebnisFeld.border_width_right = width
	style_ergebnisFeld.border_width_top = width
	style_ergebnisFeld.border_color = Color(0.392,0.392,0.392)
	$AufgabenPanel/PanelUntenRechts.set("theme_override_styles/panel", style_ergebnisFeld)


func _aufmerksamkeitssteuerung_aus() -> void:
	var width : int = 2
	style_ergebnisFeld.border_width_bottom = width
	style_ergebnisFeld.border_width_left = width
	style_ergebnisFeld.border_width_right = width
	style_ergebnisFeld.border_width_top = 4
	style_ergebnisFeld.border_color = Color.BLACK
	$AufgabenPanel/PanelUntenRechts.set("theme_override_styles/panel", style_ergebnisFeld)


func _feedback_richtig() -> void:
	var width : int = 2
	style_ergebnisFeld.bg_color = Color.GREEN
	style_ergebnisFeld.border_width_bottom = width
	style_ergebnisFeld.border_width_left = width
	style_ergebnisFeld.border_width_right = width
	style_ergebnisFeld.border_width_top = 4
	style_ergebnisFeld.border_color = Color.BLACK
	$AufgabenPanel/PanelUntenRechts.set("theme_override_styles/panel", style_ergebnisFeld)


func _feedback_falsch() -> void:
	var width : int = 2
	style_ergebnisFeld.bg_color = Color.RED
	style_ergebnisFeld.border_width_bottom = width
	style_ergebnisFeld.border_width_left = width
	style_ergebnisFeld.border_width_right = width
	style_ergebnisFeld.border_width_top = 4
	style_ergebnisFeld.border_color = Color.BLACK
	$AufgabenPanel/PanelUntenRechts.set("theme_override_styles/panel", style_ergebnisFeld)
