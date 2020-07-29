///toggle_GUI_scaling();

if (global.GUI_SCALE == 1)
{
    global.GUI_SCALE = 1.5;
    global.warnings_separation = 32;
    global.pageStart = 108;
}
else
{
    global.GUI_SCALE = 1;
    global.warnings_separation = 24;
    global.pageStart = 92;
}

warnings_SCROLLBAR.separation = global.warnings_separation;

with (MASTER)
{
    set_relative_positions();
}
reposition_menu();

//save_preferences();
