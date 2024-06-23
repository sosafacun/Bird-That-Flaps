extends PathFollow2D

signal daylight()
signal nightlight()

const SET_RATIO: float = 0.00005
const UP_RATIO: float = 0.0001

func _process(_delta):
	if(Globals.is_game_active):
		progress_ratio += UP_RATIO
	
	if(progress_ratio < 0.7117): 
		$Time.color = Color("e19c00")
		$Sun.visible = true
		daylight.emit()
		
	if(progress_ratio >= 0.7117):
		$Time.color = Color ("006fcb")
		$Sun.visible = false
		nightlight.emit()
	
	
	
