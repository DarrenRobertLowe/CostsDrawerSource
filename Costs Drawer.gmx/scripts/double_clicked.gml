///double_clicked();
/*
 * see reset_clickTime()
 * see setup_clickTimer()
 */

if (global.TIMER <= (clickTime + doubleClickTime))
  then return true;
  else return false;
