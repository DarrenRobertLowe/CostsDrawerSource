///open_FAQs()

if (global.online == true)
{
    url_open("https://darrenrobertlowe.github.io/CostsDrawer/FAQs.html");
}


if (global.online == false)
{
    var file = "FAQs.html";
                            
    if file_exists(file)
    {
        shell_do("open", file)
    }
    else write_log("FAQs file not found");
}
