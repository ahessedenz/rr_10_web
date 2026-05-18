extends Control


var phase : int = 0


func _ready() -> void:
	randomize()
	_anzeigen_ausschalten()
	_erzeuge_aufgabe()


func _anzeigen_ausschalten() -> void:
	$AufgabenPanel/ObenLinks/Kreis.visible = false
	$AufgabenPanel/ObenRechts/ZahlOben.visible = false


func _erzeuge_aufgabe() -> void:
	var operator : int = randi() %2
	var summand1 : int = 0
	var summand2 : int = 0
	var ergebnis : int = 0
	if operator == 0: #+
		summand1 = randi() %6 +1
		summand2 = randi() %6 +1
		while summand1 + summand2 > 7:
			summand1 = randi() %6 +1
			summand2 = randi() %6 +1
		ergebnis = summand1 + summand2
	else: #-
		summand1 = randi() %6 +2
		summand2 = randi() %6 +1
		while summand1 - summand2 <= 0:
			summand1 = randi() %6 +2
			summand2 = randi() %6 +1
		ergebnis = summand1 - summand2
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(ergebnis)
	_zahlen_eintragen(operator, summand1, summand2)


func _zahlen_eintragen(operator : int, zahl1 : int, zahl2 : int) -> void:
	if operator == 0:
		$AufgabenPanel/ObenLinks/Kreis/Operator.text = "+"
	else:
		$AufgabenPanel/ObenLinks/Kreis/Operator.text = "-"
		$AufgabenPanel/ObenLinks/Kreis/Operator.position = Vector2(5,0)
	$AufgabenPanel/UntenLinks/ZahlLinks.text = str(zahl1)
	$AufgabenPanel/ObenRechts/ZahlOben.text = str(zahl2)


func _on_timer_timeout() -> void:
	if phase == 0:
		$AufgabenPanel/ObenLinks/Kreis.visible = true
	elif phase == 1:
		$AufgabenPanel/ObenRechts/ZahlOben.visible = true
	else:
		$AufgabenPanel/Eingabefeld_Zahl.setActive(true)
		$Timer.stop()
	phase += 1
