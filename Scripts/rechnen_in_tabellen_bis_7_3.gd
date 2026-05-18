extends Control


func _ready() -> void:
	randomize()
	_anzeigen_ausschalten()
	_erzeuge_aufgabe()


func _anzeigen_ausschalten() -> void:
	$AufgabenPanel/RechtsOben.visible = false
	$AufgabenPanel/Eingabefeld_Zahl2.visible = false


func _erzeuge_aufgabe() -> void:
	var operator : int = randi() %2
	var summand1 : int = 0
	var summand2 : int = 0
	var summand3 : int = 0
	var ergebnis1 : int = 0
	var ergebnis2 : int = 0
	if operator == 0: #+
		summand1 = randi() %6 +1
		summand2 = randi() %6 +1
		summand3 = randi() %6 +1
		while (summand1 + summand2 > 7) or (summand1 + summand3 > 7) or (summand2 == summand3):
			summand1 = randi() %6 +1
			summand2 = randi() %6 +1
			summand3 = randi() %6 +1
		ergebnis1 = summand1 + summand2
		ergebnis2 = summand1 + summand3
	else: #-
		summand1 = randi() %6 +2
		summand2 = randi() %6 +1
		summand3 = randi() %6 +1
		while (summand1 - summand2 <= 0) or (summand1 - summand3 <= 0) or (summand2 == summand3):
			summand1 = randi() %6 +2
			summand2 = randi() %6 +1
			summand3 = randi() %6 +1
		ergebnis1 = summand1 - summand2
		ergebnis2 = summand1 - summand3
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(ergebnis1)
	$AufgabenPanel/Eingabefeld_Zahl2._setze_gesucht(ergebnis2)
	_zahlen_eintragen(operator, summand1, summand2, summand3)
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)


func _zahlen_eintragen(operator : int, zahl1 : int, zahl2 : int, zahl3 : int) -> void:
	if operator == 0:
		$AufgabenPanel/ObenLinks/Kreis/Operator.text = "+"
	else:
		$AufgabenPanel/ObenLinks/Kreis/Operator.text = "-"
		$AufgabenPanel/ObenLinks/Kreis/Operator.position = Vector2(5,0)
	$AufgabenPanel/Links/ZahlLinks.text = str(zahl1)
	$AufgabenPanel/MitteOben/ZahlMitteOben.text = str(zahl2)
	$AufgabenPanel/RechtsOben/ZahlRechtsOben.text = str(zahl3)


func _aktualisiere_Anzeige() -> void:
	$AufgabenPanel/RechtsOben.visible = true
	$AufgabenPanel/Eingabefeld_Zahl2.visible = true
