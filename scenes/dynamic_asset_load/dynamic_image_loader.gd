extends Node

const SERVER_URL = "http://192.168.0.108:8000" 
const ASSETS_FOLDER = "user://assets/"

@onready var http_request: AwaitableHTTPRequest = $AwaitableHTTPRequest

func load_image(image_name:String) -> Image:
	var image := await get_image_from_server(image_name)
	var image_path := ASSETS_FOLDER + image_name
	if image == null && FileAccess.file_exists(image_path):
		image = Image.new()
		var bytes := FileAccess.get_file_as_bytes(image_path)
		image.load_png_from_buffer(bytes)
	return image

func get_image_from_server(remote_name:String) -> Image:
	print(OS.get_user_data_dir())
	if not DirAccess.dir_exists_absolute(ASSETS_FOLDER):
		DirAccess.make_dir_absolute(ASSETS_FOLDER)

	var headers :PackedStringArray
	var saved_data_path := ASSETS_FOLDER + remote_name
	
	var saved_date_path := saved_data_path + ".date"

	if FileAccess.file_exists(saved_date_path):
		var modified_date := FileAccess.get_file_as_string(saved_date_path)
		headers.append("if-modified-since: " + modified_date)
		
	var result := await http_request.async_request(SERVER_URL + "/assets/" + remote_name, headers)
	if not result.success():
		return null
		
	var bytes:PackedByteArray
	
	if result.status == 304:
		bytes = FileAccess.get_file_as_bytes(saved_data_path)
	elif result.bytes.is_empty():
		return null
	else:
		bytes = result.bytes

	var image := Image.new()	
	
	if image.load_png_from_buffer(bytes) != OK:
		return null
	
	if result.status != 304:
		image.save_png(saved_data_path)
		var modified_date:String = result.headers["last-modified"]
		var file_access = FileAccess.open(saved_date_path,FileAccess.WRITE)
		file_access.store_string(modified_date)
	
	return image
