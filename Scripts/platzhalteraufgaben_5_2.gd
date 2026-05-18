extends Control


var phase : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausschalten()
	_erzeuge_aufgabe()


func _anzeigen_ausschalten() -> void:
	$AufgabenPanel/Arrow.visible = false
	$AufgabenPanel/Eingabefeld_Rechenzeichen.visible = false
	$AufgabenPanel/Eingabefeld_Zahl2.visible = false
	$AufgabenPanel/Ergebnis.visible = false
	$Rechenzeichenbuttons.visible = false
	$Rechenzeichenbuttons.z_index = -1


func _erzeuge_aufgabe() -> void:
	var zahl1 : int = 0
	var zahl2 : int = 0
	var ergebnis : int = 0
	var plus_oder_minus : int = randi() %2
	if plus_oder_minus == 0: #plus-Aufgabe
		zahl1 = randi() %4 +1
		ergebnis = randi() %4 +2
		while zahl1 >= ergebnis:
			zahl1 = randi() %4 +1
			ergebnis = randi() %4 +2
		zahl2 = ergebnis - zahl1
	else: #minus-Aufgabe
		zahl1 = randi() %5 +1
		ergebnis = randi() %5
		while zahl1 <= ergebnis:
			zahl1 = randi() %5 +1
			ergebnis = randi() %5
		zahl2 = zahl1 - ergebnis
	
	_aufgabe_anzeigen(zahl1)
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(zahl1)
	$AufgabenPanel/Eingabefeld_Rechenzeichen._setze_gesucht(plus_oder_minus)
	$AufgabenPanel/Eingabefeld_Zahl2._setze_gesucht(zahl2)
	$AufgabenPanel/Ergebnis/Label.text = str(ergebnis)
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)
	


func _aufgabe_anzeigen(zahl : int) -> void:
	$AufgabenPanel/RechenschiffAnzeige.startwert = zahl
	$AufgabenPanel/RechenschiffAnzeige._startwert_anzeigen()


func _aktualisiere_Anzeige() -> void:
	if phase == 0:
		phase += 1
		$AufgabenPanel/Arrow.visible = true
		$AufgabenPanel/Eingabefeld_Rechenzeichen.visible = true
		$AufgabenPanel/Ergebnis.visible = true
		$Zahlbuttons.visible = false
		$Zahlbuttons.z_index = -1
		$Rechenzeichenbuttons.visible = true
		$Rechenzeichenbuttons.z_index = 0
		
	elif phase == 1:
		phase += 1
		$AufgabenPanel/Eingabefeld_Zahl2.visible = true
		$Zahlbuttons.visible = true
		$Zahlbuttons.z_index = 0
		$Rechenzeichenbuttons.visible = false
		$Rechenzeichenbuttons.z_index = -1
