extends PathFollow2D

signal daylight()
signal nightlight()

func _process(delta):
	progress_ratio += 0.01 * delta
	
	if(progress_ratio < 0.5): 
		$Sun.color = Color("db9800")
		$Time.color = Color("e19c00")
		daylight.emit()
		
	if(progress_ratio >= 0.5):
		$Sun.color = Color("8897a1")
		$Sun.energy = 0.3
		$Time.color = Color ("006fcb")
		nightlight.emit()
	
	
	
