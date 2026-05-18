extends Node2D


const DREIECK = preload("res://Assets/Mengen/Dreieck.png")
const QUADRAT = preload("res://Assets/Mengen/Quadrat.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var gleicheForm : int = randi() %2 #0 = gleiche Formen, 1 = ungleiche Formen
	#var gleicheFarbe : int = 0
	#if gleicheForm == 0:
		#gleicheFarbe = 1 #ungleiche Farbe
	#else:
		#gleicheFarbe = 0 #gleiche Farbe
	var menge : int = randi_range(6, 10)
	_setze_mengenanzeige(menge, gleicheForm)
	_setze_gesucht(menge)
	$Aufgabe/EingabefeldZahl.setActive(true)


func _setze_mengenanzeige(menge : int, form : int):
	match menge:
		6:
			$Mengenkreis/Menge6.visible = true
			_setze_form($Mengenkreis/Menge6, form)
			_setze_farbe($Mengenkreis/Menge6)
		7:
			$Mengenkreis/Menge7.visible = true
			_setze_form($Mengenkreis/Menge7, form)
			_setze_farbe($Mengenkreis/Menge7)
		8:
			$Mengenkreis/Menge8.visible = true
			_setze_form($Mengenkreis/Menge8, form)
			_setze_farbe($Mengenkreis/Menge8)
		9:
			$Mengenkreis/Menge9.visible = true
			_setze_form($Mengenkreis/Menge9, form)
			_setze_farbe($Mengenkreis/Menge9)
		10:
			$Mengenkreis/Menge10.visible = true
			_setze_form($Mengenkreis/Menge10, form)
			_setze_farbe($Mengenkreis/Menge10)


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


func _setze_farbe(parent: Control):
	var kinder = parent.get_children()
	var zufallsFarbe1 : int = randi() %5
	var zufallsFarbe2 : int = randi() %5
	while zufallsFarbe1 == zufallsFarbe2:
		zufallsFarbe2 = randi() %5
	if zufallsFarbe1 == 0:
		for i in kinder:
			if kinder.find(i) < 5:
				i.modulate = Color(1, 0, 0, 1)
	elif zufallsFarbe1 == 1:
		for i in kinder:
			if kinder.find(i) < 5:
				i.modulate = Color(0, 1, 0, 1)
	elif zufallsFarbe1 == 2:
		for i in kinder:
			if kinder.find(i) < 5:
				i.modulate = Color(0, 0, 1, 1)
	elif zufallsFarbe1 == 3:
		for i in kinder:
			if kinder.find(i) < 5:
				i.modulate = Color(1, 1, 0, 1)
	else:
		for i in kinder:
			if kinder.find(i) < 5:
				i.modulate = Color(0.5, 0, 1, 1)
	if zufallsFarbe2 == 0:
		for i in kinder:
			if kinder.find(i) >= 5:
				i.modulate = Color(1, 0, 0, 1)
	elif zufallsFarbe2 == 1:
		for i in kinder:
			if kinder.find(i) >= 5:
				i.modulate = Color(0, 1, 0, 1)
	elif zufallsFarbe2 == 2:
		for i in kinder:
			if kinder.find(i) >= 5:
				i.modulate = Color(0, 0, 1, 1)
	elif zufallsFarbe2 == 3:
		for i in kinder:
			if kinder.find(i) >= 5:
				i.modulate = Color(1, 1, 0, 1)
	else:
		for i in kinder:
			if kinder.find(i) >= 5:
				i.modulate = Color(0.5, 0, 1, 1)
	
	#else:
		#for i in kinder:
			#var zufallsFarbe : int = randi() %5
			#if zufallsFarbe == 0:
				#i.modulate = Color(1, 0, 0, 1)
			#elif zufallsFarbe == 1:
				#i.modulate = Color(0, 1, 0, 1)
			#elif zufallsFarbe == 2:
				#i.modulate = Color(0, 0, 1, 1)
			#elif zufallsFarbe == 3:
				#i.modulate = Color(1, 1, 0, 1)
			#else:
				#i.modulate = Color(0.5, 0, 1, 1)


func _setze_gesucht(menge : int):
	$Aufgabe/EingabefeldZahl.gesucht = menge
	$Aufgabe/EingabefeldBreitHand.gesucht = menge
	$Aufgabe/RechenschiffDoppelt.gesucht = menge
	$Aufgabe/EingabefeldBreitStrichliste.gesucht = menge
	$Aufgabe/EingabefeldBreitWuerfel.gesucht = menge
	$Aufgabe/RaketeDoppelt.gesucht = menge


func _switch_buttons(strichliste : bool, wuerfel : bool, hand : bool, schiff : bool, rakete : bool):
	if strichliste:
		$Zahlbuttons/ZahlButtonBreit6.strichliste = true
		$Zahlbuttons/ZahlButtonBreit6.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit6.hand = false
		$Zahlbuttons/ZahlButtonBreit6.schiff = false
		$Zahlbuttons/ZahlButtonBreit6.rakete = false
		$Zahlbuttons/ZahlButtonBreit7.strichliste = true
		$Zahlbuttons/ZahlButtonBreit7.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit7.hand = false
		$Zahlbuttons/ZahlButtonBreit7.schiff = false
		$Zahlbuttons/ZahlButtonBreit7.rakete = false
		$Zahlbuttons/ZahlButtonBreit8.strichliste = true
		$Zahlbuttons/ZahlButtonBreit8.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit8.hand = false
		$Zahlbuttons/ZahlButtonBreit8.schiff = false
		$Zahlbuttons/ZahlButtonBreit8.rakete = false
		$Zahlbuttons/ZahlButtonBreit9.strichliste = true
		$Zahlbuttons/ZahlButtonBreit9.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit9.hand = false
		$Zahlbuttons/ZahlButtonBreit9.schiff = false
		$Zahlbuttons/ZahlButtonBreit9.rakete = false
		$Zahlbuttons/ZahlButtonBreit10.strichliste = true
		$Zahlbuttons/ZahlButtonBreit10.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit10.hand = false
		$Zahlbuttons/ZahlButtonBreit10.schiff = false
		$Zahlbuttons/ZahlButtonBreit10.rakete = false
	elif wuerfel:
		$Zahlbuttons/ZahlButtonBreit6.strichliste = false
		$Zahlbuttons/ZahlButtonBreit6.wuerfel = true
		$Zahlbuttons/ZahlButtonBreit6.hand = false
		$Zahlbuttons/ZahlButtonBreit6.schiff = false
		$Zahlbuttons/ZahlButtonBreit6.rakete = false
		$Zahlbuttons/ZahlButtonBreit7.strichliste = false
		$Zahlbuttons/ZahlButtonBreit7.wuerfel = true
		$Zahlbuttons/ZahlButtonBreit7.hand = false
		$Zahlbuttons/ZahlButtonBreit7.schiff = false
		$Zahlbuttons/ZahlButtonBreit7.rakete = false
		$Zahlbuttons/ZahlButtonBreit8.strichliste = false
		$Zahlbuttons/ZahlButtonBreit8.wuerfel = true
		$Zahlbuttons/ZahlButtonBreit8.hand = false
		$Zahlbuttons/ZahlButtonBreit8.schiff = false
		$Zahlbuttons/ZahlButtonBreit8.rakete = false
		$Zahlbuttons/ZahlButtonBreit9.strichliste = false
		$Zahlbuttons/ZahlButtonBreit9.wuerfel = true
		$Zahlbuttons/ZahlButtonBreit9.hand = false
		$Zahlbuttons/ZahlButtonBreit9.schiff = false
		$Zahlbuttons/ZahlButtonBreit9.rakete = false
		$Zahlbuttons/ZahlButtonBreit10.strichliste = false
		$Zahlbuttons/ZahlButtonBreit10.wuerfel = true
		$Zahlbuttons/ZahlButtonBreit10.hand = false
		$Zahlbuttons/ZahlButtonBreit10.schiff = false
		$Zahlbuttons/ZahlButtonBreit10.rakete = false
	elif hand:
		$Zahlbuttons/ZahlButtonBreit6.strichliste = false
		$Zahlbuttons/ZahlButtonBreit6.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit6.hand = true
		$Zahlbuttons/ZahlButtonBreit6.schiff = false
		$Zahlbuttons/ZahlButtonBreit6.rakete = false
		$Zahlbuttons/ZahlButtonBreit7.strichliste = false
		$Zahlbuttons/ZahlButtonBreit7.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit7.hand = true
		$Zahlbuttons/ZahlButtonBreit7.schiff = false
		$Zahlbuttons/ZahlButtonBreit7.rakete = false
		$Zahlbuttons/ZahlButtonBreit8.strichliste = false
		$Zahlbuttons/ZahlButtonBreit8.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit8.hand = true
		$Zahlbuttons/ZahlButtonBreit8.schiff = false
		$Zahlbuttons/ZahlButtonBreit8.rakete = false
		$Zahlbuttons/ZahlButtonBreit9.strichliste = false
		$Zahlbuttons/ZahlButtonBreit9.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit9.hand = true
		$Zahlbuttons/ZahlButtonBreit9.schiff = false
		$Zahlbuttons/ZahlButtonBreit9.rakete = false
		$Zahlbuttons/ZahlButtonBreit10.strichliste = false
		$Zahlbuttons/ZahlButtonBreit10.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit10.hand = true
		$Zahlbuttons/ZahlButtonBreit10.schiff = false
		$Zahlbuttons/ZahlButtonBreit10.rakete = false
	elif schiff:
		$Zahlbuttons/ZahlButtonBreit6.strichliste = false
		$Zahlbuttons/ZahlButtonBreit6.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit6.hand = false
		$Zahlbuttons/ZahlButtonBreit6.schiff = true
		$Zahlbuttons/ZahlButtonBreit6.rakete = false
		$Zahlbuttons/ZahlButtonBreit7.strichliste = false
		$Zahlbuttons/ZahlButtonBreit7.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit7.hand = false
		$Zahlbuttons/ZahlButtonBreit7.schiff = true
		$Zahlbuttons/ZahlButtonBreit7.rakete = false
		$Zahlbuttons/ZahlButtonBreit8.strichliste = false
		$Zahlbuttons/ZahlButtonBreit8.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit8.hand = false
		$Zahlbuttons/ZahlButtonBreit8.schiff = true
		$Zahlbuttons/ZahlButtonBreit8.rakete = false
		$Zahlbuttons/ZahlButtonBreit9.strichliste = false
		$Zahlbuttons/ZahlButtonBreit9.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit9.hand = false
		$Zahlbuttons/ZahlButtonBreit9.schiff = true
		$Zahlbuttons/ZahlButtonBreit9.rakete = false
		$Zahlbuttons/ZahlButtonBreit10.strichliste = false
		$Zahlbuttons/ZahlButtonBreit10.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit10.hand = false
		$Zahlbuttons/ZahlButtonBreit10.schiff = true
		$Zahlbuttons/ZahlButtonBreit10.rakete = false
	elif rakete:
		$Zahlbuttons/ZahlButtonBreit6.strichliste = false
		$Zahlbuttons/ZahlButtonBreit6.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit6.hand = false
		$Zahlbuttons/ZahlButtonBreit6.schiff = false
		$Zahlbuttons/ZahlButtonBreit6.rakete = true
		$Zahlbuttons/ZahlButtonBreit7.strichliste = false
		$Zahlbuttons/ZahlButtonBreit7.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit7.hand = false
		$Zahlbuttons/ZahlButtonBreit7.schiff = false
		$Zahlbuttons/ZahlButtonBreit7.rakete = true
		$Zahlbuttons/ZahlButtonBreit8.strichliste = false
		$Zahlbuttons/ZahlButtonBreit8.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit8.hand = false
		$Zahlbuttons/ZahlButtonBreit8.schiff = false
		$Zahlbuttons/ZahlButtonBreit8.rakete = true
		$Zahlbuttons/ZahlButtonBreit9.strichliste = false
		$Zahlbuttons/ZahlButtonBreit9.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit9.hand = false
		$Zahlbuttons/ZahlButtonBreit9.schiff = false
		$Zahlbuttons/ZahlButtonBreit9.rakete = true
		$Zahlbuttons/ZahlButtonBreit10.strichliste = false
		$Zahlbuttons/ZahlButtonBreit10.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit10.hand = false
		$Zahlbuttons/ZahlButtonBreit10.schiff = false
		$Zahlbuttons/ZahlButtonBreit10.rakete = true
	else:
		$Zahlbuttons/ZahlButtonBreit6.strichliste = false
		$Zahlbuttons/ZahlButtonBreit6.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit6.hand = false
		$Zahlbuttons/ZahlButtonBreit6.schiff = false
		$Zahlbuttons/ZahlButtonBreit6.rakete = false
		$Zahlbuttons/ZahlButtonBreit7.strichliste = false
		$Zahlbuttons/ZahlButtonBreit7.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit7.hand = false
		$Zahlbuttons/ZahlButtonBreit7.schiff = false
		$Zahlbuttons/ZahlButtonBreit7.rakete = false
		$Zahlbuttons/ZahlButtonBreit8.strichliste = false
		$Zahlbuttons/ZahlButtonBreit8.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit8.hand = false
		$Zahlbuttons/ZahlButtonBreit8.schiff = false
		$Zahlbuttons/ZahlButtonBreit8.rakete = false
		$Zahlbuttons/ZahlButtonBreit9.strichliste = false
		$Zahlbuttons/ZahlButtonBreit9.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit9.hand = false
		$Zahlbuttons/ZahlButtonBreit9.schiff = false
		$Zahlbuttons/ZahlButtonBreit9.rakete = false
		$Zahlbuttons/ZahlButtonBreit10.strichliste = false
		$Zahlbuttons/ZahlButtonBreit10.wuerfel = false
		$Zahlbuttons/ZahlButtonBreit10.hand = false
		$Zahlbuttons/ZahlButtonBreit10.schiff = false
		$Zahlbuttons/ZahlButtonBreit10.rakete = false
	$Zahlbuttons/ZahlButtonBreit6._set_GrafikAnzeige()
	$Zahlbuttons/ZahlButtonBreit7._set_GrafikAnzeige()
	$Zahlbuttons/ZahlButtonBreit8._set_GrafikAnzeige()
	$Zahlbuttons/ZahlButtonBreit9._set_GrafikAnzeige()
	$Zahlbuttons/ZahlButtonBreit10._set_GrafikAnzeige()
	if strichliste or wuerfel or hand or schiff:
		_random_position()
	elif rakete:
		_random_position_schmal()
	else:
		_reset_position()


func _random_position():
	var positionen : Array = [-1, -1, -1, -1, -1]
	for n in 5:
		var rng = randi() %5
		while rng in positionen:
			rng = randi() %5
		positionen[n] = rng
	match positionen[0]:
		0:
			$Zahlbuttons/ZahlButtonBreit6.position = Vector2(279, 1300)
		1:
			$Zahlbuttons/ZahlButtonBreit6.position = Vector2(579, 1300)
		2:
			$Zahlbuttons/ZahlButtonBreit6.position = Vector2(879, 1300)
		3:
			$Zahlbuttons/ZahlButtonBreit6.position = Vector2(1179, 1300)
		4:
			$Zahlbuttons/ZahlButtonBreit6.position = Vector2(1479, 1300)
	match positionen[1]:
		0:
			$Zahlbuttons/ZahlButtonBreit7.position = Vector2(279, 1300)
		1:
			$Zahlbuttons/ZahlButtonBreit7.position = Vector2(579, 1300)
		2:
			$Zahlbuttons/ZahlButtonBreit7.position = Vector2(879, 1300)
		3:
			$Zahlbuttons/ZahlButtonBreit7.position = Vector2(1179, 1300)
		4:
			$Zahlbuttons/ZahlButtonBreit7.position = Vector2(1479, 1300)
	match positionen[2]:
		0:
			$Zahlbuttons/ZahlButtonBreit8.position = Vector2(279, 1300)
		1:
			$Zahlbuttons/ZahlButtonBreit8.position = Vector2(579, 1300)
		2:
			$Zahlbuttons/ZahlButtonBreit8.position = Vector2(879, 1300)
		3:
			$Zahlbuttons/ZahlButtonBreit8.position = Vector2(1179, 1300)
		4:
			$Zahlbuttons/ZahlButtonBreit8.position = Vector2(1479, 1300)
	match positionen[3]:
		0:
			$Zahlbuttons/ZahlButtonBreit9.position = Vector2(279, 1300)
		1:
			$Zahlbuttons/ZahlButtonBreit9.position = Vector2(579, 1300)
		2:
			$Zahlbuttons/ZahlButtonBreit9.position = Vector2(879, 1300)
		3:
			$Zahlbuttons/ZahlButtonBreit9.position = Vector2(1179, 1300)
		4:
			$Zahlbuttons/ZahlButtonBreit9.position = Vector2(1479, 1300)
	match positionen[4]:
		0:
			$Zahlbuttons/ZahlButtonBreit10.position = Vector2(279, 1300)
		1:
			$Zahlbuttons/ZahlButtonBreit10.position = Vector2(579, 1300)
		2:
			$Zahlbuttons/ZahlButtonBreit10.position = Vector2(879, 1300)
		3:
			$Zahlbuttons/ZahlButtonBreit10.position = Vector2(1179, 1300)
		4:
			$Zahlbuttons/ZahlButtonBreit10.position = Vector2(1479, 1300)
	$Zahlbuttons/ZahlButtonBreit6._set_ausgangsposition()
	$Zahlbuttons/ZahlButtonBreit7._set_ausgangsposition()
	$Zahlbuttons/ZahlButtonBreit8._set_ausgangsposition()
	$Zahlbuttons/ZahlButtonBreit9._set_ausgangsposition()
	$Zahlbuttons/ZahlButtonBreit10._set_ausgangsposition()


func _random_position_schmal():
	var positionen : Array = [-1, -1, -1, -1, -1]
	for n in 5:
		var rng = randi() %5
		while rng in positionen:
			rng = randi() %5
		positionen[n] = rng
	match positionen[0]:
		0:
			$Zahlbuttons/ZahlButtonBreit6.position = Vector2(574, 1300)
		1:
			$Zahlbuttons/ZahlButtonBreit6.position = Vector2(754, 1300)
		2:
			$Zahlbuttons/ZahlButtonBreit6.position = Vector2(934, 1300)
		3:
			$Zahlbuttons/ZahlButtonBreit6.position = Vector2(1114, 1300)
		4:
			$Zahlbuttons/ZahlButtonBreit6.position = Vector2(1294, 1300)
	match positionen[1]:
		0:
			$Zahlbuttons/ZahlButtonBreit7.position = Vector2(574, 1300)
		1:
			$Zahlbuttons/ZahlButtonBreit7.position = Vector2(754, 1300)
		2:
			$Zahlbuttons/ZahlButtonBreit7.position = Vector2(934, 1300)
		3:
			$Zahlbuttons/ZahlButtonBreit7.position = Vector2(1114, 1300)
		4:
			$Zahlbuttons/ZahlButtonBreit7.position = Vector2(1294, 1300)
	match positionen[2]:
		0:
			$Zahlbuttons/ZahlButtonBreit8.position = Vector2(574, 1300)
		1:
			$Zahlbuttons/ZahlButtonBreit8.position = Vector2(754, 1300)
		2:
			$Zahlbuttons/ZahlButtonBreit8.position = Vector2(934, 1300)
		3:
			$Zahlbuttons/ZahlButtonBreit8.position = Vector2(1114, 1300)
		4:
			$Zahlbuttons/ZahlButtonBreit8.position = Vector2(1294, 1300)
	match positionen[3]:
		0:
			$Zahlbuttons/ZahlButtonBreit9.position = Vector2(574, 1300)
		1:
			$Zahlbuttons/ZahlButtonBreit9.position = Vector2(754, 1300)
		2:
			$Zahlbuttons/ZahlButtonBreit9.position = Vector2(934, 1300)
		3:
			$Zahlbuttons/ZahlButtonBreit9.position = Vector2(1114, 1300)
		4:
			$Zahlbuttons/ZahlButtonBreit9.position = Vector2(1294, 1300)
	match positionen[4]:
		0:
			$Zahlbuttons/ZahlButtonBreit10.position = Vector2(574, 1300)
		1:
			$Zahlbuttons/ZahlButtonBreit10.position = Vector2(754, 1300)
		2:
			$Zahlbuttons/ZahlButtonBreit10.position = Vector2(934, 1300)
		3:
			$Zahlbuttons/ZahlButtonBreit10.position = Vector2(1114, 1300)
		4:
			$Zahlbuttons/ZahlButtonBreit10.position = Vector2(1294, 1300)
	$Zahlbuttons/ZahlButtonBreit6._set_ausgangsposition()
	$Zahlbuttons/ZahlButtonBreit7._set_ausgangsposition()
	$Zahlbuttons/ZahlButtonBreit8._set_ausgangsposition()
	$Zahlbuttons/ZahlButtonBreit9._set_ausgangsposition()
	$Zahlbuttons/ZahlButtonBreit10._set_ausgangsposition()


func _reset_position():
	$Zahlbuttons/ZahlButtonBreit6.position = Vector2(574, 1300)
	$Zahlbuttons/ZahlButtonBreit7.position = Vector2(754, 1300)
	$Zahlbuttons/ZahlButtonBreit8.position = Vector2(934, 1300)
	$Zahlbuttons/ZahlButtonBreit9.position = Vector2(1114, 1300)
	$Zahlbuttons/ZahlButtonBreit10.position = Vector2(1294, 1300)
	$Zahlbuttons/ZahlButtonBreit6._set_ausgangsposition()
	$Zahlbuttons/ZahlButtonBreit7._set_ausgangsposition()
	$Zahlbuttons/ZahlButtonBreit8._set_ausgangsposition()
	$Zahlbuttons/ZahlButtonBreit9._set_ausgangsposition()
	$Zahlbuttons/ZahlButtonBreit10._set_ausgangsposition()
