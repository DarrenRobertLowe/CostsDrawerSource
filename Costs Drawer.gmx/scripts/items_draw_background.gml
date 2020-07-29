var str1 = argument0;

var white       = c_white;
var cyan        = make_color_rgb(235,255,255);
var green       = make_color_rgb(225,255,225);
var darkGreen   = make_color_rgb(197,255,197);
var green2      = make_color_rgb(185,215,185);
var darkGreen2  = make_color_rgb(157,215,157);
var lightYellow = make_color_rgb(255,255,245);
var darkYellow  = make_color_rgb(255,255,235);
var lightYellow = make_color_rgb(255,250,217);
var darkYellow  = make_color_rgb(246,238,188);
var ltGray      = make_color_rgb(240,240,240);
var ltBlue      = make_color_rgb(245,245,255);
var gray        = make_color_rgb(230,230,230);



// global.currentItemNumber // is how far down the list we've scrolled
// i // is the current list item

// therefore, i can be 1 while global.currentItemNumber is 5
// so if we want to assign values specific to the list position
// we need i-global.currentItemNumber

listVal = (i + global.currentItemNumber);

/*if (carriedOver == false) // if our item is one line
{
    if (i mod 2 == 0)
      then colorBinary  = true;
      else colorBinary  = false;
}*/


colorBinary = ds_list_find_value(colorValueList,listVal);


// default for most items
// BLUE
if (colorBinary == false)
  then bgColor = cyan;
  else bgColor = ltBlue;


// everything else is an exception to the above
// YELLOW
if (string_count("Add Blank Item",str1) > 0)
or (string_count("Add white space",str1) > 0)
or (string_count("Instructions Fee",str1) > 0)
{
    if (colorBinary == false)
      then bgColor = lightYellow;
      else bgColor = darkYellow;
}

// GRAY
if (string_count("Attending counsel",str1) > 0)
or (string_count("Attending to file",str1) > 0)
or (string_count("Affidavit of Verification",str1) > 0)
or (string_count("Commissioners fee",str1) > 0)
or (str1 == "Stamp")
{
    if colorBinary == false
      then bgColor = gray;
      else bgColor = white;
}

// GREEN
if (string_count("Senior Counsel Fee",str1) > 0)
{
    if (colorBinary == false)
      then bgColor = green2;
      else bgColor = darkGreen2;
}

if (string_count("Junior Counsel Fee",str1) > 0)
{
    if (colorBinary == false)
      then bgColor = green;
      else bgColor = darkGreen;
}





if (str1 = SCROLLDOWN_MESSAGE)
{
    bgColor = white;
}



//prevColor = bgColor;

// I think this is trying to keep things within the item window?
// yy2 is our current list item's end position
var myY2 = ( view_yview[0] +yy2 +separation );
if (myY2 > ( view_yview[0] +global.itemsWindowY2) )
  then myY2 = (view_yview[0] + global.itemsWindowY2);


draw_set_color(bgColor);
draw_rectangle(view_xview[0]+xx, view_yview[0]+yy1, view_xview[0]+xx2, myY2, false);

draw_set_color(global.guiDividerColor);
draw_rectangle(view_xview[0]+xx, view_yview[0]+yy1, view_xview[0]+xx2, myY2, true);

