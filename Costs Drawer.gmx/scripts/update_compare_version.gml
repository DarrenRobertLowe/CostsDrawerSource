///update_compare_version(versionStr)
/* Returns bool
 *
 * argument0:   the latest version (as a string) as reported by website.
 *
 * What do:     Compares latest version to GM_version as INTs and
 *              returns true if a new version is available, or false
 *              if we're up to date.
*/

var new_version  = argument0;           // the latest version according to the website
var this_version = GM_version;          // the current version of Costs Drawer
var result       = false;               // is there a new version released?


debug_message("Comparing this version to website reported version...");


// compare the 1st number
var pos1 = string_pos(".", new_version);
var pos2 = string_pos(".", this_version);

if (pos1 == 0) // there's a problem so just quit
{
    debug_message("Problem extracting new version number! Cancelling update.")
    exit; 
}

new_version_num   = real( string_digits(string_copy(new_version,  1, pos1)) );
this_version_num  = real( string_digits(string_copy(this_version, 1, pos2)) );

                                // DEBUG
                                //show_message("new_version_num = "+string(new_version_num));
                                //show_message("this_version_num = "+string(this_version_num));


if (new_version_num > this_version_num)
then result = true;


// compare the 2nd number
if (new_version_num == this_version_num)
{
    new_version  = string_delete(new_version, 1, pos1);
    this_version = string_delete(this_version,1, pos2);
    
    var pos1 = string_pos(".", new_version);
    var pos2 = string_pos(".", this_version);
    
    if (pos1 == 0) // there's a problem so just quit
    {
        debug_message("Problem extracting new version number! Cancelling update.")
        exit; 
    }
    
    new_version_num   = real( string_digits(string_copy(new_version,  1, pos1)) );
    this_version_num  = real( string_digits(string_copy(this_version, 1, pos2)) );
    
                                // DEBUG
                                //show_message("new_version_2nd = "+string(new_version_num));
                                //show_message("this_version_2nd = "+string(this_version_num));
    
    if (new_version_num > this_version_num)
    then result = true;
    
    
    // compare the last number
    if (new_version_num == this_version_num)
    {
        new_version  = string_delete(new_version, 1, pos1);
        this_version = string_delete(this_version,1, pos2);
        
        var pos1 = string_pos(".", new_version);
        var pos2 = string_pos(".", this_version);
        
        if (pos1 == 0) then pos1 = string_length(new_version); // gets around the missing last full-stop problem
        
                                // DEBUG
                                //show_message("pos1 = "+string(pos1));
                                //show_message("pos2 = "+string(pos2));
        
        new_version_num   = real( string_digits(string_copy(new_version,  1, pos1 )) );
        this_version_num  = real( string_digits(string_copy(this_version, 1, pos2 )) );
        
                                // DEBUG
                                //show_message("new_version_3rd = "+string(new_version_num));
                                //show_message("this_version_3rd = "+string(this_version_num));
        
        if (new_version_num > this_version_num)
        then result = true;
    }
}


// FINISH UP
checkedForUpdate = true;
return result;
