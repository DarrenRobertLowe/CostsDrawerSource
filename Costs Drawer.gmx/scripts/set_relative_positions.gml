///set_relative_positions()
/* Updates the positions of all aspects of the
 * program based on the size of the window.
 *
 * Called by MASTER create event.
 * Also called when resizing the window or right column.
*/

/// NOTE: minimum height and width is set in MASTER create event.
var windowHeight = round( window_get_height() );
var windowWidth  = round( window_get_width()  );
display_set_gui_size(windowWidth,windowHeight); // resize the gui layer to our window size

global.rowHeight = (global.defaultRowHeight * global.scale);   // rescale to the global.scale


// POSITION the RIGHT COLUMN 
/// NOTE: see user_resize_right_column();
refresh_right_column();

page_area_width = ( windowWidth - right_column_width );


// WARNINGS WINDOW HEIGHT
// ITEMS WINDOW HEIGHT
// etc...

// column positions //
var documentWidth  = global.pageWidth + (33*global.scale);              // dateColumnX

global.rowNumberX  = floor(page_area_width/2) - (documentWidth/2);      // everything is relative to row number x
if (global.rowNumberX < 0) then global.rowNumberX = 0;                  // keep it on the screen


// Keep the document in view
var viewMax         = ((view_xview[0] + view_wview[0]) - right_column_width);
var documentMax     = (global.rowNumberX + (global.pageWidth*global.scale));

if  (view_xview[0] < global.rowNumberX)
and (documentMax > viewMax)
{
    view_xview[0] = 0;
    global.rowNumberX = 0;
}

global.dateColumnX              = floor(global.rowNumberX + (33*global.scale));
global.itemNoColumnX            = floor(global.dateColumnX + (43*global.scale));
global.cColumnX                 = floor(global.itemNoColumnX + (40*global.scale));
global.descriptionColumnX       = floor(global.cColumnX + (13*global.scale));
global.outlayColumnX            = floor(global.descriptionColumnX + (316*global.scale));
global.fColumnX                 = floor(global.outlayColumnX + (81*global.scale));
global.professionalColumnX      = floor(global.fColumnX + (50*global.scale));
global.hColumnX                 = floor(global.professionalColumnX + (81*global.scale));


// right column windows //
global.rightColumnWindowsX1     = round( (windowWidth - right_column_width) + global.scrollbarButtonSize + windowMargins );
global.rightColumnWindowsX2     = round( windowWidth - windowMargins );

guiHeight               = (windowHeight - global.menuTextHeight); // for a space at the bottom of the window
var guiWidth            = windowWidth;
var initHeight          = floor( (guiHeight - (windowMargins*6) - (global.rightColumnWindowHeaderHeight * 6)) / 9);


minHeight = (global.warnings_separation + global.scrollbarButtonSize + global.rightColumnItemsSeparation);



if (global.GUI_SCALE == 1)
{
    global.counselWidth = 180;
    global.counselX1    = 560;
}

if (global.GUI_SCALE == 1.5)
{
    global.counselWidth = 270;
    global.counselX1    = 730;
}


// senior counsel
//global.seniorCounselWindowY1       = round( global.rightColumnWindowHeaderHeight + 10);
//if (global.GUI_SCALE != 1) then 
global.seniorCounselWindowY1 = round( global.rightColumnWindowHeaderHeight + 1);
global.seniorCounselWindowY2 = round( global.seniorCounselWindowY1 + (global.rightColumnWindowHeaderHeight*global.GUI_SCALE) );


// junior counsel
global.juniorCounselWindowY1 = round( global.seniorCounselWindowY2 + windowMargins );
global.juniorCounselWindowY2 = round( global.juniorCounselWindowY1 + (global.rightColumnWindowHeaderHeight*global.GUI_SCALE) );







// witnesses
global.witnessesWindowY1    = round(global.rightColumnWindowHeaderHeight);
global.witnessesWindowY2    = round( global.witnessesWindowY1 + 100);
if (global.GUI_SCALE == 1.5) then global.witnessesWindowY2 = round( global.witnessesWindowY1 + 150);

if (global.witnessesWindowY2 - global.witnessesWindowY1) < minHeight
 then global.witnessesWindowY2 = (global.witnessesWindowY1 + minHeight);

 
// items
global.itemsWindowY1        = round( global.witnessesWindowY2 + global.rightColumnWindowHeaderHeight + windowMargins );
global.itemsWindowY2        = round( global.itemsWindowY1 + initHeight*6 );

if (global.itemsWindowY2 - global.itemsWindowY1) < minHeight
 then global.itemsWindowY2 = (global.itemsWindowY1 + minHeight);

 
// warnings
global.warningsWindowY1     = round( global.itemsWindowY2 + global.rightColumnWindowHeaderHeight + windowMargins );
global.warningsWindowY2     = round( windowHeight - windowMargins );


// adjust if off screen
if ((global.warningsWindowY2 - global.warningsWindowY1) < minHeight)
{
    global.warningsWindowY2 = (global.warningsWindowY1 + minHeight);
}

if (global.warningsWindowY2 > windowHeight)
{
    global.warningsWindowY1 = (windowHeight - windowMargins - minHeight);
    global.warningsWindowY2 =  round( windowHeight      - windowMargins);
    global.itemsWindowY2    =  (global.warningsWindowY1 - global.rightColumnWindowHeaderHeight - windowMargins);
}

headerTextX  = round(global.rightColumnWindowsX1 + ((global.rightColumnWindowsX2 - global.rightColumnWindowsX1)/2));





// make stuff global
global.page_area_width          = page_area_width;
global.right_column_width       = right_column_width;
global.right_column_x           = right_column_x;
global.right_column_percentage  = percentageWidth;
global.descriptionColumnWidth   = (global.outlayColumnX - global.descriptionColumnX);   //341;



if instance_exists(witnesses_SCROLLBAR_H) then witnesses_SCROLLBAR_H.alarm[0] = 1;
if instance_exists(items_SCROLLBAR_H)     then items_SCROLLBAR_H.alarm[0] = 1;
if instance_exists(warnings_SCROLLBAR_H)  then warnings_SCROLLBAR_H.alarm[0] = 1;


/// de-globalize
page_area_width     = global.page_area_width;
textMargin          = global.textMargin;
rowNumberX          = global.rowNumberX;
dateColumnX         = global.dateColumnX;
cColumnX            = global.cColumnX;
itemNoColumnX       = global.itemNoColumnX;
descriptionColumnX  = global.descriptionColumnX;
outlayColumnX       = global.outlayColumnX;
fColumnX            = global.fColumnX;
professionalColumnX = global.professionalColumnX;
hColumnX            = global.hColumnX;
rowHeight           = global.rowHeight;
pageStart           = global.pageStart;
totalRows           = global.totalRows;
rightColumnWindowsX1= global.rightColumnWindowsX1;
rightColumnWindowsX2= global.rightColumnWindowsX2;
seniorCounselWindowY1 = global.seniorCounselWindowY1;
seniorCounselWindowY2 = global.seniorCounselWindowY2;
juniorCounselWindowY1 = global.juniorCounselWindowY1;
juniorCounselWindowY2 = global.juniorCounselWindowY2;
witnessesWindowY1   = global.witnessesWindowY1;
witnessesWindowY2   = global.witnessesWindowY2;
itemsWindowY1       = global.itemsWindowY1;
itemsWindowY2       = global.itemsWindowY2;
warningsWindowY1    = global.warningsWindowY1;
warningsWindowY2    = global.warningsWindowY2;
rightColumnWindowHeaderHeight = global.rightColumnWindowHeaderHeight;


// reposition + resize keyboard_CURSOR
if (global.selected > -1)
{
    with (keyboard_CURSOR)
    {    
        cursor_update_borders();
    }
}

// reposition using alarms
if instance_exists(juniorCounsel) then juniorCounsel.alarm[0] = 1;
if instance_exists(seniorCounsel) then seniorCounsel.alarm[0] = 1;
