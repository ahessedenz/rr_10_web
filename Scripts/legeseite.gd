extends Node2D


const DREIECK = preload("res://Assets/Mengen/Dreieck.png")
const QUADRAT = preload("res://Assets/Mengen/Quadrat.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var gleicheForm : int = randi() %2 #0 = gleiche Formen, 1 = ungleiche Formen
	var gleicheFarbe : int = 0
	if gleicheForm == 0:
		gleicheFarbe = 1 #ungleiche Farbe
	else:
		gleicheFarbe = 0 #gleiche Farbe
	var menge : int = randi() %6
	_setze_mengenanzeige(menge, gleicheForm, gleicheFarbe)
	_setze_gesucht(menge)
	$Aufgabe/EingabefeldZahl.setActive(true)


func _setze_mengenanzeige(menge : int, form : int, farbe : int):
	match menge:
		0:
			pass
		1:
			$Mengenkreis/Menge1.visible = true
			_setze_form($Mengenkreis/Menge1, form)
			_setze_farbe($Mengenkreis/Menge1, farbe)
		2:
			$Mengenkreis/Menge2.visible = true
			_setze_form($Mengenkreis/Menge2, form)
			_setze_farbe($Mengenkreis/Menge2, farbe)
		3:
			$Mengenkreis/Menge3.visible = true
			_setze_form($Mengenkreis/Menge3, form)
			_setze_farbe($Mengenkreis/Menge3, farbe)
		4:
			$Mengenkreis/Menge4.visible = true
			_setze_form($Mengenkreis/Menge4, form)
			_setze_farbe($Mengenkreis/Menge4, farbe)
		5:
			$Mengenkreis/Menge5.visible = true
			_setze_form($Mengenkreis/Menge5, form)
			_setze_farbe($Mengenkreis/Menge5, farbe)


func _setze_form(parent : Control, form : int):
	var kinder = parent.get_children()
	if form == 0:
		var zufallsForm : int = randi() %3
		if zufallsForm == 0:
			pass
		elif zufallsForm == 1:
			for i in kinder:
				i.texture = DREIECK
		else:
			for i in kinder:
				i.texture = QUADRAT
	else:
		for i in kinder:
			var zufallsForm : int = randi() %3
			if zufallsForm == 0:
				pass
			elif zufallsForm == 1:
				i.texture = DREIECK
			else:
				i.texture = QUADRAT


func _setze_farbe(parent: Control, farbe : int):
	var kinder = parent.get_children()
	if farbe == 0:
		var zufallsFarbe : int = randi() %5
		if zufallsFarbe == 0:
			for i in kinder:
				i.modulate = Color(1, 0, 0, 1)
		elif zufallsFarbe == 1:
			for i in kinder:
				i.modulate = Color(0, 1, 0, 1)
		elif zufallsFarbe == 2:
			for i in kinder:
				i.modulate = Color(0, 0, 1, 1)
		elif zufallsFarbe == 3:
			for i in kinder:
				i.modulate = Color(1, 1, 0, 1)
		else:
			for i in kinder:
				i.modulate = Color(0.5, 0, 1, 1)
	else:
		for i in kinder:
			var zufallsFarbe : int = randi() %5
			if zufallsFarbe == 0:
				i.modulate = Color(1, 0, 0, 1)
			elif zufallsFarbe == 1:
				i.modulate = Color(0, 1, 0, 1)
			elif zufallsFarbe == 2:
				i.modulate = Color(0, 0, 1, 1)
			elif zufallsFarbe == 3:
				i.modulate = Color(1, 1, 0, 1)
			else:
				i.modulate = Color(0.5, 0, 1, 1)


func _setze_gesucht(menge : int):
	$Aufgabe/EingabefeldZahl.gesucht = menge
	$Aufgabe/EingabefeldHand.gesucht = menge
	$Aufgabe/Rechenschiff.gesucht = menge
	$Aufgabe/EingabefeldStrichliste.gesucht = menge
	$Aufgabe/EingabefeldWuerfel.gesucht = menge
	$Aufgabe/Rakete.gesucht = menge


func _switch_buttons(strichliste : bool, wuerfel : bool, hand : bool, schiff : bool, rakete : bool):
	if strichliste:
		$Zahlbuttons/ZahlButton0.strichliste = true
		$Zahlbuttons/ZahlButton0.wuerfel = false
		$Zahlbuttons/ZahlButton0.hand = false
		$Zahlbuttons/ZahlButton0.schiff = false
		$Zahlbuttons/ZahlButton0.rakete = false
		$Zahlbuttons/ZahlButton1.strichliste = true
		$Zahlbuttons/ZahlButton1.wuerfel = false
		$Zahlbuttons/ZahlButton1.hand = false
		$Zahlbuttons/ZahlButton1.schiff = false
		$Zahlbuttons/ZahlButton1.rakete = false
		$Zahlbuttons/ZahlButton2.strichliste = true
		$Zahlbuttons/ZahlButton2.wuerfel = false
		$Zahlbuttons/ZahlButton2.hand = false
		$Zahlbuttons/ZahlButton2.schiff = false
		$Zahlbuttons/ZahlButton2.rakete = false
		$Zahlbuttons/ZahlButton3.strichliste = true
		$Zahlbuttons/ZahlButton3.wuerfel = false
		$Zahlbuttons/ZahlButton3.hand = false
		$Zahlbuttons/ZahlButton3.schiff = false
		$Zahlbuttons/ZahlButton3.rakete = false
		$Zahlbuttons/ZahlButton4.strichliste = true
		$Zahlbuttons/ZahlButton4.wuerfel = false
		$Zahlbuttons/ZahlButton4.hand = false
		$Zahlbuttons/ZahlButton4.schiff = false
		$Zahlbuttons/ZahlButton4.rakete = false
		$Zahlbuttons/ZahlButton5.strichliste = true
		$Zahlbuttons/ZahlButton5.wuerfel = false
		$Zahlbuttons/ZahlButton5.hand = false
		$Zahlbuttons/ZahlButton5.schiff = false
		$Zahlbuttons/ZahlButton5.rakete = false
	elif wuerfel:
		$Zahlbuttons/ZahlButton0.strichliste = false
		$Zahlbuttons/ZahlButton0.wuerfel = true
		$Zahlbuttons/ZahlButton0.hand = false
		$Zahlbuttons/ZahlButton0.schiff = false
		$Zahlbuttons/ZahlButton0.rakete = false
		$Zahlbuttons/ZahlButton1.strichliste = false
		$Zahlbuttons/ZahlButton1.wuerfel = true
		$Zahlbuttons/ZahlButton1.hand = false
		$Zahlbuttons/ZahlButton1.schiff = false
		$Zahlbuttons/ZahlButton1.rakete = false
		$Zahlbuttons/ZahlButton2.strichliste = false
		$Zahlbuttons/ZahlButton2.wuerfel = true
		$Zahlbuttons/ZahlButton2.hand = false
		$Zahlbuttons/ZahlButton2.schiff = false
		$Zahlbuttons/ZahlButton2.rakete = false
		$Zahlbuttons/ZahlButton3.strichliste = false
		$Zahlbuttons/ZahlButton3.wuerfel = true
		$Zahlbuttons/ZahlButton3.hand = false
		$Zahlbuttons/ZahlButton3.schiff = false
		$Zahlbuttons/ZahlButton3.rakete = false
		$Zahlbuttons/ZahlButton4.strichliste = false
		$Zahlbuttons/ZahlButton4.wuerfel = true
		$Zahlbuttons/ZahlButton4.hand = false
		$Zahlbuttons/ZahlButton4.schiff = false
		$Zahlbuttons/ZahlButton4.rakete = false
		$Zahlbuttons/ZahlButton5.strichliste = false
		$Zahlbuttons/ZahlButton5.wuerfel = true
		$Zahlbuttons/ZahlButton5.hand = false
		$Zahlbuttons/ZahlButton5.schiff = false
		$Zahlbuttons/ZahlButton5.rakete = false
	elif hand:
		$Zahlbuttons/ZahlButton0.strichliste = false
		$Zahlbuttons/ZahlButton0.wuerfel = false
		$Zahlbuttons/ZahlButton0.hand = true
		$Zahlbuttons/ZahlButton0.schiff = false
		$Zahlbuttons/ZahlButton0.rakete = false
		$Zahlbuttons/ZahlButton1.strichliste = false
		$Zahlbuttons/ZahlButton1.wuerfel = false
		$Zahlbuttons/ZahlButton1.hand = true
		$Zahlbuttons/ZahlButton1.schiff = false
		$Zahlbuttons/ZahlButton1.rakete = false
		$Zahlbuttons/ZahlButton2.strichliste = false
		$Zahlbuttons/ZahlButton2.wuerfel = false
		$Zahlbuttons/ZahlButton2.hand = true
		$Zahlbuttons/ZahlButton2.schiff = false
		$Zahlbuttons/ZahlButton2.rakete = false
		$Zahlbuttons/ZahlButton3.strichliste = false
		$Zahlbuttons/ZahlButton3.wuerfel = false
		$Zahlbuttons/ZahlButton3.hand = true
		$Zahlbuttons/ZahlButton3.schiff = false
		$Zahlbuttons/ZahlButton3.rakete = false
		$Zahlbuttons/ZahlButton4.strichliste = false
		$Zahlbuttons/ZahlButton4.wuerfel = false
		$Zahlbuttons/ZahlButton4.hand = true
		$Zahlbuttons/ZahlButton4.schiff = false
		$Zahlbuttons/ZahlButton4.rakete = false
		$Zahlbuttons/ZahlButton5.strichliste = false
		$Zahlbuttons/ZahlButton5.wuerfel = false
		$Zahlbuttons/ZahlButton5.hand = true
		$Zahlbuttons/ZahlButton5.schiff = false
		$Zahlbuttons/ZahlButton5.rakete = false
	elif schiff:
		$Zahlbuttons/ZahlButton0.strichliste = false
		$Zahlbuttons/ZahlButton0.wuerfel = false
		$Zahlbuttons/ZahlButton0.hand = false
		$Zahlbuttons/ZahlButton0.schiff = true
		$Zahlbuttons/ZahlButton0.rakete = false
		$Zahlbuttons/ZahlButton1.strichliste = false
		$Zahlbuttons/ZahlButton1.wuerfel = false
		$Zahlbuttons/ZahlButton1.hand = false
		$Zahlbuttons/ZahlButton1.schiff = true
		$Zahlbuttons/ZahlButton1.rakete = false
		$Zahlbuttons/ZahlButton2.strichliste = false
		$Zahlbuttons/ZahlButton2.wuerfel = false
		$Zahlbuttons/ZahlButton2.hand = false
		$Zahlbuttons/ZahlButton2.schiff = true
		$Zahlbuttons/ZahlButton2.rakete = false
		$Zahlbuttons/ZahlButton3.strichliste = false
		$Zahlbuttons/ZahlButton3.wuerfel = false
		$Zahlbuttons/ZahlButton3.hand = false
		$Zahlbuttons/ZahlButton3.schiff = true
		$Zahlbuttons/ZahlButton3.rakete = false
		$Zahlbuttons/ZahlButton4.strichliste = false
		$Zahlbuttons/ZahlButton4.wuerfel = false
		$Zahlbuttons/ZahlButton4.hand = false
		$Zahlbuttons/ZahlButton4.schiff = true
		$Zahlbuttons/ZahlButton4.rakete = false
		$Zahlbuttons/ZahlButton5.strichliste = false
		$Zahlbuttons/ZahlButton5.wuerfel = false
		$Zahlbuttons/ZahlButton5.hand = false
		$Zahlbuttons/ZahlButton5.schiff = true
		$Zahlbuttons/ZahlButton5.rakete = false
	elif rakete:
		$Zahlbuttons/ZahlButton0.strichliste = false
		$Zahlbuttons/ZahlButton0.wuerfel = false
		$Zahlbuttons/ZahlButton0.hand = false
		$Zahlbuttons/ZahlButton0.schiff = false
		$Zahlbuttons/ZahlButton0.rakete = true
		$Zahlbuttons/ZahlButton1.strichliste = false
		$Zahlbuttons/ZahlButton1.wuerfel = false
		$Zahlbuttons/ZahlButton1.hand = false
		$Zahlbuttons/ZahlButton1.schiff = false
		$Zahlbuttons/ZahlButton1.rakete = true
		$Zahlbuttons/ZahlButton2.strichliste = false
		$Zahlbuttons/ZahlButton2.wuerfel = false
		$Zahlbuttons/ZahlButton2.hand = false
		$Zahlbuttons/ZahlButton2.schiff = false
		$Zahlbuttons/ZahlButton2.rakete = true
		$Zahlbuttons/ZahlButton3.strichliste = false
		$Zahlbuttons/ZahlButton3.wuerfel = false
		$Zahlbuttons/ZahlButton3.hand = false
		$Zahlbuttons/ZahlButton3.schiff = false
		$Zahlbuttons/ZahlButton3.rakete = true
		$Zahlbuttons/ZahlButton4.strichliste = false
		$Zahlbuttons/ZahlButton4.wuerfel = false
		$Zahlbuttons/ZahlButton4.hand = false
		$Zahlbuttons/ZahlButton4.schiff = false
		$Zahlbuttons/ZahlButton4.rakete = true
		$Zahlbuttons/ZahlButton5.strichliste = false
		$Zahlbuttons/ZahlButton5.wuerfel = false
		$Zahlbuttons/ZahlButton5.hand = false
		$Zahlbuttons/ZahlButton5.schiff = false
		$Zahlbuttons/ZahlButton5.rakete = true
	else:
		$Zahlbuttons/ZahlButton0.strichliste = false
		$Zahlbuttons/ZahlButton0.wuerfel = false
		$Zahlbuttons/ZahlButton0.hand = false
		$Zahlbuttons/ZahlButton0.schiff = false
		$Zahlbuttons/ZahlButton0.rakete = false
		$Zahlbuttons/ZahlButton1.strichliste = false
		$Zahlbuttons/ZahlButton1.wuerfel = false
		$Zahlbuttons/ZahlButton1.hand = false
		$Zahlbuttons/ZahlButton1.schiff = false
		$Zahlbuttons/ZahlButton1.rakete = false
		$Zahlbuttons/ZahlButton2.strichliste = false
		$Zahlbuttons/ZahlButton2.wuerfel = false
		$Zahlbuttons/ZahlButton2.hand = false
		$Zahlbuttons/ZahlButton2.schiff = false
		$Zahlbuttons/ZahlButton2.rakete = false
		$Zahlbuttons/ZahlButton3.strichliste = false
		$Zahlbuttons/ZahlButton3.wuerfel = false
		$Zahlbuttons/ZahlButton3.hand = false
		$Zahlbuttons/ZahlButton3.schiff = false
		$Zahlbuttons/ZahlButton3.rakete = false
		$Zahlbuttons/ZahlButton4.strichliste = false
		$Zahlbuttons/ZahlButton4.wuerfel = false
		$Zahlbuttons/ZahlButton4.hand = false
		$Zahlbuttons/ZahlButton4.schiff = false
		$Zahlbuttons/ZahlButton4.rakete = false
		$Zahlbuttons/ZahlButton5.strichliste = false
		$Zahlbuttons/ZahlButton5.wuerfel = false
		$Zahlbuttons/ZahlButton5.hand = false
		$Zahlbuttons/ZahlButton5.schiff = false
		$Zahlbuttons/ZahlButton5.rakete = false
	$Zahlbuttons/ZahlButton0._set_GrafikAnzeige()
	$Zahlbuttons/ZahlButton1._set_GrafikAnzeige()
	$Zahlbuttons/ZahlButton2._set_GrafikAnzeige()
	$Zahlbuttons/ZahlButton3._set_GrafikAnzeige()
	$Zahlbuttons/ZahlButton4._set_GrafikAnzeige()
	$Zahlbuttons/ZahlButton5._set_GrafikAnzeige()
	if strichliste or wuerfel or hand or schiff or rakete:
		_random_position()
	else:
		_reset_position()


func _random_position():
	var positionen : Array = [-1, -1, -1, -1, -1, -1]
	for n in 6:
		var rng = randi() %6
		while rng in positionen:
			rng = randi() %6
		positionen[n] = rng
	match positionen[0]:
		0:
			$Zahlbuttons/ZahlButton0.position = Vector2(494, 1300)
		1:
			$Zahlbuttons/ZahlButton0.position = Vector2(674, 1300)
		2:
			$Zahlbuttons/ZahlButton0.position = Vector2(854, 1300)
		3:
			$Zahlbuttons/ZahlButton0.position = Vector2(1034, 1300)
		4:
			$Zahlbuttons/ZahlButton0.position = Vector2(1214, 1300)
		5:
			$Zahlbuttons/ZahlButton0.position = Vector2(1394, 1300)
	match positionen[1]:
		0:
			$Zahlbuttons/ZahlButton1.position = Vector2(494, 1300)
		1:
			$Zahlbuttons/ZahlButton1.position = Vector2(674, 1300)
		2:
			$Zahlbuttons/ZahlButton1.position = Vector2(854, 1300)
		3:
			$Zahlbuttons/ZahlButton1.position = Vector2(1034, 1300)
		4:
			$Zahlbuttons/ZahlButton1.position = Vector2(1214, 1300)
		5:
			$Zahlbuttons/ZahlButton1.position = Vector2(1394, 1300)
	match positionen[2]:
		0:
			$Zahlbuttons/ZahlButton2.position = Vector2(494, 1300)
		1:
			$Zahlbuttons/ZahlButton2.position = Vector2(674, 1300)
		2:
			$Zahlbuttons/ZahlButton2.position = Vector2(854, 1300)
		3:
			$Zahlbuttons/ZahlButton2.position = Vector2(1034, 1300)
		4:
			$Zahlbuttons/ZahlButton2.position = Vector2(1214, 1300)
		5:
			$Zahlbuttons/ZahlButton2.position = Vector2(1394, 1300)
	match positionen[3]:
		0:
			$Zahlbuttons/ZahlButton3.position = Vector2(494, 1300)
		1:
			$Zahlbuttons/ZahlButton3.position = Vector2(674, 1300)
		2:
			$Zahlbuttons/ZahlButton3.position = Vector2(854, 1300)
		3:
			$Zahlbuttons/ZahlButton3.position = Vector2(1034, 1300)
		4:
			$Zahlbuttons/ZahlButton3.position = Vector2(1214, 1300)
		5:
			$Zahlbuttons/ZahlButton3.position = Vector2(1394, 1300)
	match positionen[4]:
		0:
			$Zahlbuttons/ZahlButton4.position = Vector2(494, 1300)
		1:
			$Zahlbuttons/ZahlButton4.position = Vector2(674, 1300)
		2:
			$Zahlbuttons/ZahlButton4.position = Vector2(854, 1300)
		3:
			$Zahlbuttons/ZahlButton4.position = Vector2(1034, 1300)
		4:
			$Zahlbuttons/ZahlButton4.position = Vector2(1214, 1300)
		5:
			$Zahlbuttons/ZahlButton4.position = Vector2(1394, 1300)
	match positionen[5]:
		0:
			$Zahlbuttons/ZahlButton5.position = Vector2(494, 1300)
		1:
			$Zahlbuttons/ZahlButton5.position = Vector2(674, 1300)
		2:
			$Zahlbuttons/ZahlButton5.position = Vector2(854, 1300)
		3:
			$Zahlbuttons/ZahlButton5.position = Vector2(1034, 1300)
		4:
			$Zahlbuttons/ZahlButton5.position = Vector2(1214, 1300)
		5:
			$Zahlbuttons/ZahlButton5.position = Vector2(1394, 1300)
	$Zahlbuttons/ZahlButton0._set_ausgangsposition()
	$Zahlbuttons/ZahlButton1._set_ausgangsposition()
	$Zahlbuttons/ZahlButton2._set_ausgangsposition()
	$Zahlbuttons/ZahlButton3._set_ausgangsposition()
	$Zahlbuttons/ZahlButton4._set_ausgangsposition()
	$Zahlbuttons/ZahlButton5._set_ausgangsposition()


func _reset_position():
	$Zahlbuttons/ZahlButton0.position = Vector2(494, 1300)
	$Zahlbuttons/ZahlButton1.position = Vector2(674, 1300)
	$Zahlbuttons/ZahlButton2.position = Vector2(854, 1300)
	$Zahlbuttons/ZahlButton3.position = Vector2(1034, 1300)
	$Zahlbuttons/ZahlButton4.position = Vector2(1214, 1300)
	$Zahlbuttons/ZahlButton5.position = Vector2(1394, 1300)
	$Zahlbuttons/ZahlButton0._set_ausgangsposition()
	$Zahlbuttons/ZahlButton1._set_ausgangsposition()
	$Zahlbuttons/ZahlButton2._set_ausgangsposition()
	$Zahlbuttons/ZahlButton3._set_ausgangsposition()
	$Zahlbuttons/ZahlButton4._set_ausgangsposition()
	$Zahlbuttons/ZahlButton5._set_ausgangsposition()
