extends Label


@export var next : Label
@export var hand : bool = true
@export var szene_verwaltet_feld : bool = false

var szene : Control
var gesucht : int
var mauszeigerImFeld = false
var feedback = StyleBoxFlat.new()
var aufgaben_grundgeruest
var korrekt:bool = false
var active:bool = false
var used : bool = true


func _ready():
	_set_neutral()
	aufgaben_grundgeruest = get_tree().current_scene.get_node("AufgabenGrundgeruest")
	szene = get_tree().current_scene
	if !used:
		korrekt = true
		aufgaben_grundgeruest.korrekt_geloest()


func _process(_delta):
	if Input.is_action_just_released("click"):
		var button = GlobaleVariablen.aktueller_button
		if button and mauszeigerImFeld and active:
			if szene_verwaltet_feld:
				szene._aufmerksamkeitssteuerung_aus()
			_setze_Anzeige(int(button.index))
			_pruefen(int(button.index))


func _setze_Anzeige(anzahl : int) -> void:
	if hand == true:
		$Hand.visible = true
		if anzahl == 2:
			$Kugel2.position = Vector2(115, 135)
			$Kugel3.position = Vector2(85, 187)
		elif anzahl == 4:
			$Kugel1.position = Vector2(73, 145)
			$Kugel2.position = Vector2(118, 132)
			$Kugel3.position = Vector2(88, 191)
			$Kugel4.position = Vector2(131, 178)
	else:
		$Kugel1.size = Vector2(50, 50)
		$Kugel2.size = Vector2(50, 50)
		$Kugel3.size = Vector2(50, 50)
		$Kugel4.size = Vector2(50, 50)
		$Kugel5.size = Vector2(50, 50)
		$Kugel1.position = Vector2(10, 10)
		$Kugel2.position = Vector2(100, 10)
		$Kugel3.position = Vector2(10, 100)
		$Kugel4.position = Vector2(100, 100)
		$Kugel5.position = Vector2(55, 55)
	match anzahl:
		1:
			$Kugel5.visible = true
		2:
			$Kugel2.visible = true
			$Kugel3.visible = true
		3:
			$Kugel2.visible = true
			$Kugel3.visible = true
			$Kugel5.visible = true
		4:
			$Kugel1.visible = true
			$Kugel2.visible = true
			$Kugel3.visible = true
			$Kugel4.visible = true
		5:
			$Kugel1.visible = true
			$Kugel2.visible = true
			$Kugel3.visible = true
			$Kugel4.visible = true
			$Kugel5.visible = true


func _set_neutral():
	feedback.bg_color = Color(1, 1, 1, 0)
	if szene_verwaltet_feld:
		var width = 0
		feedback.border_width_left = width
		feedback.border_width_top = width
		feedback.border_width_right = width
		feedback.border_width_bottom = width
		feedback.border_color = Color(0, 0, 0, 0)
		self.set("theme_override_styles/normal", feedback)
	else:
		var width = 2
		feedback.border_width_left = width
		feedback.border_width_top = width
		feedback.border_width_right = width
		feedback.border_width_bottom = width
		feedback.border_color = Color.BLACK
		self.set("theme_override_styles/normal", feedback)
	$Hand.visible = false
	$Kugel1.visible = false
	$Kugel2.visible = false
	$Kugel3.visible = false
	$Kugel4.visible = false
	$Kugel5.visible = false


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


func _pruefen(ergebnis : int):
	if ergebnis == gesucht or !used:
		korrekt = true
		if ergebnis == gesucht and used:
			$Richtig.play()
		aufgaben_grundgeruest.korrekt_geloest()
		if used:
			if szene_verwaltet_feld:
				szene._feedback_richtig()
			else:
				_set_true()
		if next != null:
			next.setActive(true)
		setActive(false)
		$ResetTimer.stop()
	else:
		korrekt = false
		$Falsch.play()
		if szene_verwaltet_feld:
			szene._feedback_falsch()
		else:
			_set_false()
		$ResetTimer.start()


func setActive(b : bool):
	active = b
	if szene_verwaltet_feld:
		if b:
			szene._aufmerksamkeitssteuerung_ein()
	else:
		applyHighlighting(b)


func setUsed(b :bool):
	used = b
	visible = b


func _on_reset_timer_timeout():
	_set_neutral()
	if szene_verwaltet_feld:
		szene._aufmerksamkeitssteuerung_ein()
	else:
		applyHighlighting(true)


func _on_area_2d_area_entered(area):
	if area.is_in_group("Button"):
		mauszeigerImFeld = true


func _on_area_2d_area_exited(area):
	if area.is_in_group("Button"):
		mauszeigerImFeld = false


func _setze_gesucht(zahl : int) -> void:
	gesucht = zahl
