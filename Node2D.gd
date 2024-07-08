extends Node2D

var available_pixels : Array = []  # Array of individual pixels (example)

const GROUP_SIZE = 4  # Number of pixels per group (e.g., 4x4 block)

func _ready():
	# Initialize available_pixels with individual pixel positions
	for x in range(0, 100, GROUP_SIZE):  # Example range, adjust based on your image dimensions
		for y in range(0, 100, GROUP_SIZE):  # Example range, adjust based on your image dimensions
			# Create a "super-pixel" or block representing GROUP_SIZE x GROUP_SIZE pixels
			available_pixels.append(Vector2(sin(x), y))

	# Example usage: print available super-pixels
	for pixel_pos in available_pixels:
		print("Super-pixel at:", pixel_pos)
