class_name TileMapDisplay
extends Control

## View that displays the picture generated through pixels

@export var art_folder_path: String = "res://art/artwork"
@export var noise_img_path : String = "res://art/artwork/noise/noise_image_in_progress.png"
@export var tile_size : int = 1

var color_to_tile_id = {
	Color(1,0,0): 0, #red
	Color(0,1,0): 1, #green
	Color(0,0,1): 2, #blue
	
}

var image: Image
var picture_size: Vector2
var available_pixels : Array = []

func _ready():	
	_initialize_game_ref_data()
	image = _load_random_image()
	available_pixels = _load_available_pixels(image)
	_initialize_tilemap_noise(image)

func _initialize_game_ref_data():
	pass
	
func _load_random_image():
	var random_image_path = Game.ref.data.current_image_path
	if  random_image_path != "":
		image = Image.load_from_file(random_image_path)
		print(random_image_path)
		return image
	else:
		var image_files = _get_image_files(art_folder_path)
		
		if image_files.size() > 0:
			random_image_path = image_files[randi() % image_files.size()]
			Game.ref.data.current_image_path = random_image_path
			## Load the predetermined picture
			image = Image.load_from_file(random_image_path)
			return image

		else:
			print("No images found in the specified folder.")

func _load_available_pixels(image):
	available_pixels = Game.ref.data.avaliable_pixels
	if available_pixels != []:
		return available_pixels
	else:
		picture_size = Vector2(image.get_width(), image.get_height())
		for x in range(picture_size.x):
			for y in range(picture_size.y):
				available_pixels.append(Vector2(x, y))
		return available_pixels

func _initialize_tilemap_noise(image):
	var tilemap = $TileMap
	picture_size = Vector2(image.get_width(), image.get_height())
	for x in range(picture_size.x):
		for y in range(picture_size.y):
			var noise_color = Color(randf(),randf(),randf())
			var tile_id = _get_tile_id_from_color(noise_color)
			tilemap.set_cell(0, Vector2(x,y), tile_id)

func _get_tile_id_from_color(color: Color) -> int:
	if color.r >= color.b  and color.r >= color.g:
		return 0
	elif color.g >= color.b  and color.g >= color.r:
		return 1
	else:
		return 2

func update_display():
	var pps = Game.ref.data.pixels_per_second
	if available_pixels.size() > 0:
		var index = 0
		var pixel_pos = available_pixels.pop_front()
		
		var color = image.get_pixelv(pixel_pos)
		var tile_id = _get_tile_id_from_color(color)
		$TileMap.set_cell(pixel_pos.x, pixel_pos.y, tile_id)
		available_pixels.erase(index)
		index += 1
	

	
func noise_image_exists(file_path) -> bool:
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		file.close()
		return true
	return false

func load_image():
	var random_image_path = Game.ref.data.current_image_path
	if  random_image_path != "":
		image = Image.load_from_file(random_image_path)
		print(random_image_path)
		return image
	else:
		var image_files = _get_image_files(art_folder_path)
		
		if image_files.size() > 0:
			random_image_path = image_files[randi() % image_files.size()]
			Game.ref.data.current_image_path = random_image_path
			## Load the predetermined picture
			image = Image.load_from_file(random_image_path)
			return image

		else:
			print("No images found in the specified folder.")


func generate_noise_image(width,height):
	var img = Image.create(width, height, false, Image.FORMAT_RGBA8)
	
	for x in range(width):
		for y in range(height):
			#img.set_pixel(x, y, Color(randf(), randf(), randf())) # Generates noise
			img.set_pixel(x,y, Color(0,0,0))
	#var texture = ImageTexture.create_from_image(img)
	return img

		
func _get_image_files(folder_path: String) -> Array:
	var dir = DirAccess.open(folder_path)
	if dir == null:
		print("Failed to open directory: ", folder_path)
		return []
	
	var files = []
	dir.list_dir_begin()
	var file_name = dir.get_next()
	
	while file_name != "":
		if !dir.current_is_dir() and file_name.to_lower().ends_with(".png"):
			files.append(folder_path + "/" + file_name)
		file_name = dir.get_next()

	dir.list_dir_end()
	return files


func _on_timer_timeout():
	update_display()
	#print("working")
	
func _on_save_timer_timeout():
	#noise_image.save_png(noise_img_path)
	Game.ref.data.avaliable_pixels = available_pixels
	print("Image Saved")

