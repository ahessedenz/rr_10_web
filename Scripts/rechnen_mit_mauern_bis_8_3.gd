extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var nullZaehler: int = 0
	var summand1 : int = randi()%7
	var summand2 : int = randi()%7
	var summand3 : int = randi()%7
	var summand4 : int = randi()%7
	if summand1 == 0:
		nullZaehler += 1
	if summand2 == 0:
		nullZaehler += 1
	if summand3 == 0:
		nullZaehler += 1
	if summand4 == 0:
		nullZaehler += 1
	var zwischensummeMitte1 : int = summand1 + summand2
	var zwischensummeMitte2 : int = summand2 + summand3
	var zwischensummeMitte3 : int = summand3 + summand4
	var zwischensummeOben1 : int = zwischensummeMitte1 + zwischensummeMitte2
	var zwischensummeOben2 : int = zwischensummeMitte2 + zwischensummeMitte3
	var summe : int = zwischensummeOben1 + zwischensummeOben2
	while summe > 8 or nullZaehler > 1:
		nullZaehler = 0
		summand1 = randi()%7
		summand2 = randi()%7
		summand3 = randi()%7
		summand4 = randi()%7
		if summand1 == 0:
			nullZaehler += 1
		if summand2 == 0:
			nullZaehler += 1
		if summand3 == 0:
			nullZaehler += 1
		if summand4 == 0:
			nullZaehler += 1
		zwischensummeMitte1 = summand1 + summand2
		zwischensummeMitte2 = summand2 + summand3
		zwischensummeMitte3 = summand3 + summand4
		zwischensummeOben1 = zwischensummeMitte1 + zwischensummeMitte2
		zwischensummeOben2 = zwischensummeMitte2 + zwischensummeMitte3
		summe = zwischensummeOben1 + zwischensummeOben2
	_zahlen_anzeigen(summand1, summand2, summand3, summand4)
	$AufgabenPanel/MauerGrafiken/BlockMitteLinks/Eingabefeld_Zahl._setze_gesucht(zwischensummeMitte1)
	$AufgabenPanel/MauerGrafiken/BlockMitteMitte/Eingabefeld_Zahl._setze_gesucht(zwischensummeMitte2)
	$AufgabenPanel/MauerGrafiken/BlockMitteRechts/Eingabefeld_Zahl._setze_gesucht(zwischensummeMitte3)
	$AufgabenPanel/MauerGrafiken/BlockObenLinks/Eingabefeld_Zahl._setze_gesucht(zwischensummeOben1)
	$AufgabenPanel/MauerGrafiken/BlockObenRechts/Eingabefeld_Zahl._setze_gesucht(zwischensummeOben2)
	$AufgabenPanel/MauerGrafiken/BlockSpitze/Eingabefeld_Zahl._setze_gesucht(summe)
	$AufgabenPanel/MauerGrafiken/BlockMitteLinks/Eingabefeld_Zahl.setActive(true)


func _zahlen_anzeigen(z1 : int, z2 : int, z3 : int, z4: int) -> void:
	$AufgabenPanel/MauerGrafiken/BlockUntenLinks/Label.text = str(z1)
	$AufgabenPanel/MauerGrafiken/BlockUntenMitteLinks/Label.text = str(z2)
	$AufgabenPanel/MauerGrafiken/BlockUntenMitteRechts/Label.text = str(z3)
	$AufgabenPanel/MauerGrafiken/BlockUntenRechts/Label.text = str(z4)
