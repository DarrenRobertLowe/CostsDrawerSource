/*** 
 *       draw_columns()
 * This script draws the columns 
 * vertical ruler lines.
 * Note: This doesn't draw the column titles,
 * that's done in the MASTER event
 *
 ***/
if (global.PRINT_VIEW == false)
  then draw_set_color(columnColor);
  else draw_set_color(c_black);


//column A
draw_line(
    dateColumnX,         //x1
    columns_startY,                     //y1
    dateColumnX,         //x2
    paperEndY                        //y2
    )

//column B
draw_line(
    itemNoColumnX,       //x1
    columns_startY,                     //y1
    itemNoColumnX,       //x2
    paperEndY                        //y2
    )

//column C
draw_line(
    cColumnX,            //x1
    columns_startY,                     //y1
    cColumnX,            //x2
    paperEndY                        //y2
    )

//column D
if (global.PRINT_VIEW == false)
{
    draw_line(
        descriptionColumnX,  //x1
        columns_startY,                     //y1
        descriptionColumnX,  //x2
        paperEndY                        //y2
        )
}

//column E
draw_line(
    outlayColumnX,       //x1
    columns_startY,                     //y1
    outlayColumnX,       //x2
    paperEndY                        //y2
    )

//column F
draw_line(
    fColumnX,            //x1
    columns_startY,                     //y1
    fColumnX,            //x2
    paperEndY                        //y2
    )

//column G
draw_line(
    professionalColumnX, //x1
    columns_startY,                     //y1
    professionalColumnX, //x2
    paperEndY                        //y2
    )

//Column H
/*
draw_line(
    global.hColumnX,            //x1
    pageStart,                  //y1
    global.hColumnX,            //x2
    columns_endY                        //y2
    )
*/
