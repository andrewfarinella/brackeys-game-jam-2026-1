class_name GameUtils
extends Object

static func get_all_files_from_directory(path: String, file_ext: String = "", files: Array = []):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				files = get_all_files_from_directory(dir.get_current_dir() + "/" + file_name, file_ext, files)
			else:
				if file_ext == "" or file_name.get_extension() == file_ext:
					files.append(dir.get_current_dir() + "/" + file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
	return files
	
static func combine_arrays(array1:Array, array2:Array) -> Array:
	var newArray = []
	newArray.append_array(array1)
	newArray.append_array(array2)
	return newArray
	
static func format_number(number: int) -> String:
	var numStr: String = str(number).lstrip("-")    # this line changed
	var result: String = ""
	var count: int = 0

	for i in range(numStr.length() - 1, -1, -1):
		result = numStr[i] + result
		count += 1
		if count % 3 == 0 and i != 0:
			result = "," + result

	if number < 0:
		result = "-" + result

	return result
