extends Button


@export var index : int
@export var hand : bool = true
@export var flipped : bool = false


var active = true
var ausgangsposition
var dragmode = false
#var anzeigewert : String
var feldHatMauszeiger : bool = false


func _ready():
#	anzeigewert = index
	_initialisiere_Button()
	ausgangsposition = global_position
	if flipped:
		_flip_anzeigen()


func _initialisiere_Button() -> void:
	if hand == false:
		self.size = Vector2(270, 250)
		$Hand.visible = false
		$Kugel1.size = Vector2(50, 50)
		$Kugel2.size = Vector2(50, 50)
		$Kugel3.size = Vector2(50, 50)
		$Kugel4.size = Vector2(50, 50)
		$Kugel5.size = Vector2(50, 50)
		$Kugel1.position = Vector2(10, 100)
		$Kugel2.position = Vector2(60, 100)
		$Kugel3.position = Vector2(110, 100)
		$Kugel4.position = Vector2(160, 100)
		$Kugel5.position = Vector2(210, 100)
		match index:
			0:
				$Kugel1.visible = false
				$Kugel2.visible = false
				$Kugel3.visible = false
				$Kugel4.visible = false
				$Kugel5.visible = false
			1:
				$Kugel1.visible = false
				$Kugel2.visible = false
				#$Kugel3.visible = false
				$Kugel4.visible = false
				$Kugel5.visible = false
			2:
				$Kugel1.visible = false
				$Kugel2.position.x += 25
				$Kugel3.position.x += 25
				$Kugel4.visible = false
				$Kugel5.visible = false
			3:
				$Kugel1.visible = false
				$Kugel5.visible = false
			4:
				$Kugel1.position.x += 25
				$Kugel2.position.x += 25
				$Kugel3.position.x += 25
				$Kugel4.position.x += 25
				$Kugel5.visible = false
	else:
		match index:
			0:
				$Kugel1.visible = false
				$Kugel2.visible = false
				$Kugel3.visible = false
				$Kugel4.visible = false
				$Kugel5.visible = false
			1:
				$Kugel1.visible = false
				$Kugel2.visible = false
				$Kugel3.visible = false
				$Kugel4.visible = false
				#$Kugel5.visible = false
			2:
				$Kugel1.visible = false
				$Kugel2.position = Vector2(115, 135)
				$Kugel3.position = Vector2(85,187)
				$Kugel4.visible = false
				$Kugel5.visible = false
			3:
				$Kugel1.visible = false
				$Kugel4.visible = false
			4:
				$Kugel1.position = Vector2(73, 145)
				$Kugel2.position = Vector2(118, 132)
				$Kugel3.position = Vector2(88,191)
				$Kugel4.position = Vector2(131, 178)
				$Kugel5.visible = false


func _process(delta):
	if dragmode:
		global_position = lerp(global_position, get_global_mouse_position() - size/2, 100 * delta)
		if Input.is_action_just_released("click") and active:
			_resetButton()


func _resetButton():
	global_position = ausgangsposition
	mouse_filter = Control.MOUSE_FILTER_STOP
	z_index = 0
	dragmode = false
	GlobaleVariablen.aktueller_button = null


func _on_button_down():
	GlobaleVariablen.aktueller_button = self
	mouse_filter = Control.MOUSE_FILTER_IGNORE
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


func _flip_anzeigen() -> void:
	$Hand.flip_h = true
	$Kugel1.position = Vector2(90, 125)
	$Kugel2.position = Vector2(156,145)
	$Kugel3.position = Vector2(79,181)
	$Kugel4.position = Vector2(135,204)
	$Kugel5.position = Vector2(116,161)
	if index == 2:
		$Kugel2.position = Vector2(140,145)
		$Kugel3.position = Vector2(90,177)
	elif index == 4:
		$Kugel1.position = Vector2(94, 130)
		$Kugel2.position = Vector2(140,142)
		$Kugel3.position = Vector2(87,179)
		$Kugel4.position = Vector2(132,191)
