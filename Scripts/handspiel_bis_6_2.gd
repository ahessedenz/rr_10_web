extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var zufall_gesamtanzahl : int = randi() %2 +5
	var zufall_links : int = randi() %zufall_gesamtanzahl +1
	var wert_rechts : int = zufall_gesamtanzahl - zufall_links
	_zeige_zahlenwerte_an(zufall_gesamtanzahl, wert_rechts)
	$AufgabenPanel/PanelUntenLinks/Eingabefeld_Zahl._setze_gesucht(zufall_links)
	$AufgabenPanel/PanelUntenLinks/Eingabefeld_Zahl.setActive(true)
	var zufallsseite : int = randi() %2 #0 = links wird Zahl angezeigt, 1 = rechts wird Zahl angezeigt
	if zufallsseite == 1:
		_seiten_tauschen()


func _zeige_zahlenwerte_an(gesamt : int, rechts : int) -> void:
	$AufgabenPanel/OberesPanel/Zahlanzeige/Label.text = str(gesamt)
	$AufgabenPanel/PanelUntenRechts/Zahlanzeige/Label.text = str(rechts)


func _seiten_tauschen() -> void:
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
