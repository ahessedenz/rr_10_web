extends Control


var phase : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausschalten()
	_erzeuge_aufgabe()


func _anzeigen_ausschalten() -> void:
	$AufgabenPanel/ObenRechts.visible = false
	$AufgabenPanel/LinksUnten.visible = false
	$AufgabenPanel/Eingabefeld_Zahl2.visible = false
	$AufgabenPanel/Eingabefeld_Zahl3.visible = false
	$AufgabenPanel/Eingabefeld_Zahl4.visible = false


func _erzeuge_aufgabe() -> void:
	var operator : int = randi() %2
	var summand1 : int = 0
	var summand2 : int = 0
	var summand3 : int = 0
	var summand4 : int = 0
	var ergebnis1 : int = 0
	var ergebnis2 : int = 0
	var ergebnis3 : int = 0
	var ergebnis4 : int = 0
	if operator == 0: #+
		summand1 = randi() %6 +1
		summand2 = randi() %6 +1
		summand3 = randi() %6 +1
		summand4 = randi() %6 +1
		while (summand1 + summand3 > 7) or (summand1 + summand4 > 7) or (summand2 + summand3 > 7) or (summand2 + summand4 > 7) or (summand1 == summand2) or (summand3 == summand4):
			summand1 = randi() %6 +1
			summand2 = randi() %6 +1
			summand3 = randi() %6 +1
			summand4 = randi() %6 +1
		ergebnis1 = summand1 + summand3
		ergebnis2 = summand1 + summand4
		ergebnis3 = summand2 + summand3
		ergebnis4 = summand2 + summand4
	else: #-
		summand1 = randi() %6 +2
		summand2 = randi() %6 +2
		summand3 = randi() %6 +1
		summand4 = randi() %6 +1
		while (summand1 - summand3 <= 0) or (summand1 - summand4 <= 0) or (summand2 - summand3 <= 0) or (summand2 - summand4 <= 0) or (summand1 == summand2) or (summand3 == summand4):
			summand1 = randi() %6 +2
			summand2 = randi() %6 +2
			summand3 = randi() %6 +1
			summand4 = randi() %6 +1
		ergebnis1 = summand1 - summand3
		ergebnis2 = summand1 - summand4
		ergebnis3 = summand2 - summand3
		ergebnis4 = summand2 - summand4
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(ergebnis1)
	$AufgabenPanel/Eingabefeld_Zahl2._setze_gesucht(ergebnis2)
	$AufgabenPanel/Eingabefeld_Zahl3._setze_gesucht(ergebnis3)
	$AufgabenPanel/Eingabefeld_Zahl4._setze_gesucht(ergebnis4)
	_zahlen_eintragen(operator, summand1, summand2, summand3, summand4)
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)


func _zahlen_eintragen(operator : int, zahl1 : int, zahl2 : int, zahl3 : int, zahl4 : int) -> void:
	if operator == 0:
		$AufgabenPanel/ObenLinks/Kreis/Operator.text = "+"
	else:
		$AufgabenPanel/ObenLinks/Kreis/Operator.text = "-"
		$AufgabenPanel/ObenLinks/Kreis/Operator.position = Vector2(5,0)
	$AufgabenPanel/LinksMitte/ZahlLinksMitte.text = str(zahl1)
	$AufgabenPanel/LinksUnten/ZahlLinksUnten.text = str(zahl2)
	$AufgabenPanel/ObenMitte/ZahlObenMitte.text = str(zahl3)
	$AufgabenPanel/ObenRechts/ZahlObenRechts.text = str(zahl4)


func _aktualisiere_Anzeige() -> void:
	if phase == 0:
		$AufgabenPanel/ObenRechts.visible = true
		$AufgabenPanel/Eingabefeld_Zahl2.visible = true
	elif phase == 1:
		$AufgabenPanel/LinksUnten.visible = true
		$AufgabenPanel/Eingabefeld_Zahl3.visible = true
		$AufgabenPanel/Eingabefeld_Zahl4.visible = true
	else:
		pass
	phase += 1
