if (global.MOUSE_FREE == false) then exit;
if (global.popup != 0) then exit;

if      mouse_x > global.rightColumnWindowsX1
    and mouse_x < global.rightColumnWindowsX2
    and mouse_y > global.juniorCounselWindowY1
    and mouse_y < global.juniorCounselWindowY2
        {
        return 1;
        }
