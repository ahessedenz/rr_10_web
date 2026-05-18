extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var add_vorne_oder_hinten : int = randi() %2 #0 = add vorne, 1 = add hinten
	var zahl1 : int = 0
	var zahl2 : int = 0
	var zahl3 : int = 0
	var zwischenergebnis : int = 0
	var ergebnis : int = 0
	if add_vorne_oder_hinten == 0: #add vorne
		zahl1 = randi() %10 +1
		zahl2 = randi() %10 +1
		zahl3 = randi() %10 +1
		zwischenergebnis = zahl1 + zahl2
		ergebnis = zahl1 + zahl2 - zahl3
		while (ergebnis > 10 or ergebnis <= 0) or zwischenergebnis > 10:
			zahl1 = randi() %10 +1
			zahl2 = randi() %10 +1
			zahl3 = randi() %10 +1
			zwischenergebnis = zahl1 + zahl2
			ergebnis = zahl1 + zahl2 - zahl3
	else: #add hinten
		zahl1 = randi() %10 +1
		zahl2 = randi() %10 +1
		zahl3 = randi() %10 +1
		zwischenergebnis = zahl1 - zahl2
		ergebnis = zahl1 - zahl2 + zahl3
		while (ergebnis > 10 or ergebnis <= 0) or zwischenergebnis <= 0:
			zahl1 = randi() %10 +1
			zahl2 = randi() %10 +1
			zahl3 = randi() %10 +1
			zwischenergebnis = zahl1 - zahl2
			ergebnis = zahl1 - zahl2 + zahl3
	_aufgabe_anzeigen(add_vorne_oder_hinten, zahl1, zahl2, zahl3)
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(ergebnis)
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)


func _aufgabe_anzeigen(add_vorne : int, zahl1 : int, zahl2 : int, zahl3 : int) -> void:
	if add_vorne == 0: #add vorne
		$AufgabenPanel/Plus/Label.text = "+"
		$AufgabenPanel/Plus2/Label.text = "-"
	else:
		$AufgabenPanel/Plus/Label.text = "-"
		$AufgabenPanel/Plus2/Label.text = "+"
	$AufgabenPanel/Zahl1/Label.text = str(zahl1)
	$AufgabenPanel/Zahl2/Label.text = str(zahl2)
	$AufgabenPanel/Zahl3/Label.text = str(zahl3)
