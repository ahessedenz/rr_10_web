extends Label


@export var next : Label

var gesucht : int
var mauszeigerImFeld = false
var feedback = StyleBoxFlat.new()
var aufgaben_grundgeruest
var korrekt : bool = false
var active : bool = false
var eingabe : int = 0

const SCHIFF0 = preload("res://Assets/Mengen/Schiff_0.png")
const SCHIFF1 = preload("res://Assets/Mengen/Schiff_1.png")
const SCHIFF2 = preload("res://Assets/Mengen/Schiff_2.png")
const SCHIFF3 = preload("res://Assets/Mengen/Schiff_3.png")
const SCHIFF4 = preload("res://Assets/Mengen/Schiff_4.png")
const SCHIFF5 = preload("res://Assets/Mengen/Schiff_5.png")


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
		0:
			$Rechenschiff.texture = SCHIFF0
		1:
			$Rechenschiff.texture = SCHIFF1
		2:
			$Rechenschiff.texture = SCHIFF2
		3:
			$Rechenschiff.texture = SCHIFF3
		4:
			$Rechenschiff.texture = SCHIFF4
		5:
			$Rechenschiff.texture = SCHIFF5


func _set_neutral():
	feedback.bg_color = Color.WHITE
	applyHighlighting(active)
	self.set("theme_override_styles/normal", feedback)
	$Rechenschiff.texture = SCHIFF0


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


func _on_reset_timer_timeout():
	_set_neutral()
