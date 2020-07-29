/// open_whats_new()

if (global.online == true)
{
    url_open(WEBSITE);//"https://darrenrobertlowe.github.io/CostsDrawer/index.html");
}


if (global.online == false)
{
    var file = "whats_new.html";

    if (file_exists(file))
    {
        shell_do("open",file)
    }
    else show_debug_message(string(file)+" file not found");
}
