/// spellcheck_auto_correct()
// called by draw_edit_description()
var word = argument0;

if word = "plaintiff "  then word = "Plaintiff ";
if word = "defendant "  then word = "Defendant ";
if word = "plaintiffs " then word = "Plaintiffs ";
if word = "defendants " then word = "Defendants ";

return word;
