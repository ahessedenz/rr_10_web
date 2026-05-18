extends Label


@export var next : Label
@export var strichliste : bool = false
@export var wuerfel : bool = false
@export var hand : bool = false
@export var schiff : bool = false
@export var rakete : bool = true

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
			$Raketenquadrat1._setze_farbig()
			$Raketenquadrat2._setze_farbig()
			$Raketenquadrat3._setze_farbig()
			$Raketenquadrat4._setze_farbig()
			$Raketenquadrat5._setze_farbig()
			$Raketenquadrat6._setze_farbig()
			$Raketenquadrat7._setze_neutral()
			$Raketenquadrat8._setze_neutral()
			$Raketenquadrat9._setze_neutral()
			$Raketenquadrat10._setze_neutral()
		7:
			$Raketenquadrat1._setze_farbig()
			$Raketenquadrat2._setze_farbig()
			$Raketenquadrat3._setze_farbig()
			$Raketenquadrat4._setze_farbig()
			$Raketenquadrat5._setze_farbig()
			$Raketenquadrat6._setze_farbig()
			$Raketenquadrat7._setze_farbig()
			$Raketenquadrat8._setze_neutral()
			$Raketenquadrat9._setze_neutral()
			$Raketenquadrat10._setze_neutral()
		8:
			$Raketenquadrat1._setze_farbig()
			$Raketenquadrat2._setze_farbig()
			$Raketenquadrat3._setze_farbig()
			$Raketenquadrat4._setze_farbig()
			$Raketenquadrat5._setze_farbig()
			$Raketenquadrat6._setze_farbig()
			$Raketenquadrat7._setze_farbig()
			$Raketenquadrat8._setze_farbig()
			$Raketenquadrat9._setze_neutral()
			$Raketenquadrat10._setze_neutral()
		9:
			$Raketenquadrat1._setze_farbig()
			$Raketenquadrat2._setze_farbig()
			$Raketenquadrat3._setze_farbig()
			$Raketenquadrat4._setze_farbig()
			$Raketenquadrat5._setze_farbig()
			$Raketenquadrat6._setze_farbig()
			$Raketenquadrat7._setze_farbig()
			$Raketenquadrat8._setze_farbig()
			$Raketenquadrat9._setze_farbig()
			$Raketenquadrat10._setze_neutral()
		10:
			$Raketenquadrat1._setze_farbig()
			$Raketenquadrat2._setze_farbig()
			$Raketenquadrat3._setze_farbig()
			$Raketenquadrat4._setze_farbig()
			$Raketenquadrat5._setze_farbig()
			$Raketenquadrat6._setze_farbig()
			$Raketenquadrat7._setze_farbig()
			$Raketenquadrat8._setze_farbig()
			$Raketenquadrat9._setze_farbig()
			$Raketenquadrat10._setze_farbig()


func _set_neutral():
	feedback.bg_color = Color.TRANSPARENT
	applyHighlighting(active)
	self.set("theme_override_styles/normal", feedback)
	$Raketenquadrat1._setze_neutral()
	$Raketenquadrat2._setze_neutral()
	$Raketenquadrat3._setze_neutral()
	$Raketenquadrat4._setze_neutral()
	$Raketenquadrat5._setze_neutral()
	$Raketenquadrat6._setze_neutral()
	$Raketenquadrat7._setze_neutral()
	$Raketenquadrat8._setze_neutral()
	$Raketenquadrat9._setze_neutral()
	$Raketenquadrat10._setze_neutral()


func applyHighlighting(b: bool):
	var width = 0
	if b:
		width = 10
	feedback.border_width_left = width
	feedback.border_width_top = width
	feedback.border_width_right = width
	feedback.border_width_bottom = width
	feedback.border_color = Color(0.392,0.392,0.392)
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
		$Raketenquadrat5._setze_farbig()
		$Raketenquadrat4._setze_farbig()
		$Raketenquadrat3._setze_farbig()
		$Raketenquadrat2._setze_farbig()
		$Raketenquadrat1._setze_farbig()


func _on_reset_timer_timeout():
	_set_neutral()


func _on_area_2d_area_entered(_area):
	mauszeigerImFeld = true


func _on_area_2d_area_exited(_area):
	mauszeigerImFeld = false
