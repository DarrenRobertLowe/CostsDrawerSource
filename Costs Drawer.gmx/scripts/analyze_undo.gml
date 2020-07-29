/// analyze_undo(string)

var event = argument0;
var str   = event;

// find the task
var pos  = string_pos(";",str);
var task = string_copy(str,0,pos-1);
str      = string_copy(str,pos+1,string_length(str));


if (task == "Create Item")  // UNDO create item
{
    // find the object index
    pos      = string_pos(";",str);
    var ind  = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    //show_message("object_index = " +string(ind));
    
    // find the row
    pos      = string_pos(";",str);
    var row  = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    //show_message("row = " +string(row));
    
    // get myID
    pos      = string_pos(";",str);
    var myID = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    //show_message("myID = " +string(myID));

    var item = find_ID(myID);
    
    // prevents crash!
    if (item.object_index == MASTER)
    {
        exit;
    }
    
    history_create_item(global.REDO,item)

    instance_destroy(item,true);    // DO NOT USE delete_item() FOR THIS! It would add the item to the global.UNDO list.
}




if (task == "Delete Item")  // UNDO delete item
{
    // RECREATE ITEM
    // find the object index
    pos      = string_pos(";",str);
    var ind  = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    //show_message("object_index = " +string(ind));
    
    // find the row
    pos      = string_pos(";",str);
    var row  = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    var item = create_item(ind,row);    // CREATE THE ITEM
    //show_message("row = " +string(row));
    
    // get myID
    pos      = string_pos(";",str);
    var myID = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    item.myID = myID;
    //show_message("myID = " +string(myID));
    
    
    // prevents crash!
    if (item.object_index == MASTER)
    {
        exit;
    }
    
    // find the list
    pos      = string_pos(";",str);
    var list = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    
    // find the list position
    pos      = string_pos(";",str);
    var listPos = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    
    
    /// delete our item.id from the given list
    var currentPos = ds_list_find_index(list,item)
    if (currentPos > -1)
    {
        ds_list_delete(list,currentPos);
    }
    /// and insert it into its original position
    ds_list_insert(list,listPos,item);

    
    // find the description
    pos      = string_pos(";",str);
    var desc = string_copy(str,0,pos-1);
    str      = string_copy(str,pos+1,string_length(str));
    item.description = desc;
    //show_message("item = " +string(item));
    with (item)
    {
        confirmDescription(description);
    }
    
    
    
    // get seeFeeLater
    pos      = string_pos(";",str);
    var seeFeeLater = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    item.seeFeeLater = seeFeeLater;
    
    
    // get countMyItemNumber
    pos      = string_pos(";",str);
    var countMyItemNumber = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    item.countMyItemNumber = countMyItemNumber;
    
    // get outlayText
    pos      = string_pos(";",str);
    var outlayText = string_copy(str,0,pos-1);
    str      = string_copy(str,pos+1,string_length(str));
    item.outlayText = outlayText
    item.outlay     = real(outlayText);
    
    
    // get professionalText
    pos      = string_pos(";",str);
    var professionalText = string_copy(str,0,pos-1);
    str      = string_copy(str,pos+1,string_length(str));
    item.professionalText = professionalText;
    item.professional     = real(professionalText);
    
    
    // get dateYear
    pos      = string_pos(";",str);
    var dateYear = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    item.dateYear = dateYear;
    
    
    // get dateMonth
    pos      = string_pos(";",str);
    var dateMonth = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    item.dateMonth = dateMonth;
    
    
    // get dateDay
    pos      = string_pos(";",str);
    var dateDay = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    item.dateDay = dateDay;
    
    

    // get master
    pos      = string_pos(";",str);
    var master = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    item.master = master;
    
    
    // get myFee
    pos      = string_pos(";",str);
    var myFee = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    item.myFee = myFee;
    
    // get myVAT
    pos      = string_pos(";",str);
    var myVAT = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    item.myVAT = myVAT;
    
    // get myStamp
    pos      = string_pos(";",str);
    var myStamp = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    item.myStamp = myStamp;
    
    /// Add to REDO stack
    history_delete_item(global.REDO,item);
}




if (task == "Edit Description")  // UNDO description change
{
    // find the object index
    pos      = string_pos(";",str);
    var myID = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    
    var item = find_ID(myID);
    
    
    // push it onto global.REDO
    if (item.object_index != MASTER)
    {
        ds_stack_push(global.REDO,
        "Edit Description;"
        + string(item.myID)
        + ";"
        + string(item.description)
        + ";"
        );
    }
    
    // find the description to change to
    pos      = string_pos(";",str);
    var desc = string_copy(str,0,pos-1);
    str      = string_copy(str,pos+1,string_length(str));
    
    item.description = desc;
    with (item)
    {
        confirmDescription(description);
    }
}




if (task == "Edit Outlay")  // UNDO outlay change
{
    // find the object index
    pos      = string_pos(";",str);
    var myID = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    
    var item = find_ID(myID);
    
    
    // push it onto global.REDO
    ds_stack_push(global.REDO,
    "Edit Outlay;"
    + string(item.myID)
    + ";"
    + string(item.outlayText)
    + ";"
    );

    
    // find the description to change to
    pos      = string_pos(";",str);
    var iOutlay = string_copy(str,0,pos-1);
    str      = string_copy(str,pos+1,string_length(str));
    
    item.outlayText = iOutlay;
    item.outlay     = real(iOutlay);
}





if (task == "Edit Professional")  // UNDO professional change
{
    // find the object index
    pos      = string_pos(";",str);
    var myID = real(string_copy(str,0,pos-1));
    str      = string_copy(str,pos+1,string_length(str));
    
    var item = find_ID(myID);
    
    
    // push it onto global.REDO
    ds_stack_push(global.REDO,
    "Edit Professional;"
    + string(item.myID)
    + ";"
    + string(item.professionalText)
    + ";"
    );

    
    // find the description to change to
    pos      = string_pos(";",str);
    var iProfessional = string_copy(str,0,pos-1);
    str      = string_copy(str,pos+1,string_length(str));
    
    item.professionalText = iProfessional;
    item.Professional     = real(iProfessional);
}

