extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var ergebnis : int = randi() %4 +2
	$AufgabenPanel/Eingabefeld_Zahl2._setze_gesucht(ergebnis)
	var zufall_summand1 : int = randi() %4 +1
	while zufall_summand1 >= ergebnis:
		zufall_summand1 = randi() %4 +1
	$AufgabenPanel/Summand1/Label.text = str(zufall_summand1)
	$AufgabenPanel/Summand/Label.text = str(ergebnis - zufall_summand1)
	$AufgabenPanel/Eingabefeld_Zahl2.setActive(true)
