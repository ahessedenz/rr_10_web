extends Control


func _ready() -> void:
	randomize()
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var add_sub : int = randi() %6 #0 = ++-, 1 = +-+, 2 = -++, 3 = --+, 4 = -+-, 5 = +--
	var zahl1 : int = 0
	var zahl2 : int = 0
	var zahl3 : int = 0
	var zahl4 : int = 0
	var zwischenergebnis1 : int = 0
	var zwischenergebnis2 : int = 0
	var ergebnis : int = 0
	
	match add_sub:
		0: # ++-
			zahl1 = randi() %10 +1
			zahl2 = randi() %10 +1
			zahl3 = randi() %10 +1
			zahl4 = randi() %10 +1
			zwischenergebnis1 = zahl1 + zahl2
			zwischenergebnis2 = zahl1 + zahl2 + zahl3
			ergebnis = zahl1 + zahl2 + zahl3 - zahl4
			while (ergebnis > 10 or ergebnis <= 0) or (zwischenergebnis1 > 10 or zwischenergebnis1 <= 0) or (zwischenergebnis2 > 10 or zwischenergebnis2 <= 0):
				zahl1 = randi() %10 +1
				zahl2 = randi() %10 +1
				zahl3 = randi() %10 +1
				zahl4 = randi() %10 +1
				zwischenergebnis1 = zahl1 + zahl2
				zwischenergebnis2 = zahl1 + zahl2 + zahl3
				ergebnis = zahl1 + zahl2 + zahl3 - zahl4
		1: # +-+
			zahl1 = randi() %10 +1
			zahl2 = randi() %10 +1
			zahl3 = randi() %10 +1
			zahl4 = randi() %10 +1
			zwischenergebnis1 = zahl1 + zahl2
			zwischenergebnis2 = zahl1 + zahl2 - zahl3
			ergebnis = zahl1 + zahl2 - zahl3 + zahl4
			while (ergebnis > 10 or ergebnis <= 0) or (zwischenergebnis1 > 10 or zwischenergebnis1 <= 0) or (zwischenergebnis2 > 10 or zwischenergebnis2 <= 0):
				zahl1 = randi() %10 +1
				zahl2 = randi() %10 +1
				zahl3 = randi() %10 +1
				zahl4 = randi() %10 +1
				zwischenergebnis1 = zahl1 + zahl2
				zwischenergebnis2 = zahl1 + zahl2 - zahl3
				ergebnis = zahl1 + zahl2 - zahl3 + zahl4
		2: # -++
			zahl1 = randi() %10 +1
			zahl2 = randi() %10 +1
			zahl3 = randi() %10 +1
			zahl4 = randi() %10 +1
			zwischenergebnis1 = zahl1 - zahl2
			zwischenergebnis2 = zahl1 - zahl2 + zahl3
			ergebnis = zahl1 - zahl2 + zahl3 + zahl4
			while (ergebnis > 10 or ergebnis <= 0) or (zwischenergebnis1 > 10 or zwischenergebnis1 <= 0) or (zwischenergebnis2 > 10 or zwischenergebnis2 <= 0):
				zahl1 = randi() %10 +1
				zahl2 = randi() %10 +1
				zahl3 = randi() %10 +1
				zahl4 = randi() %10 +1
				zwischenergebnis1 = zahl1 - zahl2
				zwischenergebnis2 = zahl1 - zahl2 + zahl3
				ergebnis = zahl1 - zahl2 + zahl3 + zahl4
		3: # --+
			zahl1 = randi() %10 +1
			zahl2 = randi() %10 +1
			zahl3 = randi() %10 +1
			zahl4 = randi() %10 +1
			zwischenergebnis1 = zahl1 - zahl2
			zwischenergebnis2 = zahl1 - zahl2 - zahl3
			ergebnis = zahl1 - zahl2 - zahl3 + zahl4
			while (ergebnis > 10 or ergebnis <= 0) or (zwischenergebnis1 > 10 or zwischenergebnis1 <= 0) or (zwischenergebnis2 > 10 or zwischenergebnis2 <= 0):
				zahl1 = randi() %10 +1
				zahl2 = randi() %10 +1
				zahl3 = randi() %10 +1
				zahl4 = randi() %10 +1
				zwischenergebnis1 = zahl1 - zahl2
				zwischenergebnis2 = zahl1 - zahl2 - zahl3
				ergebnis = zahl1 - zahl2 - zahl3 + zahl4
		4: # -+-
			zahl1 = randi() %10 +1
			zahl2 = randi() %10 +1
			zahl3 = randi() %10 +1
			zahl4 = randi() %10 +1
			zwischenergebnis1 = zahl1 - zahl2
			zwischenergebnis2 = zahl1 - zahl2 + zahl3
			ergebnis = zahl1 - zahl2 + zahl3 - zahl4
			while (ergebnis > 10 or ergebnis <= 0) or (zwischenergebnis1 > 10 or zwischenergebnis1 <= 0) or (zwischenergebnis2 > 10 or zwischenergebnis2 <= 0):
				zahl1 = randi() %10 +1
				zahl2 = randi() %10 +1
				zahl3 = randi() %10 +1
				zahl4 = randi() %10 +1
				zwischenergebnis1 = zahl1 - zahl2
				zwischenergebnis2 = zahl1 - zahl2 + zahl3
				ergebnis = zahl1 - zahl2 + zahl3 - zahl4
		5: # +--
			zahl1 = randi() %10 +1
			zahl2 = randi() %10 +1
			zahl3 = randi() %10 +1
			zahl4 = randi() %10 +1
			zwischenergebnis1 = zahl1 + zahl2
			zwischenergebnis2 = zahl1 + zahl2 - zahl3
			ergebnis = zahl1 + zahl2 - zahl3 - zahl4
			while (ergebnis > 10 or ergebnis <= 0) or (zwischenergebnis1 > 10 or zwischenergebnis1 <= 0) or (zwischenergebnis2 > 10 or zwischenergebnis2 <= 0):
				zahl1 = randi() %10 +1
				zahl2 = randi() %10 +1
				zahl3 = randi() %10 +1
				zahl4 = randi() %10 +1
				zwischenergebnis1 = zahl1 + zahl2
				zwischenergebnis2 = zahl1 + zahl2 - zahl3
				ergebnis = zahl1 + zahl2 - zahl3 - zahl4
	
	_aufgabe_anzeigen(add_sub, zahl1, zahl2, zahl3, zahl4)
	$AufgabenPanel/Eingabefeld_Zahl._setze_gesucht(ergebnis)
	$AufgabenPanel/Eingabefeld_Zahl.setActive(true)


func _aufgabe_anzeigen(add_sub : int, zahl1 : int, zahl2 : int, zahl3 : int, zahl4 : int) -> void:
	match add_sub:
		0: # ++-
			$AufgabenPanel/Plus/Label.text = "+"
			$AufgabenPanel/Plus2/Label.text = "+"
			$AufgabenPanel/Plus3/Label.text = "-"
		1: # +-+
			$AufgabenPanel/Plus/Label.text = "+"
			$AufgabenPanel/Plus2/Label.text = "-"
			$AufgabenPanel/Plus3/Label.text = "+"
		2: # -++
			$AufgabenPanel/Plus/Label.text = "-"
			$AufgabenPanel/Plus2/Label.text = "+"
			$AufgabenPanel/Plus3/Label.text = "+"
		3: # --+
			$AufgabenPanel/Plus/Label.text = "-"
			$AufgabenPanel/Plus2/Label.text = "-"
			$AufgabenPanel/Plus3/Label.text = "+"
		4: # -+-
			$AufgabenPanel/Plus/Label.text = "-"
			$AufgabenPanel/Plus2/Label.text = "+"
			$AufgabenPanel/Plus3/Label.text = "-"
		5: # +--
			$AufgabenPanel/Plus/Label.text = "+"
			$AufgabenPanel/Plus2/Label.text = "-"
			$AufgabenPanel/Plus3/Label.text = "-"
	
	$AufgabenPanel/Zahl1/Label.text = str(zahl1)
	$AufgabenPanel/Zahl2/Label.text = str(zahl2)
	$AufgabenPanel/Zahl3/Label.text = str(zahl3)
	$AufgabenPanel/Zahl4/Label.text = str(zahl4)
