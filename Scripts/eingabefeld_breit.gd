extends Label


@export var next : Label
@export var strichliste : bool = false
@export var wuerfel : bool = false
@export var hand : bool = false
@export var schiff : bool = false
@export var rakete : bool = false

var gesucht : int
var mauszeigerImFeld = false
var feedback = StyleBoxFlat.new()
var aufgaben_grundgeruest
var korrekt:bool = false
var active:bool = false


const STRICHLISTE1 = preload("res://Assets/Mengen/Strich_1.png")
const STRICHLISTE2 = preload("res://Assets/Mengen/Strich_2.png")
const STRICHLISTE3 = preload("res://Assets/Mengen/Strich_3.png")
const STRICHLISTE4 = preload("res://Assets/Mengen/Strich_4.png")
const STRICHLISTE5 = preload("res://Assets/Mengen/Strich_5.png")

const WUERFEL1 = preload("res://Assets/Mengen/Wuerfel_1_1.png")
const WUERFEL2 = preload("res://Assets/Mengen/Wuerfel_2_2.png")
const WUERFEL3 = preload("res://Assets/Mengen/Wuerfel_3_3.png")
const WUERFEL4 = preload("res://Assets/Mengen/Wuerfel_4_4.png")
const WUERFEL5 = preload("res://Assets/Mengen/Wuerfel_5_5.png")

const HAND6 = preload("res://Assets/Mengen/Hand_6.png")
const HAND7 = preload("res://Assets/Mengen/Hand_7.png")
const HAND8 = preload("res://Assets/Mengen/Hand_8.png")
const HAND9 = preload("res://Assets/Mengen/Hand_9.png")
const HAND10 = preload("res://Assets/Mengen/Hand_10.png")


func _ready():
	_set_neutral()
	aufgaben_grundgeruest = get_tree().current_scene.get_node("AufgabenGrundgeruest")
	if hand or schiff or rakete:
		$Anzeigefeld.visible = false
		$GrafikAnzeige.visible = true
		$StrichlistenAnzeige.visible = false
		$StrichlistenAnzeige2.visible = false
	elif strichliste or wuerfel:
		$Anzeigefeld.visible = false
		$GrafikAnzeige.visible = false
		$StrichlistenAnzeige.visible = true
		$StrichlistenAnzeige2.visible = true
	else:
		$Anzeigefeld.visible = true
		$GrafikAnzeige.visible = false
		$StrichlistenAnzeige.visible = false
		$StrichlistenAnzeige2.visible = false


func _process(_delta):
	if Input.is_action_just_released("click"):
		var button = GlobaleVariablen.aktueller_button
		if button and mauszeigerImFeld and active:
			$Anzeigefeld.text = button.index
			if strichliste:
				_strichliste_anzeigen(button.index)
			if wuerfel:
				_wuerfel_anzeigen(button.index)
			if hand:
				_hand_anzeigen(button.index)
			_pruefen($Anzeigefeld.text)


func _hand_anzeigen(index : String):
	match index:
		"6":
			$GrafikAnzeige.texture = HAND6
		"7":
			$GrafikAnzeige.texture = HAND7
		"8":
			$GrafikAnzeige.texture = HAND8
		"9":
			$GrafikAnzeige.texture = HAND9
		"10":
			$GrafikAnzeige.texture = HAND10


func _wuerfel_anzeigen(index : String):
	$StrichlistenAnzeige.texture = WUERFEL5
	match index:
		"6":
			$StrichlistenAnzeige2.texture = WUERFEL1
		"7":
			$StrichlistenAnzeige2.texture = WUERFEL2
		"8":
			$StrichlistenAnzeige2.texture = WUERFEL3
		"9":
			$StrichlistenAnzeige2.texture = WUERFEL4
		"10":
			$StrichlistenAnzeige2.texture = WUERFEL5


func _strichliste_anzeigen(index : String):
	$StrichlistenAnzeige.texture = STRICHLISTE5
	match index:
		"6":
			$StrichlistenAnzeige2.texture = STRICHLISTE1
		"7":
			$StrichlistenAnzeige2.texture = STRICHLISTE2
		"8":
			$StrichlistenAnzeige2.texture = STRICHLISTE3
		"9":
			$StrichlistenAnzeige2.texture = STRICHLISTE4
		"10":
			$StrichlistenAnzeige2.texture = STRICHLISTE5


func _set_neutral():
	feedback.bg_color = Color.WHITE
	applyHighlighting(active)
	self.set("theme_override_styles/normal", feedback)
	$Anzeigefeld.text = ""
	$GrafikAnzeige.texture = null
	$StrichlistenAnzeige.texture = null
	$StrichlistenAnzeige2.texture = null


func applyHighlighting(b: bool):
	var width = 2
	var color = Color.BLACK
	if b:
		width = 10
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
