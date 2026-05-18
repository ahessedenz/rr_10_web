extends Control


var phase : int = 0
var plus_oder_minus : int = 0


const RECHENSCHIFF_PLUS = preload("res://Scenes/rechenschiff_addition.tscn")
const RECHENSCHIFF_MINUS = preload("res://Scenes/rechenschiff_subtraktion.tscn")


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
	plus_oder_minus = randi() %2
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
	
	_aufgabe_anzeigen(zahl1, ergebnis, plus_oder_minus)
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(zahl1)
	$AufgabenPanel/Eingabefeld_Rechenzeichen._setze_gesucht(plus_oder_minus)
	$AufgabenPanel/Eingabefeld_Zahl2._setze_gesucht(zahl2)
	$AufgabenPanel/Ergebnis/Label.text = str(ergebnis)
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)
	#$AufgabenPanel/Rechenschiff.gesucht = ergebnis
	
	#_aufgabe_anzeigen(zufall_summand1)
	#$AufgabenPanel/Summand/Label.text = str(ergebnis - zufall_summand1)
	


func _aufgabe_anzeigen(zahl : int, ergebnis : int, plus_minus : int) -> void:
	var rechenschiff
	if plus_minus == 0: #plus
		rechenschiff = RECHENSCHIFF_PLUS.instantiate()
	else:
		rechenschiff = RECHENSCHIFF_MINUS.instantiate()
	$AufgabenPanel.add_child(rechenschiff)
	rechenschiff.scale = Vector2(0.3, 0.3)
	rechenschiff.position = Vector2(164, 70)
	$AufgabenPanel/Eingabefeld_Rechenzeichen.next = rechenschiff
	rechenschiff.next = $AufgabenPanel/Eingabefeld_Zahl2
	rechenschiff.startwert = zahl
	rechenschiff._startwert_anzeigen()
	rechenschiff.gesucht = ergebnis
	$AufgabenGrundgeruest._einagbefeld_hinzufuegen(rechenschiff)


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
		$Zahlbuttons.visible = true
		$Zahlbuttons.z_index = 0
		$Rechenzeichenbuttons.visible = false
		$Rechenzeichenbuttons.z_index = -1
		if plus_oder_minus == 0: #plus
			for i in $Zahlbuttons.get_children():
				i.kugeln = true
				i._set_GrafikAnzeige()
		else: #minus
			for i in $Zahlbuttons.get_children():
				i.kugeln = true
				i.gestrichen = true
				i._set_GrafikAnzeige()
		
	elif phase == 2:
		phase += 1
		$AufgabenPanel/Eingabefeld_Zahl2.visible = true
		for i in $Zahlbuttons.get_children():
			i.kugeln = false
			i.gestrichen = false
			i._set_GrafikAnzeige()
