extends Control


var phase : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausschalten()
	_erzeuge_aufgabe()


func _anzeigen_ausschalten() -> void:
	$AufgabenPanel/Arrow.visible = false
	$AufgabenPanel/Plus.visible = false
	$AufgabenPanel/Summand.visible = false
	$AufgabenPanel/Eingabefeld_Zahl2.visible = false


func _erzeuge_aufgabe() -> void:
	var ergebnis : int = randi() %4 +2
	$AufgabenPanel/Rechenschiff.gesucht = ergebnis
	$AufgabenPanel/Eingabefeld_Zahl2._setze_gesucht(ergebnis)
	var zufall_summand1 : int = randi() %4 +1
	while zufall_summand1 >= ergebnis:
		zufall_summand1 = randi() %4 +1
	_aufgabe_anzeigen(zufall_summand1)
	$AufgabenPanel/Summand/Label.text = str(ergebnis - zufall_summand1)
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(zufall_summand1)
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)


func _aufgabe_anzeigen(zahl : int) -> void:
	$AufgabenPanel/Rechenschiff.startwert = zahl
	$AufgabenPanel/Rechenschiff._startwert_anzeigen()


func _aktualisiere_Anzeige() -> void:
	if phase == 0:
		phase += 1
		$AufgabenPanel/Arrow.visible = true
		$AufgabenPanel/Plus.visible = true
		$AufgabenPanel/Summand.visible = true
		for i in $Zahlbuttons.get_children():
			i.kugeln = true
			i._set_GrafikAnzeige()
	elif phase == 1:
		phase += 1
		$AufgabenPanel/Eingabefeld_Zahl2.visible = true
		for i in $Zahlbuttons.get_children():
			i.kugeln = false
			i._set_GrafikAnzeige()
