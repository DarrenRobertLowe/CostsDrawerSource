/// ask_switch_vat_amount()

if (global.VATamount == global.vatAmount1)
{ 
    if (show_question("Change VAT to "+string(global.vatAmount2 * 100) +"% accross the whole document?"))
    {
        switch_vat_amount();
    }
}
else
{
    if (show_question("Change VAT to "+string(global.vatAmount1 * 100) +"% accross the whole document?"))
    {
        switch_vat_amount();
    }
}
