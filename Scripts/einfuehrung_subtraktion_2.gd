extends Control


func _ready() -> void:
	randomize()
	_anzeigen_ausschalten()
	_erzeuge_aufgabe()


func _anzeigen_ausschalten() -> void:
	$AufgabenPanel/Arrow.visible = false
	$AufgabenPanel/Minus.visible = false
	$AufgabenPanel/Subtrahend.visible = false
	$AufgabenPanel/Eingabefeld_Zahl2.visible = false


func _erzeuge_aufgabe() -> void:
	var minuend : int = randi() %4 +2
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(minuend)
	_aufgabe_anzeigen(minuend)
	var zufall_subtrahend : int = randi() %4 +1
	while zufall_subtrahend >= minuend:
		zufall_subtrahend = randi() %4 +1
	var quotient : int = minuend - zufall_subtrahend
	$AufgabenPanel/Eingabefeld_Zahl2._setze_gesucht(quotient)
	$AufgabenPanel/Subtrahend/Label.text = str(zufall_subtrahend)
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)


func _aufgabe_anzeigen(zahl : int) -> void:
	$AufgabenPanel/RechenschiffAnzeige.startwert = zahl
	$AufgabenPanel/RechenschiffAnzeige._startwert_anzeigen()


func _aktualisiere_Anzeige() -> void:
	$AufgabenPanel/Arrow.visible = true
	$AufgabenPanel/Minus.visible = true
	$AufgabenPanel/Subtrahend.visible = true
	$AufgabenPanel/Eingabefeld_Zahl2.visible = true
