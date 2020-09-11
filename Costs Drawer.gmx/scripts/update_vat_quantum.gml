///update_vat_quantum();

if exists(master)
{
    outlay = (master.outlay * global.VATamount);//((master.outlay / 100) * 23);
}

with (DOC_ORGANIZER)
{
    startFrom = -1;
    alarm[0] = 1;
}
