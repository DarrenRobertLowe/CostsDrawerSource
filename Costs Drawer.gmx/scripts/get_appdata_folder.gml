///get_appdata_folder();

var appdata         = environment_get_variable("LOCALAPPDATA") + "\";
//var progam_name     = string_replace(game_display_name," ","_");
var progam_name     = string_replace(game_project_name," ","_");
var appdataFolder   = string(appdata) + progam_name;

return appdataFolder;
