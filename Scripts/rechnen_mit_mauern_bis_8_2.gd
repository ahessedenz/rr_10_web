extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var summand1 : int = randi()%7 +1
	var summand2 : int = randi()%7 +1
	var summand3 : int = randi()%7 +1
	var zwischensumme1 : int = summand1 + summand2
	var zwischensumme2 : int = summand2 + summand3
	var summe : int = zwischensumme1 + zwischensumme2
	while summe > 8:
		summand1 = randi()%7 +1
		summand2 = randi()%7 +1
		summand3 = randi()%7 +1
		zwischensumme1 = summand1 + summand2
		zwischensumme2 = summand2 + summand3
		summe = zwischensumme1 + zwischensumme2
	_zahlen_anzeigen(summand1, summand2, summand3)
	$AufgabenPanel/MauerGrafiken/BlockMitteLinks/Eingabefeld_Zahl._setze_gesucht(zwischensumme1)
	$AufgabenPanel/MauerGrafiken/BlockMitteRechts/Eingabefeld_Zahl._setze_gesucht(zwischensumme2)
	$AufgabenPanel/MauerGrafiken/BlockOben/Eingabefeld_Zahl._setze_gesucht(summe)
	$AufgabenPanel/MauerGrafiken/BlockMitteLinks/Eingabefeld_Zahl.setActive(true)


func _zahlen_anzeigen(z1 : int, z2 : int, z3 : int) -> void:
	$AufgabenPanel/MauerGrafiken/BlockUntenLinks/Label.text = str(z1)
	$AufgabenPanel/MauerGrafiken/BlockUntenMitte/Label.text = str(z2)
	$AufgabenPanel/MauerGrafiken/BlockUntenRechts/Label.text = str(z3)
