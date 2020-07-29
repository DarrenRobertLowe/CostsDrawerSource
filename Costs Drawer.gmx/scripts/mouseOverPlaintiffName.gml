///mouseOverPlaintiffName();
// also used for defendant name

if (mouseOverAnyGUI())
{
    return false;
    exit;
}

if      mouse_x > global.descriptionColumnX
    and mouse_x < global.outlayColumnX
    and mouse_y > (borderStartY + rowHeight) // +1 for AND
    and mouse_y < (borderEndY + rowHeight)
    {
        return 1;
    }

