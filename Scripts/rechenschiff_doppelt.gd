extends Label


@export var next : Label
@export var strichliste : bool = false
@export var wuerfel : bool = false
@export var hand : bool = false
@export var schiff : bool = true
@export var rakete : bool = false

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
			_wert_einfuegen(eingabe)
			_pruefen(str(eingabe))


func _wert_einfuegen(wert : int):
	match wert:
		6:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_farbig()
			$Kreis4._setze_kreis_farbig()
			$Kreis5._setze_kreis_farbig()
			$Kreis6._setze_kreis_farbig()
			$Kreis7._setze_kreis_neutral()
			$Kreis8._setze_kreis_neutral()
			$Kreis9._setze_kreis_neutral()
			$Kreis10._setze_kreis_neutral()
		7:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_farbig()
			$Kreis4._setze_kreis_farbig()
			$Kreis5._setze_kreis_farbig()
			$Kreis6._setze_kreis_farbig()
			$Kreis7._setze_kreis_farbig()
			$Kreis8._setze_kreis_neutral()
			$Kreis9._setze_kreis_neutral()
			$Kreis10._setze_kreis_neutral()
		8:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_farbig()
			$Kreis4._setze_kreis_farbig()
			$Kreis5._setze_kreis_farbig()
			$Kreis6._setze_kreis_farbig()
			$Kreis7._setze_kreis_farbig()
			$Kreis8._setze_kreis_farbig()
			$Kreis9._setze_kreis_neutral()
			$Kreis10._setze_kreis_neutral()
		9:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_farbig()
			$Kreis4._setze_kreis_farbig()
			$Kreis5._setze_kreis_farbig()
			$Kreis6._setze_kreis_farbig()
			$Kreis7._setze_kreis_farbig()
			$Kreis8._setze_kreis_farbig()
			$Kreis9._setze_kreis_farbig()
			$Kreis10._setze_kreis_neutral()
		10:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_farbig()
			$Kreis4._setze_kreis_farbig()
			$Kreis5._setze_kreis_farbig()
			$Kreis6._setze_kreis_farbig()
			$Kreis7._setze_kreis_farbig()
			$Kreis8._setze_kreis_farbig()
			$Kreis9._setze_kreis_farbig()
			$Kreis10._setze_kreis_farbig()


func _set_neutral():
	feedback.bg_color = Color.WHITE
	applyHighlighting(active)
	self.set("theme_override_styles/normal", feedback)
	$Kreis1._setze_kreis_neutral()
	$Kreis2._setze_kreis_neutral()
	$Kreis3._setze_kreis_neutral()
	$Kreis4._setze_kreis_neutral()
	$Kreis5._setze_kreis_neutral()
	$Kreis6._setze_kreis_neutral()
	$Kreis7._setze_kreis_neutral()
	$Kreis8._setze_kreis_neutral()
	$Kreis9._setze_kreis_neutral()
	$Kreis10._setze_kreis_neutral()


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


func _on_mouse_entered():
	mauszeigerImFeld = true


func _on_mouse_exited():
	mauszeigerImFeld = false


func _pruefen(ergebnis : String):
	if ergebnis == str(gesucht):
		korrekt = true
		$Richtig.play()
		aufgaben_grundgeruest.korrekt_geloest()
		_set_true()
		if next != null:
			next.setActive(true)
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
	if active:
		get_tree().current_scene._switch_buttons(strichliste, wuerfel, hand, schiff, rakete)


func _on_reset_timer_timeout():
	_set_neutral()


func _on_area_2d_area_entered(_area):
	mauszeigerImFeld = true


func _on_area_2d_area_exited(_area):
	mauszeigerImFeld = false
