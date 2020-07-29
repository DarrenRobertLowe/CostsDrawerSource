/// create_update_page()
/* Creates a html page with a hyperlink
 * leading directly to the download.
*/
//var appdataFolder = PROGRAM_APPDATA;


// delete existing html page
var fileName = "update_page.html";
if (file_exists(fileName)) then file_delete(fileName);


// create a new page
var file = file_text_open_write(fileName);


// create and populate a list with the HTML code
var list = ds_list_create();
ds_list_add(list,'<!DOCTYPE html>');
ds_list_add(list,'<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">');
ds_list_add(list,'<head>');
ds_list_add(list,'<title>Costs Drawer Update</title>');
ds_list_add(list,'</head>');
ds_list_add(list,'<body>');
ds_list_add(list,'<p>');
ds_list_add(list,'<a href='+string(global.UPDATE_LINK)+'> <img src="splash_small.png" alt="Costs Drawer logo"> ');
ds_list_add(list,'<br/>');
ds_list_add(list,'Click here to download the Costs Drawer update </a>');
ds_list_add(list,'</p>');
ds_list_add(list,'</body>');
ds_list_add(list,'</html>');

// write the code to the html file
var size = ds_list_size(list);

for(var i=0; i<size; i++)
{
    str = ds_list_find_value(list,i);
    file_text_write_string(file,str);
    file_text_writeln(file);
}
// close the file
file_text_close(file);


// open the html file
//var location = ( string(appdata) + string(progam_name) +"\" +string(fileName));
var location = ( PROGRAM_APPDATA +"\" +string(fileName));

// FFS, sprite_save() is broken?! Come the fuck on YoYo.
// We have to use surface_save() instead.
var sprite = splash_small;
var surf = surface_create(sprite_get_width(sprite), sprite_get_height(sprite));
surface_set_target(surf);
draw_sprite(sprite, 0, 0 + sprite_get_xoffset(sprite), 0 + sprite_get_yoffset(sprite));
surface_reset_target();
surface_save(surf, 'splash_small.png');
surface_free(surf);



shell_do("open",location);


// clean up
if ds_exists(list,ds_type_list) then ds_list_destroy(list);
