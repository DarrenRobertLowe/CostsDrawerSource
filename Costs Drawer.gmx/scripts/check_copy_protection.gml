///check_copy_protection();
var appdata         = environment_get_variable("LOCALAPPDATA") + "\";
var folder          = string(appdata) + "DO_NOT_DELETE";
var file            = string(folder) + "\validate";
var validateString  = "valid";
var laptop          = false;

if (file_text_get(file) == string(validateString))
{
    laptop = true;
}
else
{
    laptop = false;
}

return laptop;
