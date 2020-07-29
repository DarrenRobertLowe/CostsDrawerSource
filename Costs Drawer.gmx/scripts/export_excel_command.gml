/// export_excel_command();

if (ds_list_size(global.WARNINGS) > 0)
{
    show_message("WARNING! Please note that your bill contains critical errors that should be fixed before setting down!");
}
show_message(EXCEL_EXPORT_WARNING);
//show_message(EXCEL_EXPORT_WARNING);
export_excel("export");
