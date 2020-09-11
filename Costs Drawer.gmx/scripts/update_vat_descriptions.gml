/// update_vat_descriptions()

with (VAT)
{
    description = "V.A.T. @ "+string(global.VATamount * 100) +"%";
    shownDescription = description;
    formatDescription(descriptionList,description,false);
    formatDescription(shownDescriptionList,shownDescription,false);
}

with (lastPage_ProVAT)
{
    description = "V.A.T  @" +string(global.VATamount * 100) +"% on professional charges";
    shownDescription = description;
    formatDescription(descriptionList,description,false);
    formatDescription(shownDescriptionList,shownDescription,false);
}
