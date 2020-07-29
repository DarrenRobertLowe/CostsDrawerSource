/// check_items_plaintiff_highcourt()
// CHECK THE LIST
/*
 * See also:
 * create_COMMON_ITEM()
 * create_sortingList_HCPlaintiff()
*/

var list = global.COMMON_ITEMS;
var str = "";

var sortList = global.sortingListHCPlaintiff;

ds_list_clear(list);
var size = ds_list_size(sortList);
for (var i=0; i<size; i++)
{
    var str = ds_list_find_value(sortList,i);
    ds_list_insert(list,i,str);
}

/// REMOVE THE FOLLOWING ITEMS FROM THE LIST IF THEY ALREADY EXIT IN THE DOCUMENT
var item = item_ServiceOfSummonsOnDefendant;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Service of the Summons on the Defendant");
    ds_list_delete(list,pos);
}

var item = item_formal_letter_prior_to_proceedings;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Formal letter prior to the issue of proceedings");
    ds_list_delete(list,pos);
}


var item = item_Personal_Injury_Summons;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Personal Injury Summons");
    ds_list_delete(list,pos);
}


/*
var item = item_personal_Injury_Summons_Instructions;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Instructions for Personal Injury Summons");
    ds_list_delete(list,pos);
}

var item = item_Personal_Injury_Summons_PreparationFee;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Fee on preparation of Personal Injury Summons");
    ds_list_delete(list,pos);
}
*/


var item = item_ServiceOfSummonsOnDefendant;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Service of the Summons on the Defendant");
    ds_list_delete(list,pos);
}

var item = item_feeOnRepliesToNoticeForParticulars;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Fee on Replies to Notice for Particulars");
    ds_list_delete(list,pos);
}

var item = item_feeOnRepliesToNoticeForFurtherInformation;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Fee on Replies to Notice for Further Information");
    ds_list_delete(list,pos);
}

var item = item_receivedDefence;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Received Defence and advising Plaintiff...");
    ds_list_delete(list,pos);
}

var item = item_scheduleOfSpecialDamages;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Schedule of Special damages and attending to serve copy");
    ds_list_delete(list,pos);
}

var item = item_FeeOnCaseForProofs;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Fee on Case for Proofs");
    ds_list_delete(list,pos);
}

var item = item_section17Notice;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Section 17 Notice...");
    ds_list_delete(list,pos);
}

var item = item_formalRequestForVoluntaryDiscovery;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Formal Request for Voluntary Discovery");
    ds_list_delete(list,pos);
}

var item = item_warningLetterToDefendant_LateDiscovery;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Warning Letter to Defendant re Late Discovery");
    ds_list_delete(list,pos);
}

var item = item_requestForDetailsOfEarningsFromEmployer;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Request for Details of Earnings from Employer");
    ds_list_delete(list,pos);
}

var item = item_instructionsForTrialOfAction;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Instructions for trial of action");
    ds_list_delete(list,pos);
}

var item = item_noticeOfTrial;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Notice of Trial");
    ds_list_delete(list,pos);
}

var item = item_serviceOfNoticeOfTrial;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Service of Notice of Trial");
    ds_list_delete(list,pos);
}

var item = item_attendingToFileForHearing;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Attending to File for Hearing");
    ds_list_delete(list,pos);
}

var item = item_twoBooksOfPleadings;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Two Books of Pleadings (setting down)");
    ds_list_delete(list,pos);
}

var item = item_StampOnNoticeOfTrial;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Stamp on Notice of Trial");
    ds_list_delete(list,pos);
}

var item = item_NoticeForSettingDown;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Notice for Setting Down");
    ds_list_delete(list,pos);
}

var item = item_StampOnSettingDown;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Stamp on Setting Down");
    ds_list_delete(list,pos);
}

var item = item_declarationOfServiceOfNoticeOfTrial;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Declaration of Service of Notice of Trial");
    ds_list_delete(list,pos);
}

var item = item_noticeToProduce;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Notice to Produce");
    ds_list_delete(list,pos);
}

var item = item_stampOnNoticeToProduce;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Stamp on Notice to Produce");
    ds_list_delete(list,pos);
}

var item = item_plaintiff_receivedNoticeToProduce;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Recevied Notice to Produce from Defendant");
    ds_list_delete(list,pos);
}

var item = item_attendingCourtObtainingHearingDate;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Attending Court when hearing date obtained...");
    ds_list_delete(list,pos);
}

var item = item_instructionsForPlaintiffsSchedule;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Schedule of Witnesses (2)");
    ds_list_delete(list,pos);
}

var item = item_preparationOfBriefForTrialIncludingBookOfPleadings;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Preparation of Brief For Trial inlcuding books of pleadings");
    ds_list_delete(list,pos);
}

var item = item_preparationOfBriefForCounselWithDocuments;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Preparation of brief for counsel with copies documents");
    ds_list_delete(list,pos);
}

var item = item_preparationOfBriefForCounsel;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Brief for counsel for Trial of Action");
    ds_list_delete(list,pos);
}

var item = item_attendingConsultationPriorToHearing;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Attending Consultation Prior to Hearing");
    ds_list_delete(list,pos);
}

var item = item_paidLawSocietyForConsultationRooms;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Paid Law Society for consultation Rooms");
    ds_list_delete(list,pos);
}

var item = item_attendingCourtSettlement;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Attending Court when a settlement was reached...");
    ds_list_delete(list,pos);
}

var item = item_attendingCourtSettlementNotReached;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Attending Court - Settlement not reached");
    ds_list_delete(list,pos);
}

var item = item_attendingForTheOrder;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Attending for the Order");
    ds_list_delete(list,pos);
}

var item = lastPage_summonsToTax;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Summons To Tax");
    ds_list_delete(list,pos);
}

var item = lastPage_attendingTaxation;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Attending Taxation");
    ds_list_delete(list,pos);
}

var item = lastPage_drawingCostsAndCopy;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Drawing Costs & Copy");
    ds_list_delete(list,pos);
}

var item = lastPage_postageAndSundries;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Postage And Sundries");
    ds_list_delete(list,pos);
}

var item = lastPage_injuriesBoardFee;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Injuries Board Fee");
    ds_list_delete(list,pos);
}

var item = item_StampOnPlenarySummons;
if (instance_exists(item))
{
    var pos = ds_list_find_index(list,"Stamp on Plenary Summons");
    ds_list_delete(list,pos);
}









/*
// USER_ITEM (always exists)
if (ds_list_find_index(list,"Add Blank Item") < 0)
{
    var pos = ds_list_find_index(sortList,"Add Blank Item");
    ds_list_insert(list,"Add Blank Item",pos);
}


// SPACER ITEM
if (ds_list_find_index(list,"Add white space") < 0)
{
    var pos = ds_list_find_index(sortList,"Add white space");
    ds_list_add(list,"Add white space");
}


// GENERAL_INSTRUCTIONS_DETAILS (always exists)
if (ds_list_find_index(list,"Add General Instructions Fee Item") < 0)
{
    var pos = ds_list_find_index(sortList,"Add General Instructions Fee Item");
    ds_list_add(list,"Add General Instructions Fee Item");
}



// Formal Letter Prior to Proceedings
if !instance_exists(item_formal_letter_prior_to_proceedings) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Formal letter prior to the issue of proceedings") < 0)
    {
        var pos = ds_list_find_index(sortList,"Formal letter prior to the issue of proceedings");
        ds_list_insert(list,2,"Formal letter prior to the issue of proceedings");
    }
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Formal letter prior to the issue of proceedings")
    if (pos > -1) then ds_list_delete(list,pos);
}




// Personal Injury Summons Fee
str = "Fee on preparation of Personal Injury Summons";
if !instance_exists(item_Personal_Injury_Summons_PreparationFee) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,str) < 0)
    {
        var pos = ds_list_find_index(list,str)
        ds_list_insert(list,2,str);
    }
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,str)
    if (pos > -1) then ds_list_insert(list,pos,str);
}



// atteding counsel therewith
str = "Attending counsel";
if (ds_list_find_index(list,str) < 0)
{
    var pos = ds_list_find_index(list,str)
    ds_list_insert(list,pos,str);
}


// Attending counsel to settle
str = "Attending counsel to settle";
if (ds_list_find_index(list,str) < 0)
{
    var pos = ds_list_find_index(list,str)
    ds_list_insert(list,pos,str);
}







// SERVICE OF SUMMONS OF THE DEFENDANT
str = "Service of the Summons on the Defendant";
if !(instance_exists(item_ServiceOfSummonsOnDefendant)) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,str) < 0) then ds_list_add(list,str);
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,str)
    if (pos > -1) then ds_list_delete(list,pos);
}



// AFFIDAVIT OF VERIFICATION
str = "Affidavit of Verification";
if (ds_list_find_index(list,str) < 0)
{
    var 
    ds_list_insert(list,str,pos);
}


// COMMISSIONER'S FEE
if (ds_list_find_index(list,"Commissioners fee") < 0) then ds_list_add(list,"Commissioners fee");



// Notification of Appearance of Defendant /// NOTE removed because there's no associated quantum.
/*
if !(instance_exists(item_feeOnRepliesToNoticeForParticulars)) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list_to_string,"Received notification of entry of Defendants Appearance") < 0) then ds_list_add(list,"Received notification of entry of Defendants Appearance");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Received notification of entry of Defendants Appearance")
    if (pos > -1) then ds_list_delete(list,pos);
}
*/



/*
// Fee on replies to Notice for Particulars
if !(instance_exists(item_feeOnRepliesToNoticeForParticulars)) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Fee on Replies to Notice for Particulars") < 0) then ds_list_add(list,"Fee on Replies to Notice for Particulars");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Fee on Replies to Notice for Particulars")
    if (pos > -1) then ds_list_delete(list,pos);
}



// Fee on replies to Notice for further information
if !(instance_exists(item_feeOnRepliesToNoticeForFurtherInformation)) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Fee on Replies to Notice for Further Information") < 0) then ds_list_add(list,"Fee on Replies to Notice for Further Information");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Fee on Replies to Notice for Further Information")
    if (pos > -1) then ds_list_delete(list,pos);
}




// Fee arranging medical examination
if (global.BILL_ON_BEHALF_OF == "Plaintiff")
{
    if (ds_list_find_index(list,"Fee arranging medical examinations of Plaintiff with Defendant") < 0) then ds_list_add(list,"Fee arranging medical examinations of Plaintiff with Defendant");
}





// Authority to the Department of Social Protection and having signed
if (ds_list_find_index(list,"Authority to the Department of Social Protection") < 0) then ds_list_add(list,"Authority to the Department of Social Protection");



// Received Defence...
if !(instance_exists(item_receivedDefence)) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Received Defence and advising Plaintiff...") < 0) then ds_list_add(list,"Received Defence and advising Plaintiff...");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Received Defence and advising Plaintiff...")
    if (pos > -1) then ds_list_delete(list,pos);
}





// schedule of special damages and serving thereof
if !(instance_exists(item_scheduleOfSpecialDamages)) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Schedule of Special damages and attending to serve copy") < 0) then ds_list_add(list,"Schedule of Special damages and attending to serve copy");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Schedule of Special damages and attending to serve copy")
    if (pos > -1) then ds_list_delete(list,pos);
}


// fee on case for proofs
if !(instance_exists(item_FeeOnCaseForProofs)) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Fee on Case for Proofs") < 0) then ds_list_add(list,"Fee on Case for Proofs");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Fee on Case for Proofs")
    if (pos > -1) then ds_list_delete(list,pos);
}





// Section 17 Notice...
if !(instance_exists(item_section17Notice)) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Section 17 Notice...") < 0) then ds_list_add(list,"Section 17 Notice...");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Section 17 Notice...")
    if (pos > -1) then ds_list_delete(list,pos);
}



// Formal Request for Voluntary Discovery
if !(instance_exists(item_formalRequestForVoluntaryDiscovery)) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,) < 0) then ds_list_add(list,"Formal Request for Voluntary Discovery");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Formal Request for Voluntary Discovery")
    if (pos > -1) then ds_list_delete(list,pos);
}



// Warning Letter to Defendant re Late Disovery
if !(instance_exists(item_warningLetterToDefendant_LateDiscovery)) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Warning Letter to Defendant re Late Discovery") < 0) then ds_list_add(list,"Warning Letter to Defendant re Late Discovery");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Warning Letter to Defendant re Late Discovery")
    if (pos > -1) then ds_list_delete(list,pos);
}



// Request for details of earnings
if !(instance_exists(item_requestForDetailsOfEarningsFromEmployer)) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Request for Details of Earnings from Employer") < 0) then ds_list_add(list,"Request for Details of Earnings from Employer");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Request for Details of Earnings from Employer")
    if (pos > -1) then ds_list_delete(list,pos);
}






// Updated Schedule Of Special Damages
if (ds_list_find_index(list,"Updated Schedule Of Special Damages") < 0) then ds_list_add(list,"Updated Schedule Of Special Damages");





/// Instructions for trial of action
if !instance_exists(item_instructionsForTrialOfAction) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Instructions for trial of action") < 0) then ds_list_add(list,"Instructions for trial of action");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Instructions for trial of action")
    if (pos > -1) then ds_list_delete(list,pos);
}



// Notice of Trial
if !instance_exists(item_noticeOfTrial) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Notice of Trial") < 0) then ds_list_add(list,"Notice of Trial");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Notice of Trial")
    if (pos > -1) then ds_list_delete(list,pos);
}


// Service of Notice of Trial
if !instance_exists(item_serviceOfNoticeOfTrial) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Service of Notice of Trial") < 0) then ds_list_add(list,"Service of Notice of Trial");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Service of Notice of Trial")
    if (pos > -1) then ds_list_delete(list,pos);
}



// Attending to File for Hearing
if !instance_exists(item_attendingToFileForHearing) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Attending to File for Hearing") < 0) then ds_list_add(list,"Attending to File for Hearing");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Attending to File for Hearing")
    if (pos > -1) then ds_list_delete(list,pos);
}


// Two Books of Pleadings
if !instance_exists(item_twoBooksOfPleadings) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Two Books of Pleadings (setting down)") < 0) then ds_list_add(list,"Two Books of Pleadings (setting down)");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Two Books of Pleadings (setting down)")
    if (pos > -1) then ds_list_delete(list,pos);
}



// Stamp on Notice of Trial
if !instance_exists(item_StampOnNoticeOfTrial) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Stamp on Notice of Trial") < 0) then ds_list_add(list,"Stamp on Notice of Trial");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Stamp on Notice of Trial")
    if (pos > -1) then ds_list_delete(list,pos);
}


// Notice for Setting Down
if !instance_exists(item_NoticeForSettingDown) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Notice for Setting Down") < 0) then ds_list_add(list,"Notice for Setting Down");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Notice for Setting Down")
    if (pos > -1) then ds_list_delete(list,pos);
}


// Stamp on Setting Down
if !instance_exists(item_StampOnSettingDown) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Stamp on Setting Down") < 0) then ds_list_add(list,"Stamp on Setting Down");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Stamp on Setting Down")
    if (pos > -1) then ds_list_delete(list,pos);
}


// Declaration of Service of Notice of Trial
if !instance_exists(item_declarationOfServiceOfNoticeOfTrial) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Declaration of Service of Notice of Trial") < 0) then ds_list_add(list,"Declaration of Service of Notice of Trial");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Declaration of Service of Notice of Trial")
    if (pos > -1) then ds_list_delete(list,pos);
}




// Notice to Produce
if !instance_exists(item_noticeToProduce) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Notice to Produce") < 0) then ds_list_add(list,"Notice to Produce");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Notice to Produce")
    if (pos > -1) then ds_list_delete(list,pos);
}

// Stamp on Notice to Produce
if !instance_exists(item_stampOnNoticeToProduce) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Stamp on Notice to Produce") < 0) then ds_list_add(list,"Stamp on Notice to Produce");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Stamp on Notice to Produce")
    if (pos > -1) then ds_list_delete(list,pos);
}


// Recevied Notice to Produce from Defendant
if (global.BILL_ON_BEHALF_OF == "Plaintiff")
{
    if !instance_exists(item_plaintiff_receivedNoticeToProduce) // item doesn't exist so add it to the list
    {   
        if (ds_list_find_index(list,"Recevied Notice to Produce from Defendant") < 0) then ds_list_add(list,"Recevied Notice to Produce from Defendant");
    }
    else // item exists so remove it from the list
    {
        var pos = ds_list_find_index(list,"Recevied Notice to Produce from Defendant")
        if (pos > -1) then ds_list_delete(list,pos);
    }
}
/*if (global.BILL_ON_BEHALF_OF == "Defendant")
{
    if !instance_exists(item_defendant_receivedNoticeToProduce) // item doesn't exist so add it to the list
    {   
        if (ds_list_find_index(list,"Recevied Notice to Produce from Plaintiff") < 0) then ds_list_add(list,"Recevied Notice to Produce from Defendant");
    }
    else // item exists so remove it from the list
    {
        var pos = ds_list_find_index(list,"Recevied Notice to Produce from Plaintiff")
        if (pos > -1) then ds_list_delete(list,pos);
    }
}*/







/*

// Fee on updated Particulars of Injury
if (ds_list_find_index(list,"Fee on updated Particulars of Injury") < 0) then ds_list_add(list,"Fee on updated Particulars of Injury");


// Brief For Counsel To Attend for Hearing Date
if !instance_exists(item_briefForCounselToAttendForHearingDate) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Brief For Counsel To Attend for Hearing Date") < 0) then ds_list_add(list,"Brief For Counsel To Attend for Hearing Date");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Brief For Counsel To Attend for Hearing Date")
    if (pos > -1) then ds_list_delete(list,pos);
}

// Attending Court when hearing date obtained...
if !instance_exists(item_attendingCourtObtainingHearingDate) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Attending Court when hearing date obtained...") < 0) then ds_list_add(list,"Attending Court when hearing date obtained...");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Attending Court when hearing date obtained...")
    if (pos > -1) then ds_list_delete(list,pos);
}


// Attending Court when hearing date obtained...
if !instance_exists(item_instructionsForPlaintiffsSchedule) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Schedule of Witnesses (2)") < 0) then ds_list_add(list,"Schedule of Witnesses (2)");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Schedule of Witnesses (2)")
    if (pos > -1) then ds_list_delete(list,pos);
}






// Preparation of Brief For Trial inlcuding books of pleadings
if !instance_exists(item_preparationOfBriefForTrialIncludingBookOfPleadings) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Preparation of Brief For Trial inlcuding books of pleadings") < 0)     then ds_list_add(list,"Preparation of Brief For Trial inlcuding books of pleadings");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Preparation of Brief For Trial inlcuding books of pleadings")
    if (pos > -1) then ds_list_delete(list,pos);
}



if !instance_exists(item_preparationOfBriefForJuniorCounselWithDocuments) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Preparation of brief for junior counsel with copies documents") < 0)   then ds_list_add(list,"Preparation of brief for junior counsel with copies documents");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Preparation of brief for junior counsel with copies documents")
    if (pos > -1) then ds_list_delete(list,pos);
}


if !instance_exists(item_preparationOfBriefForCounsel) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Brief for counsel for Trial of Action") < 0)   then ds_list_add(list,"Brief for counsel for Trial of Action");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Brief for counsel for Trial of Action")
    if (pos > -1) then ds_list_delete(list,pos);
}



// Solicitors Mileage
if (ds_list_find_index(list,"Solicitors Mileage") < 0) then ds_list_add(list,"Solicitors Mileage");






// Attending Consultation Prior to Hearing
if !instance_exists(item_attendingConsultationPriorToHearing) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Attending Consultation Prior to Hearing") < 0) then ds_list_add(list,"Attending Consultation Prior to Hearing");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Attending Consultation Prior to Hearing")
    if (pos > -1) then ds_list_delete(list,pos);
}



// Attending Consultation Prior to Hearing
if !instance_exists(item_paidLawSocietyForConsultationRooms) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Paid Law Society for consultation Rooms") < 0) then ds_list_add(list,"Paid Law Society for consultation Rooms");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Paid Law Society for consultation Rooms")
    if (pos > -1) then ds_list_delete(list,pos);
}



// Attending Court Settlement
if !instance_exists(item_attendingCourtSettlement) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Attending Court when a settlement was reached...") < 0) then ds_list_add(list,"Attending Court when a settlement was reached...");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Attending Court when a settlement was reached...")
    if (pos > -1) then ds_list_delete(list,pos);
}


// Attending Court Settlement Not Reached
if !instance_exists(item_attendingCourtSettlementNotReached) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Attending Court - Settlement not reached") < 0) then ds_list_add(list,"Attending Court - Settlement not reached");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Attending Court - Settlement not reached")
    if (pos > -1) then ds_list_delete(list,pos);
}



// Attending for the Order
if !instance_exists(item_attendingForTheOrder) // item doesn't exist so add it to the list
{   
    if (ds_list_find_index(list,"Attending for the Order") < 0) then ds_list_add(list,"Attending for the Order");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Attending for the Order")
    if (pos > -1) then ds_list_delete(list,pos);
}









// SUMMONS TO TAX
if !instance_exists(lastPage_summonsToTax) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Summons To Tax") < 0) then ds_list_insert(list,2,"Summons To Tax");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Summons To Tax")
    if (pos > -1) then ds_list_delete(list,pos);
}


// ATTENDING TAXATION
if !instance_exists(lastPage_attendingTaxation) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Attending Taxation") < 0)  then ds_list_insert(list,2,"Attending Taxation");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Attending Taxation")
    if (pos > -1) then ds_list_delete(list,pos);
}


// DRAWING COSTS AND COPY
if !instance_exists(lastPage_drawingCostsAndCopy) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Drawing Costs & Copy") < 0)  then ds_list_insert(list,2,"Drawing Costs & Copy");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Drawing Costs & Copy")
    if (pos > -1) then ds_list_delete(list,pos);
}


// POSTAGE AND SUNDRIES
if !instance_exists(lastPage_postageAndSundries) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Postage And Sundries") < 0) then ds_list_add(list,"Postage And Sundries");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Postage And Sundries")
    if (pos > -1) then ds_list_delete(list,pos);
}


// INJURIES BOARD FEE
if !instance_exists(lastPage_injuriesBoardFee) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Injuries Board Fee") < 0)  then ds_list_insert(list,2,"Injuries Board Fee");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Injuries Board Fee")
    if (pos > -1) then ds_list_delete(list,pos);
}


// STAMP ON PLENARY SUMMONS
if !instance_exists(item_StampOnPlenarySummons) // item doesn't exist so add it to the list
{
    if (ds_list_find_index(list,"Stamp on Plenary Summons") < 0) then ds_list_add(list,"Stamp on Plenary Summons");
}
else // item exists so remove it from the list
{
    var pos = ds_list_find_index(list,"Stamp on Plenary Summons")
    if (pos > -1) then ds_list_delete(list,pos);
}




// COUNSEL FEEs (always exists)
if (ds_list_find_index(list,"Paid Senior Counsel Fee...") < 0) then ds_list_add(list,"Paid Senior Counsel Fee...");
if (ds_list_find_index(list,"Senior Counsel Fee - Personal Injury Summons") < 0)     then ds_list_add(list,"Senior Counsel Fee - Personal Injury Summons");
if (ds_list_find_index(list,"Senior Counsel Fee - Settling Replies to Notice for Particulars") < 0)  then ds_list_add(list,"Senior Counsel Fee - Settling Replies to Notice for Particulars");
if (ds_list_find_index(list,"Senior Counsel Fee - Settling Request for Voluntary Discovery") <0) then ds_list_add(list,"Senior Counsel Fee - Settling Request for Voluntary Discovery");
if (ds_list_find_index(list,"Senior Counsel Fee - Advice On Proofs") < 0)            then ds_list_add(list,"Senior Counsel Fee - Advice On Proofs");
if (ds_list_find_index(list,"Senior Counsel Fee - Attending for Hearing Date") < 0)  then ds_list_add(list,"Senior Counsel Fee - Attending for Hearing Date");
if (ds_list_find_index(list,"Senior Counsel Fee - Brief for Trial of Action") < 0)   then ds_list_add(list,"Senior Counsel Fee - Brief for Trial of Action");
if (ds_list_find_index(list,"Senior Counsel Fee - Fee on Consultation") < 0)         then ds_list_add(list,"Senior Counsel Fee - Fee on Consultation");


if (ds_list_find_index(list,"Paid Junior Counsel Fee...") < 0) then ds_list_add(list,"Paid Junior Counsel Fee...");
if (ds_list_find_index(list,"Junior Counsel Fee - Personal Injury Summons") < 0)     then ds_list_add(list,"Junior Counsel Fee - Personal Injury Summons");
if (ds_list_find_index(list,"Junior Counsel Fee - Settling Replies to Notice for Particulars") < 0) then ds_list_add(list,"Junior Counsel Fee - Settling Replies to Notice for Particulars");
if (ds_list_find_index(list,"Junior Counsel Fee - Settling Request for Voluntary Discovery") <0) then ds_list_add(list,"Junior Counsel Fee - Settling Request for Voluntary Discovery");
if (ds_list_find_index(list,"Junior Counsel Fee - Advice On Proofs") < 0)            then ds_list_add(list,"Junior Counsel Fee - Advice On Proofs");
if (ds_list_find_index(list,"Junior Counsel Fee - Attending for Hearing Date") < 0)  then ds_list_add(list,"Junior Counsel Fee - Attending for Hearing Date");
if (ds_list_find_index(list,"Junior Counsel Fee - Brief for Trial of Action") < 0)   then ds_list_add(list,"Junior Counsel Fee - Brief for Trial of Action");
if (ds_list_find_index(list,"Junior Counsel Fee - Fee on Consultation") < 0)         then ds_list_add(list,"Junior Counsel Fee - Fee on Consultation");





// MACRO ITEMS
/*
if (ds_list_find_index(list,"MULTI - Personal Injury Summons (12)") < 0) then ds_list_add(list,"MULTI - Personal Injury Summons (12)");
if (ds_list_find_index(list,"MULTI - Replies To Notice For Particulars (10)") < 0) then ds_list_add(list,"MULTI - Replies To Notice For Particulars (10)");
if (ds_list_find_index(list,"MULTI - Advice on Proofs (6)") < 0) then ds_list_add(list,"MULTI - Advice on Proofs (6)");
if (ds_list_find_index(list,"MULTI - Consultation with Senior Counsel (4)") < 0) then ds_list_add(list,"MULTI - Consultation with Senior Counsel (4)");
if (ds_list_find_index(list,"MULTI - Setting Down For Hearing (10)") < 0) then ds_list_add(list,"MULTI - Setting Down For Hearing (10)");
if (ds_list_find_index(list,"MULTI - Obtaining Hearing Date (9)") < 0) then ds_list_add(list,"MULTI - Obtaining Hearing Date (9)");
if (ds_list_find_index(list,"MULTI - Plaintiff's Schedule Pusuant to SI 391 1998 (2)") < 0) then ds_list_add(list,"MULTI - Plaintiff's Schedule Pusuant to SI 391 1998 (2)");
*/
