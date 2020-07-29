/// find_templates()

show_debug_message("searching for templates");

hcTemplatesList = ds_list_create();
ccTemplatesList = ds_list_create();
hcTemplatesFolder = (working_directory + "/templates/high_court");
ccTemplatesFolder = (working_directory + "/templates/circuit_court");


// HIGH COURT
if directory_exists(hcTemplatesFolder)
{
    show_debug_message("high court templates directory found");
    
    var file = file_find_first(hcTemplatesFolder + "\*.cdf", 0);
    if (file != "")
    {
        show_debug_message("found " +string(file));
        ds_list_add(hcTemplatesList,file); // add file to list
    }
    else show_debug_message("could not find any high court templates!");
    
     
    while (true) // because there's no way to count the number of files in a directory
    {
        file = file_find_next();
        if (file != "")
        {
            show_debug_message("found " +string(file));
            ds_list_add(hcTemplatesList,file); // add file to list
        }
        else
        {
            show_debug_message("no more high court templates found.");
            break;
        }
    }
}
else show_debug_message("could not find high court templates directory");


// CIRCUIT COURT
if directory_exists(ccTemplatesFolder)
{
    show_debug_message("circuit court templates directory found");
    
    var file = file_find_first(ccTemplatesFolder + "\*.cdf", 0);
    if (file != "")
    {
        show_debug_message("found " +string(file));
        ds_list_add(ccTemplatesList,file); // add file to list
    }
    else show_debug_message("could not find any circuit court templates!");
    
    while (true) // because there's no way to count the number of files in a directory
    {
        file = file_find_next();
        if (file != "")
        {
            show_debug_message("found " +string(file));
            ds_list_add(ccTemplatesList,file); // add file to list
        }
        else
        {
            show_debug_message("no more circuit court templates found.");
            break;
        }
    }
}
else show_debug_message("could not find circuit court templates directory");

