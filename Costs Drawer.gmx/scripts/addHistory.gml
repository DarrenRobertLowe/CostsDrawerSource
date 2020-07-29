/*                addHistory()
 * Adds a command to the history stack and clears the redo stack.
 * Note that argument0 and argument 1 are pushed to the stack in
 *  reverse order, so that when popping them it will give the id
 *  first, then the command.
 * The actual data for the "date" or "description" etc, is stored
 *  in the instance itself under "oldDate", "oldDescription",
 *  etc.
 *
 * argument0 = instance id
 * argument1 = "description", "date", "created" "position" etc..
*/

ds_stack_push(global.UNDO,argument1);
ds_stack_push(global.UNDO,argument0);
ds_stack_clear(global.REDO)                 // clear the redo stack after a new command
