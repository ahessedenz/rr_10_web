extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var minuend : int = randi() %4 +2
	$AufgabenPanel/Minuend/Label.text = str(minuend)
	var zufall_subtrahend : int = randi() %4 +1
	while zufall_subtrahend >= minuend:
		zufall_subtrahend = randi() %4 +1
	var quotient : int = minuend - zufall_subtrahend
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(quotient)
	$AufgabenPanel/Subtrahend/Label.text = str(zufall_subtrahend)
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)
