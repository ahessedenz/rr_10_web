extends Label


@export var next : Label

var gesucht : int
var mauszeigerImFeld = false
var feedback = StyleBoxFlat.new()
var aufgaben_grundgeruest
var korrekt:bool = false
var active:bool = false


func _ready():
	_set_neutral()
	aufgaben_grundgeruest = get_tree().current_scene.get_node("AufgabenGrundgeruest")


func _process(_delta):
	if Input.is_action_just_released("click"):
		var button = GlobaleVariablen.aktueller_button
		if button and mauszeigerImFeld and active:
			_kugeln_anzeigen(button.index)
			await get_tree().create_timer(1.0).timeout
			_pruefen(button.index)


func _kugeln_anzeigen(zahl : int) -> void:
	match zahl:
		0:
			$Kugel1.visible = false
			$Kugel2.visible = false
			$Kugel3.visible = false
			$Kugel4.visible = false
			$Kugel5.visible = false
		1:
			$Kugel1.visible = false
			$Kugel2.visible = false
			$Kugel3.visible = true
			$Kugel4.visible = false
			$Kugel5.visible = false
		2:
			$Kugel1.visible = false
			$Kugel2.visible = true
			$Kugel2.position.x += 55
			$Kugel3.visible = true
			$Kugel3.position.x += 55
			$Kugel4.visible = false
			$Kugel5.visible = false
		3:
			$Kugel1.visible = false
			$Kugel2.visible = true
			$Kugel3.visible = true
			$Kugel4.visible = true
			$Kugel5.visible = false
		4:
			$Kugel1.visible = true
			$Kugel1.position.x += 55
			$Kugel2.visible = true
			$Kugel2.position.x += 55
			$Kugel3.visible = true
			$Kugel3.position.x += 55
			$Kugel4.visible = true
			$Kugel4.position.x += 55
			$Kugel5.visible = false
		5:
			$Kugel1.visible = true
			$Kugel2.visible = true
			$Kugel3.visible = true
			$Kugel4.visible = true
			$Kugel5.visible = true


func _set_neutral():
	feedback.bg_color = Color.WHITE
	applyHighlighting(active)
	self.set("theme_override_styles/normal", feedback)
	$Kugel1.visible = false
	$Kugel2.visible = false
	$Kugel3.visible = false
	$Kugel4.visible = false
	$Kugel5.visible = false
	$Kugel1.position.x = 5
	$Kugel2.position.x = 110
	$Kugel3.position.x = 215
	$Kugel4.position.x = 320
	$Kugel5.position.x = 425


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
	if ergebnis == gesucht:
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


func _on_area_2d_area_entered(_area):
	mauszeigerImFeld = true


func _on_area_2d_area_exited(_area):
	mauszeigerImFeld = false


func _setze_gesucht(zahl : int) -> void:
	gesucht = zahl
