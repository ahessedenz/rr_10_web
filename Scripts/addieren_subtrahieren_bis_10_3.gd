extends Control


func _ready() -> void:
	randomize()
	_anzeigen_ausschalten()
	_erzeuge_aufgabe()


func _anzeigen_ausschalten() -> void:
#	$AufgabenPanel/Eingabefeld_Zahl2.visible = false
	$Zahlbuttons.visible = false
	$Zahlbuttons.z_index = -1


func _erzeuge_aufgabe() -> void:
	var zahl1 : int = 0
	var zahl2 : int = 0
	var ergebnis : int = 0
	var plus_oder_minus : int = randi() %2
	if plus_oder_minus == 0: #plus-Aufgabe
		zahl1 = randi() %9 +1
		zahl2 = randi() %9 +1
		ergebnis = zahl1 + zahl2
		while (ergebnis > 10 or ergebnis < 8):
			zahl1 = randi() %9 +1
			zahl2 = randi() %9 +1
			ergebnis = zahl1 + zahl2
	else: #minus-Aufgabe
		zahl1 = randi() %3 +8
		zahl2 = randi() %9 +1
		ergebnis = zahl1 - zahl2
		while ergebnis <= 0:
			zahl1 = randi() %3 +8
			zahl2 = randi() %9 +1
			ergebnis = zahl1 - zahl2
	_aufgabe_anzeigen(zahl1, ergebnis)
	_setze_gesucht(zahl2, plus_oder_minus)
	
	$AufgabenPanel/Eingabefeld_Rechenzeichen.setActive(true)


func _aufgabe_anzeigen(zahl1 : int, ergebnis : int) -> void:
	if zahl1 >= 10:
		$AufgabenPanel/Zahl1.size.x = 190
		$AufgabenPanel/Zahl1/Label.size.x = 190
		$AufgabenPanel/Zahl1.position.x -= 30
	$AufgabenPanel/Zahl1/Label.text = str(zahl1)
	if ergebnis >= 10:
		$AufgabenPanel/Ergebnis.size.x = 190
		$AufgabenPanel/Ergebnis/Label.size.x = 190
	$AufgabenPanel/Ergebnis/Label.text = str(ergebnis)


func _setze_gesucht(zahl2 : int, plus_oder_minus : int) -> void:
	$AufgabenPanel/Eingabefeld_Rechenzeichen._setze_gesucht(plus_oder_minus)
	$AufgabenPanel/Eingabefeld_Zahl2._setze_gesucht(zahl2)


func _aktualisiere_Anzeige() -> void:
#	$AufgabenPanel/Eingabefeld_Zahl2.visible = true
	$Zahlbuttons.visible = true
	$Zahlbuttons.z_index = 0
	$Rechenzeichenbuttons.visible = false
	$Rechenzeichenbuttons.z_index = -1
