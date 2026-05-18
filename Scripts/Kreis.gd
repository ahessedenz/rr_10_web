extends Label


var feedback = StyleBoxFlat.new()


func _setze_kreis_farbig():
	var width = 20
	var radius = 170
	var einfuege_style = StyleBoxFlat.new()
	einfuege_style.bg_color = Color.RED
	einfuege_style.border_width_left = width
	einfuege_style.border_width_top = width
	einfuege_style.border_width_right = width
	einfuege_style.border_width_bottom = width
	einfuege_style.border_color = Color.BLACK
	einfuege_style.corner_radius_top_left = radius
	einfuege_style.corner_radius_top_right = radius
	einfuege_style.corner_radius_bottom_right = radius
	einfuege_style.corner_radius_bottom_left = radius
	self.set("theme_override_styles/normal", einfuege_style)


func _setze_kreis_hellrot():
	var width = 20
	var radius = 170
	var einfuege_style = StyleBoxFlat.new()
	einfuege_style.bg_color = Color.PALE_VIOLET_RED
	einfuege_style.border_width_left = width
	einfuege_style.border_width_top = width
	einfuege_style.border_width_right = width
	einfuege_style.border_width_bottom = width
	einfuege_style.border_color = Color.BLACK
	einfuege_style.corner_radius_top_left = radius
	einfuege_style.corner_radius_top_right = radius
	einfuege_style.corner_radius_bottom_right = radius
	einfuege_style.corner_radius_bottom_left = radius
	self.set("theme_override_styles/normal", einfuege_style)


func _setze_kreis_neutral():
	var width = 20
	var radius = 170
	var einfuege_style = StyleBoxFlat.new()
	einfuege_style.bg_color = Color.WHITE
	einfuege_style.border_width_left = width
	einfuege_style.border_width_top = width
	einfuege_style.border_width_right = width
	einfuege_style.border_width_bottom = width
	einfuege_style.border_color = Color.BLACK
	einfuege_style.corner_radius_top_left = radius
	einfuege_style.corner_radius_top_right = radius
	einfuege_style.corner_radius_bottom_right = radius
	einfuege_style.corner_radius_bottom_left = radius
	self.set("theme_override_styles/normal", einfuege_style)
