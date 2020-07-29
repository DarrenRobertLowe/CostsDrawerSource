if argument0 == "professional"{       
    x1 = global.professionalColumnX;
    x2 = global.hColumnX;
    y1 = y;
    y2 = y+global.rowHeight;
}
draw_set_color(global.highlightColor);
draw_set_alpha(global.highlightAlpha);
draw_rectangle(x1,y1,x2,y2,false);
