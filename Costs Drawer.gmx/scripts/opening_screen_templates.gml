///opening_screen_templates()

reset_text();


// draw the templates
var list;

if (global.TEMPLATE_TYPE_SELECTED = "highcourt") then list = hcTemplatesList;
if (global.TEMPLATE_TYPE_SELECTED = "circuit")   then list = ccTemplatesList;
//if (global.TEMPLATE_TYPE_SELECTED = "tutorials") then list = tutorialsList;

var size = ds_list_size(list);

if (size > 0)
{
    draw_set_font(font_GUI_large);
    draw_set_halign(fa_left);
    
    var sep             = (separation + 5);
    var strLen          = 0;
    var xx              = templatesContentX; // see opening_screen_master draw event, near bottom//(465);
    var yy              = (255);
    var scrollAreaWidth = (310)-16; // -16 for button size
    var areaHeight      = (y2-y1);
    var maxDrawn        = 11; // (areaHeight/sep);
    var x2 = (xx + scrollAreaWidth)
    
    // draw the items and buttons
    for(i=0; i<(maxDrawn); i++)
    {
        var fileFromList = ds_list_find_value(list,i);
        
        if !(is_undefined(fileFromList))
        {
            var y3 = (((yy-sep) + (i*sep)));
            
            // highlight line
            if (mouseOverArea(xx,y3,x2,y3+sep))
            {
                draw_set_color(global.highlightColor)
                draw_set_alpha(global.highlightAlpha);
                draw_rectangle(xx,y3,x2,y3+sep,0);
                
                // CLICKING ON A RECENT FILE
                if ( mouse_check_button_released(mb_left) )
                {
                    window_set_cursor(cr_default)
                    global.fileToOpen = fileFromList;
                    
                    
                    // add directory to fileToOpen
                    if (list == hcTemplatesList) then global.fileToOpen = ( string(hcTemplatesFolder) + "/" +string(fileFromList) );
                    if (list == ccTemplatesList) then global.fileToOpen = ( string(ccTemplatesFolder) + "/" +string(fileFromList) );
                    room_goto(WINDOW);
                    //load_file();
                }
            }
            
            // DRAW THE LIST OF RECENT FILES
            strLen          = string_length(fileFromList);
            var chars       = strLen-(templatesScroll-1);
            var charWidth   = global.estimatedCharacterWidth * 1.2;     // the width of a single character (estimated)
            var maxChars    = ((scrollAreaWidth) / charWidth);          // how long of the string we can show
            if (chars > maxChars) then chars = maxChars;
            str = filename_name(fileFromList);                          // grab only the filename after last "\"
            
            var subStr = "";
            if (string_count("Circuit Court - ", str) > 0)  then subStr = "Circuit Court - ";
            if (string_count("High Court - ", str) > 0)     then subStr = "High Court - ";
            str = string_replace(str,subStr,"");
            
            str = string_copy(str,templatesScroll,chars);               // grab only enough letters to fit the area
            // NOTE: templatesScroll code should actually be determined by a scrollbar
            
            draw_set_alpha(1);
            draw_set_color(global.itemTextColor);
            if (i < size)
            then draw_text(xx, yy+(i*sep), str);    // finall draw the list contents
        }
    }

    
    // CLEANUP
    reset_text();
}
