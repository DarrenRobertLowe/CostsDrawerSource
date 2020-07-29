///retrieve_update_file()
show_debug_message("sending update file request");
httpUpdateFile = http_get_file(global.UPDATE_LINK, TEMP_UPDATE_FILENAME);
