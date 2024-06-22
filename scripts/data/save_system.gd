class_name SaveSystem
## Save manager


const PATH : String = "user://save.tres"
const SHOULD_LOAD : bool = true

## Save Game.ref.data objecct in a save file
static func save_data() -> void:
	ResourceSaver.save(Game.ref.data, PATH)
	

## loads data and overrides Game.ref.data object
static func load_data() -> void:
	#checks if there exists file to load
	if not SHOULD_LOAD:
		return
	
	if ResourceLoader.exists(PATH):
		Game.ref.data = load(PATH) 
