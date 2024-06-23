extends Node2D

## View that displays the picture generated through pixels

@export var art_folder_path: String = "res://art/artwork"

var image: Image
var noise_image: Image
var texture: ImageTexture
var picture_size: Vector2
var available_pixels: Array
var pending_updates = []

func _ready():
	image = load_image()
	var image_texture = ImageTexture.create_from_image(image)
	
	picture_size = Vector2(image.get_width(), image.get_height())
	noise_image=generate_noise_image(image.get_width(), image.get_height())
	var noise_texture = ImageTexture.create_from_image(noise_image)
	$TextureRect.texture = noise_texture
	
	available_pixels = []
	for x in range(picture_size.x):
		for y in range(picture_size.y):
			available_pixels.append(Vector2(x, y))
	available_pixels.shuffle()
"""
func _process(delta):	
	for _i in range(1):
		if available_pixels.size() > 0:
			var index = randi() % available_pixels.size()
			var pixel_pos = available_pixels[index]
			available_pixels.erase(index)
			var color = image.get_pixelv(pixel_pos)
			pending_updates.append({"pos": pixel_pos, "color": color})

	if pending_updates.size() > 0:
		apply_pending_updates()
"""

func generate_unique_pixels():
	var updates_per_frame = 10  # Number of pixels to update per frame
	var updates_count = 0
	
	for _i in range(100):
		if available_pixels.size() > 0 and updates_count < updates_per_frame:
			var pixel_pos = available_pixels.pop_front()  # Get the first pixel (shuffled order)
			
			var color = image.get_pixelv(pixel_pos)
			noise_image.set_pixelv(pixel_pos, color)
			updates_count += 1
		
		# If updates_per_frame pixels have been updated, update the display
		if updates_count >= updates_per_frame:
			update_textures()
			updates_count = 0  # Reset updates count

	# Final update after loop ends (in case not all updates_per_frame were made)
	if updates_count > 0:
		update_textures()

func apply_pending_updates():
	for update in pending_updates:
		noise_image.set_pixelv(update["pos"], update["color"])

	pending_updates.clear()
	update_textures()

func update_textures():
	texture = ImageTexture.create_from_image(noise_image)
	$TextureRect.texture = texture

func load_image():
	var image_files = _get_image_files(art_folder_path)
	
	if image_files.size() > 0:
		var random_image_path = image_files[randi() % image_files.size()]
		
		## Load the predetermined picture
		var image = Image.load_from_file(random_image_path)
		return image

	else:
		print("No images found in the specified folder.")

func generate_noise_image(width,height):
	var img = Image.create(width, height, false, Image.FORMAT_RGBA8)
	
	for x in range(width):
		for y in range(height):
			img.set_pixel(x, y, Color(0, 0, 0)) # Sets the color at (1, 2) to red.
	#var texture = ImageTexture.create_from_image(img)
	return img


func update_display():
	var updates_per_frame = 10  # Number of pixels to update per frame
	var updates_count = 0
	for _i in range(1000):
		if available_pixels.size() > 0 and updates_count < updates_per_frame:
			var index = 0
			var pixel_pos = available_pixels.pop_front()
			available_pixels.erase(index)
		
			var color = image.get_pixelv(pixel_pos)
			noise_image.set_pixelv(pixel_pos, color)
			#print(color)
			index += 1
	texture = ImageTexture.create_from_image(noise_image)
	$TextureRect.texture = texture
			
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
	print("working")
	#update_display()
	generate_unique_pixels()
