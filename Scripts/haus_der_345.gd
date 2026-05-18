extends Control


func _ready() -> void:
	randomize()
	$AufgabenPanel/R2.visible = false
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	#Dachzahl erzeugen
	var zufallswert : int = randi() %3 +3
	$AufgabenPanel/Dach/Dachzahl.text = str(zufallswert)
	
	#R1 erzeugen
	var zufall_handwert_r1 : int = randi() %6
	while zufall_handwert_r1 > zufallswert:
		zufall_handwert_r1 = randi() %6
	#R1 anzeigen
	$AufgabenPanel/R1/R1Links/R1Zahl.text = str(zufall_handwert_r1)
	$AufgabenPanel/R1/R1Rechts/Eingabefeld_Zahl._setze_gesucht(zufallswert - zufall_handwert_r1)
	var zufall_seite : int = randi() %2 #0 = links angezeigt, 1 = rechts angezeigt
	if zufall_seite == 1:
		$AufgabenPanel/R1/R1Links.position.x = 500
		$AufgabenPanel/R1/R1Rechts.position.x = 0
	
	#R2 erzeugen
	var zufall_handwert_r2 : int = randi() %6
	while (zufall_handwert_r2 > zufallswert) or (zufall_handwert_r2 == zufall_handwert_r1):
		zufall_handwert_r2 = randi() %6
	#R2 anzeigen
	$AufgabenPanel/R2/R2Links/R2Zahl.text = str(zufall_handwert_r2)
	$AufgabenPanel/R2/R2Rechts/Eingabefeld_Zahl._setze_gesucht(zufallswert - zufall_handwert_r2)
	zufall_seite = randi() %2
	if zufall_seite == 1:
		$AufgabenPanel/R2/R2Links.position.x = 500
		$AufgabenPanel/R2/R2Rechts.position.x = 0
	
	#erstes Eingabefeld aktivieren
	$AufgabenPanel/R1/R1Rechts/Eingabefeld_Zahl.setActive(true)


func _aktualisiere_Anzeige() -> void:
	$AufgabenPanel/R2.visible = true
