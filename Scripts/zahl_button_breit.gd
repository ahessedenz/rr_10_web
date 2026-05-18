extends Button


@export var index : String
@export var strichliste : bool = false
@export var wuerfel : bool = false
@export var hand : bool = false
@export var schiff : bool = false
@export var rakete : bool = false

var active = true
var ausgangsposition
var dragmode = false
var anzeigewert : String
var feldHatMauszeiger : bool = false

const STRICHLISTE1 = preload("res://Assets/Mengen/Strich_1_Button.png")
const STRICHLISTE2 = preload("res://Assets/Mengen/Strich_2_Button.png")
const STRICHLISTE3 = preload("res://Assets/Mengen/Strich_3_Button.png")
const STRICHLISTE4 = preload("res://Assets/Mengen/Strich_4_Button.png")
const STRICHLISTE5 = preload("res://Assets/Mengen/Strich_5_Button.png")

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

const SCHIFF6 = preload("res://Assets/Mengen/Schiff_6.png")
const SCHIFF7 = preload("res://Assets/Mengen/Schiff_7.png")
const SCHIFF8 = preload("res://Assets/Mengen/Schiff_8.png")
const SCHIFF9 = preload("res://Assets/Mengen/Schiff_9.png")
const SCHIFF10 = preload("res://Assets/Mengen/Schiff_10.png")


func _ready():
	anzeigewert = index
	if strichliste or wuerfel:
		$Label.visible = false
		$GrafikAnzeige.visible = false
		$StrichlistenAnzeige.visible = true
		$StrichlistenAnzeige2.visible = true
		$Rakete.visible = false
	elif hand or schiff:
		$Label.visible = false
		$GrafikAnzeige.visible = true
		$StrichlistenAnzeige.visible = false
		$StrichlistenAnzeige2.visible = false
		$Rakete.visible = false
	elif rakete:
		$Label.visible = false
		$GrafikAnzeige.visible = false
		$StrichlistenAnzeige.visible = false
		$StrichlistenAnzeige2.visible = false
		$Rakete.visible = true
	else:
		$Label.visible = true
		$GrafikAnzeige.visible = false
		$StrichlistenAnzeige.visible = false
		$StrichlistenAnzeige2.visible = false
		$Rakete.visible = false
	$Label.text = index
	ausgangsposition = global_position


func _process(delta):
	if dragmode:
		global_position = lerp(global_position, get_global_mouse_position() - size/2, 100 * delta)
		if Input.is_action_just_released("click") and active:
			_resetButton()


func _set_GrafikAnzeige():
	if strichliste:
		_setze_strichliste()
	elif wuerfel:
		_setze_wuerfel()
	elif hand:
		_setze_hand()
	elif schiff:
		_setze_schiff()
	elif rakete:
		_setze_rakete()
	else:
		_setze_zahl()


func _setze_zahl():
	_setze_breite_zahl()
	$Label.visible = true
	$GrafikAnzeige.visible = false
	$StrichlistenAnzeige.visible = false
	$StrichlistenAnzeige2.visible = false
	$Rakete.visible = false


func _setze_breite_zahl():
	self.size.x = 160


func _setze_breite_anzeige():
	self.size.x = 290


func _setze_strichliste():
	_setze_breite_anzeige()
	$Label.visible = false
	$GrafikAnzeige.visible = false
	$StrichlistenAnzeige.visible = true
	$StrichlistenAnzeige2.visible = true
	$Rakete.visible = false
	match index:
		"6":
			$StrichlistenAnzeige.texture = STRICHLISTE5
			$StrichlistenAnzeige2.texture = STRICHLISTE1
		"7":
			$StrichlistenAnzeige.texture = STRICHLISTE5
			$StrichlistenAnzeige2.texture = STRICHLISTE2
		"8":
			$StrichlistenAnzeige.texture = STRICHLISTE5
			$StrichlistenAnzeige2.texture = STRICHLISTE3
		"9":
			$StrichlistenAnzeige.texture = STRICHLISTE5
			$StrichlistenAnzeige2.texture = STRICHLISTE4
		"10":
			$StrichlistenAnzeige.texture = STRICHLISTE5
			$StrichlistenAnzeige2.texture = STRICHLISTE5


func _setze_wuerfel():
	_setze_breite_anzeige()
	$Label.visible = false
	$GrafikAnzeige.visible = false
	$StrichlistenAnzeige.visible = true
	$StrichlistenAnzeige2.visible = true
	$Rakete.visible = false
	match index:
		"6":
			$StrichlistenAnzeige.texture = WUERFEL5
			$StrichlistenAnzeige2.texture = WUERFEL1
		"7":
			$StrichlistenAnzeige.texture = WUERFEL5
			$StrichlistenAnzeige2.texture = WUERFEL2
		"8":
			$StrichlistenAnzeige.texture = WUERFEL5
			$StrichlistenAnzeige2.texture = WUERFEL3
		"9":
			$StrichlistenAnzeige.texture = WUERFEL5
			$StrichlistenAnzeige2.texture = WUERFEL4
		"10":
			$StrichlistenAnzeige.texture = WUERFEL5
			$StrichlistenAnzeige2.texture = WUERFEL5


func _setze_hand():
	_setze_breite_anzeige()
	$Label.visible = false
	$GrafikAnzeige.visible = true
	$StrichlistenAnzeige.visible = false
	$StrichlistenAnzeige2.visible = false
	$Rakete.visible = false
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


func _setze_schiff():
	_setze_breite_anzeige()
	$Label.visible = false
	$GrafikAnzeige.visible = true
	$StrichlistenAnzeige.visible = false
	$StrichlistenAnzeige2.visible = false
	$Rakete.visible = false
	match index:
		"6":
			$GrafikAnzeige.texture = SCHIFF6
		"7":
			$GrafikAnzeige.texture = SCHIFF7
		"8":
			$GrafikAnzeige.texture = SCHIFF8
		"9":
			$GrafikAnzeige.texture = SCHIFF9
		"10":
			$GrafikAnzeige.texture = SCHIFF10


func _setze_rakete():
	_setze_breite_zahl()
	$Label.visible = false
	$GrafikAnzeige.visible = false
	$StrichlistenAnzeige.visible = false
	$StrichlistenAnzeige2.visible = false
	$Rakete.visible = true
	match index:
		"6":
			$Rakete/Label10.visible = false
			$Rakete/Label9.visible = false
			$Rakete/Label8.visible = false
			$Rakete/Label7.visible = false
			$Rakete/Label6.visible = true
		"7":
			$Rakete/Label10.visible = false
			$Rakete/Label9.visible = false
			$Rakete/Label8.visible = false
			$Rakete/Label7.visible = true
			$Rakete/Label6.visible = true
		"8":
			$Rakete/Label10.visible = false
			$Rakete/Label9.visible = false
			$Rakete/Label8.visible = true
			$Rakete/Label7.visible = true
			$Rakete/Label6.visible = true
		"9":
			$Rakete/Label10.visible = false
			$Rakete/Label9.visible = true
			$Rakete/Label8.visible = true
			$Rakete/Label7.visible = true
			$Rakete/Label6.visible = true
		"10":
			$Rakete/Label10.visible = true
			$Rakete/Label9.visible = true
			$Rakete/Label8.visible = true
			$Rakete/Label7.visible = true
			$Rakete/Label6.visible = true


func _resetButton():
	global_position = ausgangsposition
#	mouse_filter = Control.MOUSE_FILTER_STOP
	z_index = 0
	dragmode = false
	GlobaleVariablen.aktueller_button = null


func _on_button_down():
	GlobaleVariablen.aktueller_button = self
#	mouse_filter = Control.MOUSE_FILTER_IGNORE
	z_index = 1
	dragmode = true


func _setActive():
	active = true
	visible = true


func _setInactive():
	active = false
	visible = false


func _set_ausgangsposition():
	ausgangsposition = global_position
