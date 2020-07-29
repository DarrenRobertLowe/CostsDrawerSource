///update_recentFiles_list();

if exists(MASTER)
{
    with (MASTER)
    {
        ds_list_clear(recentFiles);
        
        //recentFiles = ds_list_create();
        if !(file_exists(working_directory + "\recent_files.txt"))
        {
            file = file_text_open_write(working_directory + "\recent_files.txt"); // create the file
            file_text_close(file);
        }
        
        if file_exists(working_directory + "\recent_files.txt")
          then file = file_text_open_read(working_directory + "\recent_files.txt");
          
        while !file_text_eof(file)
        {
            ds_list_add(recentFiles,file_text_read_string(file))
            file_text_readln(file);
        }
    }
}
