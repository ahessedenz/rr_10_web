extends Label


var feedback = StyleBoxFlat.new()


func _setze_farbig():
	var width = 2
	var einfuege_style = StyleBoxFlat.new()
	if get_tree().current_scene.name == "legeseite6" and (self.name == "Raketenquadrat1" or self.name == "Raketenquadrat2" or self.name == "Raketenquadrat3" or self.name == "Raketenquadrat4" or self.name == "Raketenquadrat5"):
		einfuege_style.bg_color = Color.BLUE
	else:
		einfuege_style.bg_color = Color.RED
	einfuege_style.border_width_left = width
	einfuege_style.border_width_top = width
	einfuege_style.border_width_right = width
	einfuege_style.border_width_bottom = width
	einfuege_style.border_color = Color.BLACK
	if self.name == "Raketenquadrat5":
		einfuege_style.border_width_top = 5
	if self.name == "Raketenquadrat6":
		einfuege_style.border_width_bottom = 5
	self.set("theme_override_styles/normal", einfuege_style)


func _setze_neutral():
	var width = 2
	var einfuege_style = StyleBoxFlat.new()
	einfuege_style.bg_color = Color.WHITE
	einfuege_style.border_width_left = width
	einfuege_style.border_width_top = width
	einfuege_style.border_width_right = width
	einfuege_style.border_width_bottom = width
	einfuege_style.border_color = Color.BLACK
	if self.name == "Raketenquadrat5":
		einfuege_style.border_width_top = 5
	if self.name == "Raketenquadrat6":
		einfuege_style.border_width_bottom = 5
	self.set("theme_override_styles/normal", einfuege_style)
