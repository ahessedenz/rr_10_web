extends Label


var startwert : int = 0


func _startwert_anzeigen() -> void:
	match startwert:
		0:
			$Kreis1._setze_kreis_neutral()
			$Kreis2._setze_kreis_neutral()
			$Kreis3._setze_kreis_neutral()
			$Kreis4._setze_kreis_neutral()
			$Kreis5._setze_kreis_neutral()
		1:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_neutral()
			$Kreis3._setze_kreis_neutral()
			$Kreis4._setze_kreis_neutral()
			$Kreis5._setze_kreis_neutral()
		2:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_neutral()
			$Kreis4._setze_kreis_neutral()
			$Kreis5._setze_kreis_neutral()
		3:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_farbig()
			$Kreis4._setze_kreis_neutral()
			$Kreis5._setze_kreis_neutral()
		4:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_farbig()
			$Kreis4._setze_kreis_farbig()
			$Kreis5._setze_kreis_neutral()
		5:
			$Kreis1._setze_kreis_farbig()
			$Kreis2._setze_kreis_farbig()
			$Kreis3._setze_kreis_farbig()
			$Kreis4._setze_kreis_farbig()
			$Kreis5._setze_kreis_farbig()
