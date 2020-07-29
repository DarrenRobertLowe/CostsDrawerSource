///refresh_right_column()
var windowWidth = window_get_width();

if (windowWidth > 0) // prevents column taking up entire window after minimizing
{
    var maxWidth    = (windowWidth * right_column_max_width_percent);
    var minWidth    = right_column_min_width;
    var minX        = (windowWidth - maxWidth);
    var maxX        = (windowWidth - minWidth);

    // constrain right column width
    right_column_x      = min(right_column_x, maxX);
    right_column_x      = max(right_column_x, minX);
    right_column_width  = (windowWidth - right_column_x);
}
