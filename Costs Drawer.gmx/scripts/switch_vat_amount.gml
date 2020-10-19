///switch_vat_amount();

if (global.VATamount == global.vatAmount1)
  then global.VATamount = global.vatAmount2;
  else global.VATamount = global.vatAmount1;

//update_totals(); // totals
update_vat_descriptions();
update_entire_document();


if exists(VAT_CHANGER)
{
    with (VAT_CHANGER)
    {
        event_user(0);
    }
}
