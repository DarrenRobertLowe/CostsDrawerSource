/// setup_progress_bar();

prog_x1 = mouse_x;
prog_y1 = mouse_y;
prog_y2 = (prog_y1 + 17);
progressBarWidth = 208;
progressBarSteps = ( ds_list_size(global.listOfItems) + ds_list_size(global.LAST_PAGE_ITEMS) );
stepWidth = 1;  //(progressBarWidth / progressBarSteps);
progress  = 0;
