extends Button


@export var index : String
@export var strichliste : bool = false
@export var wuerfel : bool = false
@export var hand : bool = false
@export var schiff : bool = false
@export var rakete : bool = false
@export var kugeln : bool = false
@export var gestrichen : bool = false

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

const HAND0 = preload("res://Assets/Mengen/Hand_0.png")
const HAND1 = preload("res://Assets/Mengen/Hand_1.png")
const HAND2 = preload("res://Assets/Mengen/Hand_2.png")
const HAND3 = preload("res://Assets/Mengen/Hand_3.png")
const HAND4 = preload("res://Assets/Mengen/Hand_4.png")
const HAND5 = preload("res://Assets/Mengen/Hand_5.png")

const SCHIFF0 = preload("res://Assets/Mengen/Schiff_0.png")
const SCHIFF1 = preload("res://Assets/Mengen/Schiff_1.png")
const SCHIFF2 = preload("res://Assets/Mengen/Schiff_2.png")
const SCHIFF3 = preload("res://Assets/Mengen/Schiff_3.png")
const SCHIFF4 = preload("res://Assets/Mengen/Schiff_4.png")
const SCHIFF5 = preload("res://Assets/Mengen/Schiff_5.png")


func _ready():
	anzeigewert = index
	if anzeigewert.length() >= 2:
		self.size.x = 190
		$Label.size.x = 190
		$Area2D/CollisionShape2D.position.x = 95
	if strichliste:
		$Label.visible = false
		$GrafikAnzeige.visible = false
		$StrichlistenAnzeige.visible = true
		$Rakete.visible = false
		$Kugeln.visible = false
	elif wuerfel or hand or schiff:
		$Label.visible = false
		$GrafikAnzeige.visible = true
		$StrichlistenAnzeige.visible = false
		$Rakete.visible = false
		$Kugeln.visible = false
	elif rakete:
		$Label.visible = false
		$GrafikAnzeige.visible = false
		$StrichlistenAnzeige.visible = false
		$Rakete.visible = true
		$Kugeln.visible = false
	elif kugeln:
		$Label.visible = false
		$GrafikAnzeige.visible = false
		$StrichlistenAnzeige.visible = false
		$Rakete.visible = false
		$Kugeln.visible = true
	else:
		$Label.visible = true
		$GrafikAnzeige.visible = false
		$StrichlistenAnzeige.visible = false
		$Rakete.visible = false
		$Kugeln.visible = false
	if !gestrichen:
		$Gestrichen.visible = false
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
	elif kugeln:
		_setze_kugeln()
	else:
		_setze_zahl()


func _setze_zahl():
	$Label.visible = true
	$GrafikAnzeige.visible = false
	$StrichlistenAnzeige.visible = false
	$Rakete.visible = false
	$Kugeln.visible = false
	$Gestrichen.visible = false


func _setze_strichliste():
	$Label.visible = false
	$GrafikAnzeige.visible = false
	$StrichlistenAnzeige.visible = true
	$Rakete.visible = false
	$Kugeln.visible = false
	$Gestrichen.visible = false
	match index:
		"0":
			$StrichlistenAnzeige.texture = null
		"1":
			$StrichlistenAnzeige.texture = STRICHLISTE1
		"2":
			$StrichlistenAnzeige.texture = STRICHLISTE2
		"3":
			$StrichlistenAnzeige.texture = STRICHLISTE3
		"4":
			$StrichlistenAnzeige.texture = STRICHLISTE4
		"5":
			$StrichlistenAnzeige.texture = STRICHLISTE5


func _setze_wuerfel():
	$Label.visible = false
	$GrafikAnzeige.visible = true
	$StrichlistenAnzeige.visible = false
	$Rakete.visible = false
	$Kugeln.visible = false
	$Gestrichen.visible = false
	match index:
		"0":
			$GrafikAnzeige.texture = null
		"1":
			$GrafikAnzeige.texture = WUERFEL1
		"2":
			$GrafikAnzeige.texture = WUERFEL2
		"3":
			$GrafikAnzeige.texture = WUERFEL3
		"4":
			$GrafikAnzeige.texture = WUERFEL4
		"5":
			$GrafikAnzeige.texture = WUERFEL5


func _setze_hand():
	$Label.visible = false
	$GrafikAnzeige.visible = true
	$StrichlistenAnzeige.visible = false
	$Rakete.visible = false
	$Kugeln.visible = false
	$Gestrichen.visible = false
	match index:
		"0":
			$GrafikAnzeige.texture = HAND0
		"1":
			$GrafikAnzeige.texture = HAND1
		"2":
			$GrafikAnzeige.texture = HAND2
		"3":
			$GrafikAnzeige.texture = HAND3
		"4":
			$GrafikAnzeige.texture = HAND4
		"5":
			$GrafikAnzeige.texture = HAND5


func _setze_schiff():
	$Label.visible = false
	$GrafikAnzeige.visible = true
	$StrichlistenAnzeige.visible = false
	$Rakete.visible = false
	$Kugeln.visible = false
	$Gestrichen.visible = false
	match index:
		"0":
			$GrafikAnzeige.texture = SCHIFF0
		"1":
			$GrafikAnzeige.texture = SCHIFF1
		"2":
			$GrafikAnzeige.texture = SCHIFF2
		"3":
			$GrafikAnzeige.texture = SCHIFF3
		"4":
			$GrafikAnzeige.texture = SCHIFF4
		"5":
			$GrafikAnzeige.texture = SCHIFF5


func _setze_rakete():
	$Label.visible = false
	$GrafikAnzeige.visible = false
	$StrichlistenAnzeige.visible = false
	$Rakete.visible = true
	$Kugeln.visible = false
	$Gestrichen.visible = false
	match index:
		"0":
			$Rakete/Label5.visible = false
			$Rakete/Label4.visible = false
			$Rakete/Label3.visible = false
			$Rakete/Label2.visible = false
			$Rakete/Label1.visible = false
		"1":
			$Rakete/Label5.visible = false
			$Rakete/Label4.visible = false
			$Rakete/Label3.visible = false
			$Rakete/Label2.visible = false
			$Rakete/Label1.visible = true
		"2":
			$Rakete/Label5.visible = false
			$Rakete/Label4.visible = false
			$Rakete/Label3.visible = false
			$Rakete/Label2.visible = true
			$Rakete/Label1.visible = true
		"3":
			$Rakete/Label5.visible = false
			$Rakete/Label4.visible = false
			$Rakete/Label3.visible = true
			$Rakete/Label2.visible = true
			$Rakete/Label1.visible = true
		"4":
			$Rakete/Label5.visible = false
			$Rakete/Label4.visible = true
			$Rakete/Label3.visible = true
			$Rakete/Label2.visible = true
			$Rakete/Label1.visible = true
		"5":
			$Rakete/Label5.visible = true
			$Rakete/Label4.visible = true
			$Rakete/Label3.visible = true
			$Rakete/Label2.visible = true
			$Rakete/Label1.visible = true


func _setze_kugeln():
	$Label.visible = false
	$GrafikAnzeige.visible = false
	$StrichlistenAnzeige.visible = false
	$Rakete.visible = false
	$Kugeln.visible = true
	$Gestrichen.visible = false
	match index:
		"0":
			$Kugeln/Label1.visible = false
			$Kugeln/Label2.visible = false
			$Kugeln/Label3.visible = false
			$Kugeln/Label4.visible = false
			$Kugeln/Label5.visible = false
		"1":
			$Kugeln/Label1.visible = false
			$Kugeln/Label2.visible = false
			$Kugeln/Label3.visible = true
			$Kugeln/Label4.visible = false
			$Kugeln/Label5.visible = false
			
		"2":
			$Kugeln/Label1.visible = false
			$Kugeln/Label2.visible = true
			$Kugeln/Label2.position.x += 15
			$Kugeln/Label3.visible = true
			$Kugeln/Label3.position.x += 15
			$Kugeln/Label4.visible = false
			$Kugeln/Label5.visible = false
		"3":
			$Kugeln/Label1.visible = false
			$Kugeln/Label2.visible = true
			$Kugeln/Label3.visible = true
			$Kugeln/Label4.visible = true
			$Kugeln/Label5.visible = false
		"4":
			$Kugeln/Label1.visible = true
			$Kugeln/Label1.position.x += 15
			$Kugeln/Label2.visible = true
			$Kugeln/Label2.position.x += 15
			$Kugeln/Label3.visible = true
			$Kugeln/Label3.position.x += 15
			$Kugeln/Label4.visible = true
			$Kugeln/Label4.position.x += 15
			$Kugeln/Label5.visible = false
		"5":
			$Kugeln/Label1.visible = true
			$Kugeln/Label2.visible = true
			$Kugeln/Label3.visible = true
			$Kugeln/Label4.visible = true
			$Kugeln/Label5.visible = true
	if gestrichen:
		$Gestrichen.visible = true
		match index:
			"0":
				$Gestrichen/K1gestrichen.visible = false
				$Gestrichen/K2gestrichen.visible = false
				$Gestrichen/K3gestrichen.visible = false
				$Gestrichen/K4gestrichen.visible = false
				$Gestrichen/K5gestrichen.visible = false
			"1":
				$Gestrichen/K1gestrichen.visible = false
				$Gestrichen/K2gestrichen.visible = false
				$Gestrichen/K3gestrichen.visible = true
				$Gestrichen/K4gestrichen.visible = false
				$Gestrichen/K5gestrichen.visible = false
				
			"2":
				$Gestrichen/K1gestrichen.visible = false
				$Gestrichen/K2gestrichen.visible = true
				$Gestrichen/K2gestrichen.position.x += 15
				$Gestrichen/K3gestrichen.visible = true
				$Gestrichen/K3gestrichen.position.x += 15
				$Gestrichen/K4gestrichen.visible = false
				$Gestrichen/K5gestrichen.visible = false
			"3":
				$Gestrichen/K1gestrichen.visible = false
				$Gestrichen/K2gestrichen.visible = true
				$Gestrichen/K3gestrichen.visible = true
				$Gestrichen/K4gestrichen.visible = true
				$Gestrichen/K5gestrichen.visible = false
			"4":
				$Gestrichen/K1gestrichen.visible = true
				$Gestrichen/K1gestrichen.position.x += 15
				$Gestrichen/K2gestrichen.visible = true
				$Gestrichen/K2gestrichen.position.x += 15
				$Gestrichen/K3gestrichen.visible = true
				$Gestrichen/K3gestrichen.position.x += 15
				$Gestrichen/K4gestrichen.visible = true
				$Gestrichen/K4gestrichen.position.x += 15
				$Gestrichen/K5gestrichen.visible = false
			"5":
				$Gestrichen/K1gestrichen.visible = true
				$Gestrichen/K2gestrichen.visible = true
				$Gestrichen/K3gestrichen.visible = true
				$Gestrichen/K4gestrichen.visible = true
				$Gestrichen/K5gestrichen.visible = true


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
	if get_parent().get_parent().name == "parentalGateway":
		get_parent().get_parent().number = index


func _setActive():
	active = true
	visible = true


func _setInactive():
	active = false
	visible = false


func _set_ausgangsposition():
	ausgangsposition = global_position
