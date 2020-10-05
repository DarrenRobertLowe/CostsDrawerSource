global.sortingListCCPlaintiff = ds_list_create();

var list = global.sortingListCCPlaintiff;

ds_list_add(list,"Add Blank Item");
ds_list_add(list,"Add white space");
ds_list_add(list,"Add Instructions Fee Item");
ds_list_add(list,"V.A.T. not otherwise recoverable");
ds_list_add(list,"Attending counsel");
ds_list_add(list,"Attending counsel to settle");
ds_list_add(list,"Attending to file");
ds_list_add(list,"Affidavit of Verification");
ds_list_add(list,"Commissioners fee");
ds_list_add(list,"Stamp");
//ds_list_add(list,"Formal letter prior to the issue of proceedings");
ds_list_add(list,"Fee on Personal Injury Summons");
ds_list_add(list,"Attending counsel to settle Personal Injury Summons");
ds_list_add(list,"Stamp on Personal Injury Summons");
ds_list_add(list,"Attending to serve proceedings on the Defendant");
ds_list_add(list,"Brief for Counsel to attend for settlement negotiations");
ds_list_add(list,"Attending Law Library for negotiations");
ds_list_add(list,"Notation of Appearance");
ds_list_add(list,"Received Notice pursuant to Section 11 - Civil Liability and Courts Act 2004");
ds_list_add(list,"Fee on replies to Notice pursuant to Section 11 - Civil Liability and Courts Act 2004");
ds_list_add(list,"Received Notice for Particulars from Defendant")
ds_list_add(list,"Fee on Replies to Notice for Particulars")
ds_list_add(list,"Notification of Motion for Judgement")
ds_list_add(list,"Consent to late filing of Defence")
ds_list_add(list,"Warning letter prior to issue of Notice of Trial")
ds_list_add(list,"Stamp on Notice of Trial")
ds_list_add(list,"Fee on Notice of Trial engrossing and copies")
ds_list_add(list,"Book of Pleadings and attending to file")
ds_list_add(list,"Fee on Notice to Produce and copy to serve")
ds_list_add(list,"Fee on case for proofs");
ds_list_add(list,"Authority for release of records and having signed");
ds_list_add(list,"Instructions for Schedule of Witnesses");
ds_list_add(list,"Fee on Schedule of Witnesses");
ds_list_add(list,"Instructions for Schedule of Medical Reports");
ds_list_add(list,"Fee on Schedule of Medical Reports");
ds_list_add(list,"Fee on brief to counsel for Trial of Action");
ds_list_add(list,"Solicitors Mileage");
ds_list_add(list,"Instructions for consultation prior to hearing");
ds_list_add(list,"Fee on consultation prior to hearing");
ds_list_add(list,"Attending court for hearing...");
ds_list_add(list,"Attending for the order");
ds_list_add(list,"Stamp on Certificate of Taxation");

/*
ds_list_add(list,"Service of the Summons on the Defendant");
ds_list_add(list,"Fee on Replies to Notice for Particulars");
ds_list_add(list,"Fee on Replies to Notice for Further Information");
ds_list_add(list,"Fee arranging medical examinations of Plaintiff with Defendant");
ds_list_add(list,"Authority to the Department of Social Protection");
ds_list_add(list,"Received Defence and advising Plaintiff...");
ds_list_add(list,"Schedule of Special damages and attending to serve copy");
ds_list_add(list,"Fee on Case for Proofs");
ds_list_add(list,"Section 17 Notice...");
ds_list_add(list,"Formal Request for Voluntary Discovery");
ds_list_add(list,"Warning Letter to Defendant re Late Discovery");
ds_list_add(list,"Request for Details of Earnings from Employer");
ds_list_add(list,"Updated Schedule Of Special Damages");
ds_list_add(list,"Instructions for trial of action");
ds_list_add(list,"Notice of Trial");
ds_list_add(list,"Service of Notice of Trial");
ds_list_add(list,"Attending to File for Hearing");
ds_list_add(list,"Two Books of Pleadings (setting down)");
ds_list_add(list,"Stamp on Notice of Trial");
ds_list_add(list,"Notice for Setting Down");
ds_list_add(list,"Stamp on Setting Down");
ds_list_add(list,"Declaration of Service of Notice of Trial");
ds_list_add(list,"Notice to Produce");
ds_list_add(list,"Stamp on Notice to Produce");
ds_list_add(list,"Recevied Notice to Produce from Defendant");
ds_list_add(list,"Fee on updated Particulars of Injury");
ds_list_add(list,"Brief For Counsel To Attend for Hearing Date");
ds_list_add(list,"Attending Court when hearing date obtained...");
ds_list_add(list,"Schedule of Witnesses (2)");
ds_list_add(list,"Preparation of Brief For Trial inlcuding books of pleadings");
ds_list_add(list,"Preparation of brief for junior counsel with copies documents");
ds_list_add(list,"Brief for counsel for Trial of Action");
ds_list_add(list,"Solicitors Mileage");
ds_list_add(list,"Attending Consultation Prior to Hearing");
ds_list_add(list,"Paid Law Society for consultation Rooms");
ds_list_add(list,"Attending Court when a settlement was reached...");
ds_list_add(list,"Attending Court - Settlement not reached");
ds_list_add(list,"Attending for the Order");
ds_list_add(list,"Summons To Tax");
ds_list_add(list,"Attending Taxation");
ds_list_add(list,"Drawing Costs & Copy");
ds_list_add(list,"Postage And Sundries");
ds_list_add(list,"Injuries Board Fee");
ds_list_add(list,"Stamp on Plenary Summons");
*/
ds_list_add(list,"Paid Senior Counsel Fee...");
ds_list_add(list,"Senior Counsel Fee - Personal Injury Summons");
ds_list_add(list,"Senior Counsel Fee - Settling Replies to Notice for Particulars");
ds_list_add(list,"Senior Counsel Fee - Settling Request for Voluntary Discovery");
ds_list_add(list,"Senior Counsel Fee - Advice On Proofs");
ds_list_add(list,"Senior Counsel Fee - Attending for Hearing Date");
ds_list_add(list,"Senior Counsel Fee - Brief for Trial of Action");
ds_list_add(list,"Senior Counsel Fee - Fee on Consultation");
ds_list_add(list,"Senior Counsel Fee - Settling affidavit");

ds_list_add(list,"Paid Junior Counsel Fee...");
ds_list_add(list,"Junior Counsel Fee - Personal Injury Summons");
ds_list_add(list,"Junior Counsel Fee - Settling Replies to Notice for Particulars");
ds_list_add(list,"Junior Counsel Fee - Settling Request for Voluntary Discovery");
ds_list_add(list,"Junior Counsel Fee - Advice On Proofs");
ds_list_add(list,"Junior Counsel Fee - Attending for Hearing Date");
ds_list_add(list,"Junior Counsel Fee - Brief for Trial of Action");
ds_list_add(list,"Junior Counsel Fee - Fee on Consultation");
ds_list_add(list,"Junior Counsel Fee - Settling affidavit");


// ADD CUSTOM ITEMS
var array = global.arrayOfCicruitCourtCustomItemValues;
var size  = array_height_2d(array);

for (var i=0; i<size; i++)
{
    ds_list_add(list, array[0,0]);
    show_message("added to list : "+string(array[0,0]));
}

