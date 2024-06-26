extends Resource

class_name SaveData

@export var top_score: int
@export var top_player: String

const SAVE_PATH: String = "user://BirdThatFlaps.tres"

func save_scores():
	ResourceSaver.save(self, SAVE_PATH)
	

static func load_or_create() -> SaveData:
	print('load or create')
	var resource: SaveData
	
	if(FileAccess.file_exists(SAVE_PATH)):
		print('file loaded')
		resource = load(SAVE_PATH) as SaveData
	else:
		print('file created')
		resource = SaveData.new()
	
	return resource
