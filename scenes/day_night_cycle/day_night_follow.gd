extends PathFollow2D

@export var is_sun: bool

signal daylight()
signal nightlight()

const SET_RATIO: float = 0.00005
const UP_RATIO: float = 0.0001

func _ready():
	if(is_sun):
		$Sun.visible = true
		$Moon.visible = false
	else:
		$Sun.visible = false
		$Moon.visible = true

func _process(_delta):
	
	if(Globals.is_game_active):
		progress_ratio += UP_RATIO
	
	if(progress_ratio < 0.4976): 
		$Time.color = Color("e19c00")
		daylight.emit()
		
	if(progress_ratio >= 0.4976):
		$Time.color = Color ("006fcb")
		nightlight.emit()
	
	
	
