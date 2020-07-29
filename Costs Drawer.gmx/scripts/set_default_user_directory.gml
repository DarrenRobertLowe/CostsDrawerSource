///set_default_user_directory();

var it = environment_get_variable("USERPROFILE");    // folder to start in when user selects "Save As"
it += "\desktop";

return it;
