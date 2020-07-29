/* first we find what percentage the scrollbar is down
 * the scoll area. */
var scrollableDistance = (scrollAreaHeight - height);    // example: scrollable distance is 450 if the bar itself is 100 pixels and the area is 550.
var viewArea = (view_hview[0] - global.pageStart);              // otherwise we can't scroll to the last few lines.
viewArea -= global.rowHeight;                                   // otherwise we can't see the last row as it's buried below the GUI.
//viewArea -= (global.rowHeight) * (global.gapAfterLastRow);      // for leaving a gap after the last row if desired

var ratio = 
    ((documentHeight-viewArea) / scrollableDistance)     // e.g. 1 pixel moved = 12 pixels of document scrolled
    
var barYpixels  = (y - scrollAreaStartY);                // e.g. scrollbar is 50 pixels down from scrollAreaStartY

/* now we need to make the view y position equal
 * the same percentage as the bar. */
view_yview[0] = barYpixels*ratio;
