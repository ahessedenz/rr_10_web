extends Control


var phase : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausschalten()
	_erzeuge_aufgabe()


func _anzeigen_ausschalten() -> void:
	$AufgabenPanel/Fragezeichen.visible = false
	$AufgabenPanel/PanelRechts.visible = false
	$AufgabenPanel/Gleichheitszeichen.visible = false
	$AufgabenPanel/Eingabefeld_Rechenzeichen.visible = false
	$AufgabenPanel/Eingabefeld_Zahl2.visible = false
	$AufgabenPanel/Eingabefeld_Ergebnis.visible = false
	$AufgabenPanel/Polygon2DRechts.visible = false
	$Rechenzeichenbuttons.visible = false
	$Rechenzeichenbuttons.z_index = -1


func _erzeuge_aufgabe() -> void:
	var zahl1 : int = 0
	var zahl2 : int = 0
	var ergebnis : int = 0
	var plus_oder_minus : int = randi() %2
	if plus_oder_minus == 0: #plus-Aufgabe
		zahl1 = randi() %9 +1
		zahl2 = randi() %9 +1
		while (zahl1 + zahl2 < 7) or (zahl1 + zahl2 > 10):
			zahl1 = randi() %9 +1
			zahl2 = randi() %9 +1
		ergebnis = zahl1 + zahl2
	else: #minus-Aufgabe
		zahl1 = randi() %4 +7
		zahl2 = randi() %9 +1
		while (zahl1 <= zahl2):
			zahl1 = randi() %4 +7
			zahl2 = randi() %9 +1
		ergebnis = zahl1 - zahl2
	
	_aufgabe_anzeigen(zahl1, ergebnis)
	_gesucht_setzen(zahl1, plus_oder_minus, zahl2, ergebnis)
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)


func _gesucht_setzen(zahl1 : int, rechenzeichen : int, zahl2 : int, ergebnis : int) -> void:
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(zahl1)
	if zahl1 == 10:
		$AufgabenPanel/Eingabefeld_Zahl.position.x -= 15
	$AufgabenPanel/Eingabefeld_Rechenzeichen._setze_gesucht(rechenzeichen)
	$AufgabenPanel/Eingabefeld_Zahl2._setze_gesucht(zahl2)
	if zahl2 == 10:
		$AufgabenPanel/Eingabefeld_Zahl2.position.x -= 15
	$AufgabenPanel/Eingabefeld_Ergebnis._setze_gesucht(ergebnis)
	if ergebnis == 10:
		$AufgabenPanel/Eingabefeld_Ergebnis.position.x -= 15


func _aufgabe_anzeigen(zahl1 : int, ergebnis : int) -> void:
	var rng : int = randi() %6
	var abbildung1 : CompressedTexture2D
	var abbildung2 : CompressedTexture2D
	var pfad1 : String = ""
	var pfad2 : String = ""
	match rng:
		0:
			pfad1 = "res://Assets/Sachrechnen/Apfel/Apfel" + str(zahl1) + ".png"
			pfad2 = "res://Assets/Sachrechnen/Apfel/Apfel" + str(ergebnis) + ".png"
		1:
			pfad1 = "res://Assets/Sachrechnen/Buecher/Buecher_" + str(zahl1) + ".png"
			pfad2 = "res://Assets/Sachrechnen/Buecher/Buecher_" + str(ergebnis) + ".png"
		2:
			pfad1 = "res://Assets/Sachrechnen/Eierkarton10/10erEierkarton_" + str(zahl1) + ".png"
			pfad2 = "res://Assets/Sachrechnen/Eierkarton10/10erEierkarton_" + str(ergebnis) + ".png"
		3:
			pfad1 = "res://Assets/Sachrechnen/Steckwuerfel/Steckwuerfel" + str(zahl1) + ".png"
			pfad2 = "res://Assets/Sachrechnen/Steckwuerfel/Steckwuerfel" + str(ergebnis) + ".png"
		4:
			pfad1 = "res://Assets/Sachrechnen/Tennisball/Tennisball" + str(zahl1) + ".png"
			pfad2 = "res://Assets/Sachrechnen/Tennisball/Tennisball" + str(ergebnis) + ".png"
		5:
			pfad1 = "res://Assets/Sachrechnen/Zug/Zug_" + str(zahl1) + ".png"
			pfad2 = "res://Assets/Sachrechnen/Zug/Zug_" + str(ergebnis) + ".png"
	abbildung1 = load(pfad1)
	abbildung2 = load(pfad2)
	$AufgabenPanel/PanelLinks/Abbildung1.texture = abbildung1
	$AufgabenPanel/PanelRechts/Abbildung2.texture = abbildung2


func _aktualisiere_Anzeige() -> void:
	if phase == 0:
		phase += 1
		$AufgabenPanel/PanelRechts.visible = true
		$AufgabenPanel/Polygon2DRechts.visible = true
		$AufgabenPanel/Eingabefeld_Ergebnis.visible = true
	elif phase == 1:
		phase += 1
		$AufgabenPanel/Fragezeichen.visible = true
		$AufgabenPanel/Gleichheitszeichen.visible = true
		$AufgabenPanel/Eingabefeld_Rechenzeichen.visible = true
		$AufgabenPanel/Eingabefeld_Zahl2.visible = true
		$Zahlbuttons.visible = false
		$Zahlbuttons.z_index = -1
		$Rechenzeichenbuttons.visible = true
		$Rechenzeichenbuttons.z_index = 0
	elif phase == 2:
		phase += 1
		$Zahlbuttons.visible = true
		$Zahlbuttons.z_index = 0
		$Rechenzeichenbuttons.visible = false
		$Rechenzeichenbuttons.z_index = -1
