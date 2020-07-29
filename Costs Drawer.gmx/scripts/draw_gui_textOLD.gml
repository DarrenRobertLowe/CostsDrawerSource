reset_text();


// DRAW THE COLUMN TITLES
// set the x and y positions

var colNamesY = 92;       // vertical position
var dateTextX = (dateColumnX          +((itemNoColumnX - dateColumnX)        /2));
var itemTextX = (itemNoColumnX        +((cColumnX      - itemNoColumnX)      /2));
var descTextX = (descriptionColumnX   +((outlayColumnX - descriptionColumnX) /2));
var otlyTextX = (outlayColumnX        +((fColumnX      - outlayColumnX)      /2));
var profTextX = (professionalColumnX  +((hColumnX      - professionalColumnX)/2));

//draw_set_color(global.columnTitleColor);
draw_set_halign(fa_center);
draw_set_color(c_red);
draw_text(dateTextX,colNamesY,"Date");
draw_text(itemTextX,colNamesY,"No.");
draw_text(descTextX,colNamesY,"Description");
draw_text(otlyTextX,colNamesY,"Outlay");
draw_text(profTextX,colNamesY,"Professional");



// RIGHT COLUMN HEADERS
draw_set_font(font_GUI);
var itemsHeaderY    = round(itemsWindowY1     - rightColumnWindowHeaderHeight);
var warningsHeaderY = round(warningsWindowY1  - rightColumnWindowHeaderHeight);

// header text
var itemsHeaderTextY = (itemsHeaderY    + 20);
var warningsTextY    = (warningsHeaderY + 20);

draw_text(headerTextX, itemsHeaderTextY, commonItemsHeaderString);
draw_text(headerTextX, warningsTextY,    warningsHeaderString);


reset_text();
