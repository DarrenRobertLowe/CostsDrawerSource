/// draw gui
/* Note this doesn't draw the dividers between buttons.
*/

if (view_xview[0] != old_xview)
or (view_yview[0] != old_yview)
or (view_wview[0] != old_wview)
or (view_hview[0] != old_hview)
or (right_column_x != old_right_column_x)
{
    viewX        = view_xview[0];
    viewY        = view_yview[0];
    viewW        = view_wview[0];
    viewH        = view_hview[0];
    guiEndX      = (viewX + page_area_width);
    rightColEndX = (viewX + windowWidth);
    windowEndY   = (viewY + windowHeight);
    footerY      = (viewY + (windowHeight - guiFooterHeight));
    
    old_xview = viewX;
    old_yview = viewY;
    old_wview = viewW;
    old_hview = viewH;
}


// Draw GUI area at top of screen
draw_set_colour(guiColor);
draw_rectangle(viewX, viewY, guiEndX, viewY+(pageStart-rowHeight), 0);

// Draw GUI area at right of screen
draw_rectangle(guiEndX, viewY, rightColEndX, windowEndY, 0);


/* draw area at bottom of screen */
draw_rectangle(viewX, footerY, rightColEndX, windowEndY, 0);
draw_set_colour(guiDividerColor);
draw_line(viewX, footerY, guiEndX, footerY);


var xx = (right_column_x - 1);
draw_line(viewX+xx, viewY+pageStart, viewX+xx, footerY);

var counselX1    = viewX + global.counselX1;
var counselWidth = 200;
var counselX2    = (counselX1 + counselWidth);

var endX = ( global.right_column_x + SCROLLBAR.width + viewX );



// window borders
if ( counselX2 < endX) // don't show if there's not enough space
{
    draw_set_color(guiDividerColor);
    draw_rectangle(counselX1, viewY+seniorCounselWindowY1, counselX1 + counselWidth, viewY+seniorCounselWindowY2,1);    // counsel border
    draw_rectangle(counselX1, viewY+juniorCounselWindowY1, counselX1 + counselWidth, viewY+juniorCounselWindowY2,1);    // counsel border

    draw_set_color(rightColumnWindowColor);
    draw_rectangle(counselX1, viewY+seniorCounselWindowY1, counselX1 + counselWidth, viewY+seniorCounselWindowY2,0);   // counsel
    draw_rectangle(counselX1, viewY+juniorCounselWindowY1, counselX1 + counselWidth, viewY+juniorCounselWindowY2,0);   // counsel
}

/// RIGHT COLUMN AREA ///
draw_set_color(guiDividerColor);
draw_rectangle(viewX+rightColumnWindowsX1,viewY+witnessesWindowY1,    viewX+rightColumnWindowsX2,viewY+witnessesWindowY2,1);            // witnesses border
draw_rectangle(viewX+rightColumnWindowsX1,viewY+itemsWindowY1,        viewX+rightColumnWindowsX2,viewY+itemsWindowY2,1);                    // common items border
draw_rectangle(viewX+rightColumnWindowsX1,viewY+warningsWindowY1,     viewX+rightColumnWindowsX2,viewY+warningsWindowY2,1);              // warnings border



// window backgrounds (white)
draw_set_color(rightColumnWindowColor);
draw_rectangle(viewX+rightColumnWindowsX1, viewY+witnessesWindowY1,     viewX+rightColumnWindowsX2, viewY+witnessesWindowY2,0);       // witnesses
draw_rectangle(viewX+rightColumnWindowsX1, viewY+itemsWindowY1,         viewX+rightColumnWindowsX2, viewY+itemsWindowY2,0);           // common items
draw_rectangle(viewX+rightColumnWindowsX1, viewY+warningsWindowY1,      viewX+rightColumnWindowsX2, viewY+warningsWindowY2,0);        // warnings


// header areas
var counselHeaderY      = viewY+(seniorCounselWindowY1 - rightColumnWindowHeaderHeight);
var witnessesHeaderY    = viewY+(witnessesWindowY1    - rightColumnWindowHeaderHeight);
var itemsHeaderY        = viewY+(itemsWindowY1        - rightColumnWindowHeaderHeight);
var warningsHeaderY     = viewY+(warningsWindowY1     - rightColumnWindowHeaderHeight);


draw_set_color( rightColumnWindowHeaderColor);
if ( counselX2 < endX) // don't show if there's not enough space
{
    draw_rectangle( counselX1, counselHeaderY, counselX1+counselWidth, viewY+seniorCounselWindowY1,   false );   // counsel header area     false );   // defendants header area
}
draw_rectangle( viewX+rightColumnWindowsX1, witnessesHeaderY,  viewX+rightColumnWindowsX2, viewY+witnessesWindowY1,       false );   // witnesses header area
draw_rectangle( viewX+rightColumnWindowsX1, itemsHeaderY,      viewX+rightColumnWindowsX2, viewY+itemsWindowY1,           false );   // common items header area
draw_rectangle( viewX+rightColumnWindowsX1, warningsHeaderY,   viewX+rightColumnWindowsX2, viewY+warningsWindowY1,        false );   // warnings header area


// header text
var counselHeaderTextY      = (counselHeaderY    + 20);
var witnessesHeaderTextY    = (witnessesHeaderY  + 20);
var itemsHeaderTextY        = (itemsHeaderY      + 20);
var warningsHeaderTextY     = (warningsHeaderY   + 20);

reset_text();
draw_set_font(font_GUI);
draw_set_color(global.menuTextColor);


if ( counselX2 < endX) // don't show if there's not enough space
{
    draw_text(counselX1, counselHeaderTextY,    "Counsel");
}

draw_set_halign(fa_center);
var headerX = (viewX + headerTextX);
draw_text(headerX, witnessesHeaderTextY,  "Witnesses");
draw_text(headerX, itemsHeaderTextY,      "Items");
draw_text(headerX, warningsHeaderTextY,   "Warnings");


