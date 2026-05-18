extends Label


@export var next : Label
@export var subtraktion : bool = false


var startwert : int
var gesucht : int
var mauszeigerImFeld = false
var feedback = StyleBoxFlat.new()
var aufgaben_grundgeruest
var korrekt : bool = false
var active : bool = false
var eingabe : int = 0


func _ready():
	_set_neutral()
	_initialisiere_Streichungen()
	aufgaben_grundgeruest = get_tree().current_scene.get_node("AufgabenGrundgeruest")


func _initialisiere_Streichungen() -> void:
	$Gestrichen/K1gestrichen.visible = false
	$Gestrichen/K2gestrichen.visible = false
	$Gestrichen/K3gestrichen.visible = false
	$Gestrichen/K4gestrichen.visible = false
	$Gestrichen/K5gestrichen.visible = false


func _process(_delta):
	if Input.is_action_just_released("click"):
		var button = GlobaleVariablen.aktueller_button
		if button and mauszeigerImFeld and active:
			eingabe = int(button.index)
			var quotient : int = startwert - eingabe
			_subtraktion_anzeigen(eingabe)
			_pruefen(quotient)


func _startwert_anzeigen() -> void:
	match startwert:
		0:
			$Kreis1._setze_kreis_neutral()
			$Kreis2._setze_kreis_neutral()
			$Kreis3._setze_kreis_neutral()
			$Kreis4._setze_kreis_neutral()
			$Kreis5._setze_kreis_neutral()
		1:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_neutral()
			$Kreis3._setze_kreis_neutral()
			$Kreis4._setze_kreis_neutral()
			$Kreis5._setze_kreis_neutral()
		2:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_neutral()
			$Kreis4._setze_kreis_neutral()
			$Kreis5._setze_kreis_neutral()
		3:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_farbig()
			$Kreis4._setze_kreis_neutral()
			$Kreis5._setze_kreis_neutral()
		4:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_farbig()
			$Kreis4._setze_kreis_farbig()
			$Kreis5._setze_kreis_neutral()
		5:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_farbig()
			$Kreis4._setze_kreis_farbig()
			$Kreis5._setze_kreis_farbig()


func _subtraktion_anzeigen(wert : int):
	for i in wert:
		if ($Kreis5.get("theme_override_styles/normal").bg_color == Color(1, 0, 0, 1) && $Gestrichen/K5gestrichen.visible == false):
			$Gestrichen/K5gestrichen.visible = true
		elif ($Kreis4.get("theme_override_styles/normal").bg_color == Color(1, 0, 0, 1) && $Gestrichen/K4gestrichen.visible == false):
			$Gestrichen/K4gestrichen.visible = true
		elif ($Kreis3.get("theme_override_styles/normal").bg_color == Color(1, 0, 0, 1) && $Gestrichen/K3gestrichen.visible == false):
			$Gestrichen/K3gestrichen.visible = true
		elif ($Kreis2.get("theme_override_styles/normal").bg_color == Color(1, 0, 0, 1) && $Gestrichen/K2gestrichen.visible == false):
			$Gestrichen/K2gestrichen.visible = true
		elif ($Kreis1.get("theme_override_styles/normal").bg_color == Color(1, 0, 0, 1) && $Gestrichen/K1gestrichen.visible == false):
			$Gestrichen/K1gestrichen.visible = true
#	$DelayTimer.start()


func _set_neutral():
	feedback.bg_color = Color.WHITE
	applyHighlighting(active)
	self.set("theme_override_styles/normal", feedback)
	$Kreis1._setze_kreis_neutral()
	$Kreis2._setze_kreis_neutral()
	$Kreis3._setze_kreis_neutral()
	$Kreis4._setze_kreis_neutral()
	$Kreis5._setze_kreis_neutral()
	_initialisiere_Streichungen()
	if subtraktion:
		_startwert_anzeigen()


func applyHighlighting(b: bool):
	var width = 10
	var color = Color.BLACK
	if b:
		width = 30
		color = Color(0.392,0.392,0.392)
	feedback.border_width_left = width
	feedback.border_width_top = width
	feedback.border_width_right = width
	feedback.border_width_bottom = width
	feedback.border_color = color
	self.set("theme_override_styles/normal", feedback)


func _set_true():
	feedback.bg_color = Color.GREEN
	self.set("theme_override_styles/normal", feedback)


func _set_false():
	feedback.bg_color = Color.RED
	self.set("theme_override_styles/normal", feedback)


func _pruefen(ergebnis : int):
	if ergebnis == gesucht:
		korrekt = true
		$Richtig.play()
		aufgaben_grundgeruest.korrekt_geloest()
		_set_true()
		$ResetTimer.stop()
		$DelayTimer.start()
		#if next != null:
			#next.setActive(true)
			#if get_tree().current_scene.has_method("_aktualisiere_Anzeige"):
				#get_tree().current_scene._aktualisiere_Anzeige()
		#setActive(false)
	else:
		korrekt = false
		$Falsch.play()
		_set_false()
		$ResetTimer.start()


func setActive(b : bool):
	active = b
	applyHighlighting(b)


func _on_reset_timer_timeout():
	_set_neutral()
	_startwert_anzeigen()


func _on_area_2d_area_entered(_area):
	mauszeigerImFeld = true


func _on_area_2d_area_exited(_area):
	mauszeigerImFeld = false


func _on_delay_timer_timeout() -> void:
	#if $Gestrichen/K1gestrichen.visible == true:
		#$Kreis1._setze_kreis_neutral()
		#$Gestrichen/K1gestrichen.visible = false
	#if $Gestrichen/K2gestrichen.visible == true:
		#$Kreis2._setze_kreis_neutral()
		#$Gestrichen/K2gestrichen.visible = false
	#if $Gestrichen/K3gestrichen.visible == true:
		#$Kreis3._setze_kreis_neutral()
		#$Gestrichen/K3gestrichen.visible = false
	#if $Gestrichen/K4gestrichen.visible == true:
		#$Kreis4._setze_kreis_neutral()
		#$Gestrichen/K4gestrichen.visible = false
	#if $Gestrichen/K5gestrichen.visible == true:
		#$Kreis5._setze_kreis_neutral()
		#$Gestrichen/K5gestrichen.visible = false
	if next != null:
		next.setActive(true)
		if get_tree().current_scene.has_method("_aktualisiere_Anzeige"):
			get_tree().current_scene._aktualisiere_Anzeige()
	setActive(false)
