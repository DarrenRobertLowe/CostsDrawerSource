/// unlink_instructions_fee_check()
if (linked == true)
{
    if (show_question(UNLINK_QUESTION) == true)
    {
        linked = false; // don't get description from master item
        shownDescription = master.description;
        desciption = shownDescription;
        formatDescription(shownDescriptionList,shownDescription,false);
        formatDescription(descriptionList,description,false);
        //master = -1;
    }
}
