extends Control


func _ready() -> void:
	randomize()
	$AufgabenPanel/R2.visible = false
	_erzeuge_aufgabe()


func _erzeuge_aufgabe() -> void:
	var dachzahl : int = 8 #randi() %2 +7
	$AufgabenPanel/Dach/Dachzahl.text = str(dachzahl)
	
	#R1 erzeugen
	var zufall_handwert_r1 : int = randi() %8 +1
	while zufall_handwert_r1 >= dachzahl:
		zufall_handwert_r1 = randi() %8 +1
	$AufgabenPanel/R1/R1Links/R1Zahl.text = str(zufall_handwert_r1)
	$AufgabenPanel/R1/R1Rechts/Eingabefeld_Zahl._setze_gesucht(dachzahl - zufall_handwert_r1)
	var zufall_seite_r1 : int = randi() %2 #0 = links angezeigt, 1 = rechts angezeigt
	
	#R2 erzeugen
	var zufall_handwert_r2 : int = randi() %8 +1
	while (zufall_handwert_r2 >= dachzahl) or (zufall_handwert_r2 == zufall_handwert_r1):
		zufall_handwert_r2 = randi() %8 +1
	$AufgabenPanel/R2/R2Links/R2Zahl.text = str(zufall_handwert_r2)
	$AufgabenPanel/R2/R2Rechts/Eingabefeld_Zahl._setze_gesucht(dachzahl - zufall_handwert_r2)
	var zufall_seite_r2 = randi() %2
	
	#seiten tauschen
	_tausche_seiten(zufall_seite_r1, zufall_seite_r2)
	_panel_anpassen(zufall_seite_r1, zufall_seite_r2)
	
	#erstes Eingabefeld aktivieren
	$AufgabenPanel/R1/R1Rechts/Eingabefeld_Zahl.setActive(true)


func _tausche_seiten(r1 : int, r2 : int) -> void:
	if r1 == 1:
		$AufgabenPanel/R1/R1Links.position.x = 500
		$AufgabenPanel/R1/R1Rechts.position.x = 0
	if r2 == 1:
		$AufgabenPanel/R2/R2Links.position.x = 500
		$AufgabenPanel/R2/R2Rechts.position.x = 0


func _panel_anpassen(r1 : int, r2 : int) -> void:
	if r1 == 1:
		var style_links : StyleBoxFlat = StyleBoxFlat.new()
		style_links.bg_color = Color(1, 0.875, 0.2, 1)
		style_links.border_width_left = 2
		style_links.border_width_top = 2
		style_links.border_width_right = 0
		style_links.border_width_bottom = 2
		style_links.border_color = Color.BLACK
		$AufgabenPanel/R1/R1Rechts.set("theme_override_styles/panel", style_links)
		var style_rechts : StyleBoxFlat = StyleBoxFlat.new()
		style_rechts.bg_color = Color(1, 0.875, 0.2, 1)
		style_rechts.border_width_left = 0
		style_rechts.border_width_top = 2
		style_rechts.border_width_right = 2
		style_rechts.border_width_bottom = 2
		style_rechts.border_color = Color.BLACK
		$AufgabenPanel/R1/R1Links.set("theme_override_styles/panel", style_rechts)
	if r2 == 1:
		var style_links : StyleBoxFlat = StyleBoxFlat.new()
		style_links.bg_color = Color(1, 0.875, 0.2, 1)
		style_links.border_width_left = 2
		style_links.border_width_top = 2
		style_links.border_width_right = 0
		style_links.border_width_bottom = 2
		style_links.border_color = Color.BLACK
		$AufgabenPanel/R2/R2Rechts.set("theme_override_styles/panel", style_links)
		var style_rechts : StyleBoxFlat = StyleBoxFlat.new()
		style_rechts.bg_color = Color(1, 0.875, 0.2, 1)
		style_rechts.border_width_left = 0
		style_rechts.border_width_top = 2
		style_rechts.border_width_right = 2
		style_rechts.border_width_bottom = 2
		style_rechts.border_color = Color.BLACK
		$AufgabenPanel/R2/R2Links.set("theme_override_styles/panel", style_rechts)


func _aktualisiere_Anzeige() -> void:
	$AufgabenPanel/R2.visible = true
