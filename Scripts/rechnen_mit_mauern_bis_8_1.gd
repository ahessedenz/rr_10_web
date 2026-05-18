extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var summand1 : int = randi()%7 +1
	var summand2 : int = randi()%7 +1
	var summe : int = summand1 + summand2
	while summe > 8:
		summand1 = randi()%7 +1
		summand2 = randi()%7 +1
		summe = summand1 + summand2
	_zahlen_anzeigen(summand1, summand2)
	$AufgabenPanel/MauerGrafiken/BlockOben/Eingabefeld_Zahl._setze_gesucht(summe)
	$AufgabenPanel/MauerGrafiken/BlockOben/Eingabefeld_Zahl.setActive(true)


func _zahlen_anzeigen(z1 : int, z2 : int) -> void:
	$AufgabenPanel/MauerGrafiken/BlockUntenLinks/Label.text = str(z1)
	$AufgabenPanel/MauerGrafiken/BlockUntenRechts/Label.text = str(z2)
