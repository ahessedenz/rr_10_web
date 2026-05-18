extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var zufallswert : int = randi() %3 +2
	var zufall_handwert_gegeben : int = randi() %5
	while zufall_handwert_gegeben > zufallswert:
		zufall_handwert_gegeben = randi() %5
	var welche_hand : int = randi() %2 #0 = links, 1 = rechts
	if welche_hand == 1:
		_tausche_anzeigepositionen()
	_zeige_zahlenwerte_an(zufallswert, zufall_handwert_gegeben)
	$AufgabenPanel/PanelUntenLinks/Eingabefeld_Zahl._setze_gesucht(zufallswert - zufall_handwert_gegeben)
	$AufgabenPanel/PanelUntenLinks/Eingabefeld_Zahl.setActive(true)


func _tausche_anzeigepositionen() -> void:
	$AufgabenPanel/PanelUntenLinks.position.x += 500
	$AufgabenPanel/PanelUntenRechts.position.x -= 500


func _zeige_zahlenwerte_an(gesamtzahl : int, gegeben : int) -> void:
	$AufgabenPanel/OberesPanel/Zahlanzeige/Label.text = str(gesamtzahl)
	$AufgabenPanel/PanelUntenRechts/Zahlanzeige/Label.text = str(gegeben)
