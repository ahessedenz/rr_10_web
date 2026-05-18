extends Label


@export var next : Label
@export var addition : bool = false


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
	aufgaben_grundgeruest = get_tree().current_scene.get_node("AufgabenGrundgeruest")


func _process(_delta):
	if Input.is_action_just_released("click"):
		var button = GlobaleVariablen.aktueller_button
		if button and mauszeigerImFeld and active:
			eingabe = int(button.index)
			var additionswert : int = startwert + eingabe
			_wert_einfuegen(additionswert)
			_pruefen(str(additionswert))


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


func _wert_einfuegen(wert : int):
	match wert:
		0:
			$Kreis1._setze_kreis_neutral()
			$Kreis2._setze_kreis_neutral()
			$Kreis3._setze_kreis_neutral()
			$Kreis4._setze_kreis_neutral()
			$Kreis5._setze_kreis_neutral()
		1:
			match startwert:
				0:
					$Kreis1._setze_kreis_farbig()
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
			match startwert:
				0:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_neutral()
					$Kreis4._setze_kreis_neutral()
					$Kreis5._setze_kreis_neutral()
				1:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
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
			match startwert:
				0:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_neutral()
					$Kreis5._setze_kreis_neutral()
				1:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_neutral()
					$Kreis5._setze_kreis_neutral()
				2:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_neutral()
					$Kreis5._setze_kreis_neutral()
				3:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_neutral()
					$Kreis5._setze_kreis_neutral()
		4:
			match startwert:
				0:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_farbig()
					$Kreis5._setze_kreis_neutral()
				1:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_farbig()
					$Kreis5._setze_kreis_neutral()
				2:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_farbig()
					$Kreis5._setze_kreis_neutral()
				3:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_farbig()
					$Kreis5._setze_kreis_neutral()
				4:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_farbig()
					$Kreis5._setze_kreis_neutral()
		5:
			match startwert:
				0:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_farbig()
					$Kreis5._setze_kreis_farbig()
				1:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_farbig()
					$Kreis5._setze_kreis_farbig()
				2:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_farbig()
					$Kreis5._setze_kreis_farbig()
				3:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_farbig()
					$Kreis5._setze_kreis_farbig()
				4:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_farbig()
					$Kreis5._setze_kreis_farbig()
				5:
					$Kreis1._setze_kreis_farbig()
					$Kreis2._setze_kreis_farbig()
					$Kreis3._setze_kreis_farbig()
					$Kreis4._setze_kreis_farbig()
					$Kreis5._setze_kreis_farbig()


func _set_neutral():
	feedback.bg_color = Color.WHITE
	applyHighlighting(active)
	self.set("theme_override_styles/normal", feedback)
	$Kreis1._setze_kreis_neutral()
	$Kreis2._setze_kreis_neutral()
	$Kreis3._setze_kreis_neutral()
	$Kreis4._setze_kreis_neutral()
	$Kreis5._setze_kreis_neutral()
	if addition:
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


func _pruefen(ergebnis : String):
	if ergebnis == str(gesucht):
		korrekt = true
		$Richtig.play()
		aufgaben_grundgeruest.korrekt_geloest()
		_set_true()
		if next != null:
			next.setActive(true)
			if get_tree().current_scene.has_method("_aktualisiere_Anzeige"):
				get_tree().current_scene._aktualisiere_Anzeige()
		setActive(false)
		$ResetTimer.stop()
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
