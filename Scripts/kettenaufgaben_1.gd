extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var add_oder_sub : int = randi() %2 #0 = addition, 1 = subtraktion
	var zahl1 : int = 0
	var zahl2 : int = 0
	var zahl3 : int = 0
	var ergebnis : int = 0
	if add_oder_sub == 0: #addition
		zahl1 = randi() %9 +1
		zahl2 = randi() %9 +1
		zahl3 = randi() %9 +1
		ergebnis = zahl1 + zahl2 + zahl3
		while (ergebnis > 10 or ergebnis < 8):
			zahl1 = randi() %9 +1
			zahl2 = randi() %9 +1
			zahl3 = randi() %9 +1
			ergebnis = zahl1 + zahl2 + zahl3
	else: #subtraktion
		zahl1 = randi() %3 +8
		zahl2 = randi() %9 +1
		zahl3 = randi() %9 +1
		ergebnis = zahl1 - zahl2 - zahl3
		while (ergebnis <= 0):
			zahl1 = randi() %3 +8
			zahl2 = randi() %9 +1
			zahl3 = randi() %9 +1
			ergebnis = zahl1 - zahl2 - zahl3
	_aufgabe_anzeigen(add_oder_sub, zahl1, zahl2, zahl3)
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(ergebnis)
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)


func _aufgabe_anzeigen(add_oder_sub : int, zahl1 : int, zahl2 : int, zahl3 : int) -> void:
	if add_oder_sub == 0: #addition
		$AufgabenPanel/Plus/Label.text = "+"
		$AufgabenPanel/Plus2/Label.text = "+"
	else:
		$AufgabenPanel/Plus/Label.text = "-"
		$AufgabenPanel/Plus2/Label.text = "-"
	$AufgabenPanel/Zahl1/Label.text = str(zahl1)
	$AufgabenPanel/Zahl2/Label.text = str(zahl2)
	$AufgabenPanel/Zahl3/Label.text = str(zahl3)
