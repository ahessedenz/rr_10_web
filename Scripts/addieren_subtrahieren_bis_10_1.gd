extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var add_oder_sub : int = randi() %2 #0 = addition, 1 = subtraktion
	var zahl1 : int = 0
	var zahl2 : int = 0
	var ergebnis : int = 0
	if add_oder_sub == 0: #addition
		zahl1 = randi() %9 +1
		zahl2 = randi() %9 +1
		ergebnis = zahl1 + zahl2
		while (ergebnis > 10 or ergebnis < 8):
			zahl1 = randi() %9 +1
			zahl2 = randi() %9 +1
			ergebnis = zahl1 + zahl2
	else: #subtraktion
		zahl1 = randi() %3 +8
		zahl2 = randi() %9 +1
		ergebnis = zahl1 - zahl2
		while ergebnis <= 0:
			zahl1 = randi() %3 +8
			zahl2 = randi() %9 +1
			ergebnis = zahl1 - zahl2
	_aufgabe_anzeigen(add_oder_sub, zahl1, zahl2)
	$AufgabenPanel/Eingabefeld_Zahl2._setze_gesucht(ergebnis)
	$AufgabenPanel/Eingabefeld_Zahl2.setActive(true)


func _aufgabe_anzeigen(add_oder_sub, zahl1, zahl2) -> void:
	if add_oder_sub == 0: #addition
		$AufgabenPanel/Plus/Label.text = "+"
	else:
		$AufgabenPanel/Plus/Label.text = "-"
	$AufgabenPanel/Zahl1/Label.text = str(zahl1)
	$AufgabenPanel/Zahl2/Label.text = str(zahl2)
	$AufgabenPanel/RechenschiffAnzeige10.startwert = zahl1
	$AufgabenPanel/RechenschiffAnzeige10._startwert_anzeigen()
