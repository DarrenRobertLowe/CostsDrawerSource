/// update_run_installer()
var targetPath = (PROGRAM_APPDATA +"\" + TEMP_UPDATE_FILENAME);

debug_message("Running installer file located at:" +string(targetPath));

shell_execute(targetPath, "");
