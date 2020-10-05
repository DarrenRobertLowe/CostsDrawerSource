/// create_COMMON_ITEM(item string)
/* also see 
 * COMMON_ITEMS_CHECKER
 * create_sortingList_HCPlaintiff()
 * create_sortingList_CCPlaintiff()
 *
 * NOTE!! If an item doesn't get created and it makes
 * no sense, remember the "item" var here is case 
 * sensitive! It's easy to miss a letter!
*/
var item = argument0;
var pos = getCurrentListPosition();
var newItem = -1;



if (item == "Add Blank Item")
{
    // CREATE AT SELECTED POSITION
    if  ( global.selected > -1 )
    and instance_exists(global.selected )
    {
        if ( global.selected.object_index == USER_ITEM )
        or ( global.selected.object_index == item_caseDetails )
        {
            var pos = ds_list_find_index(global.listOfItems, global.selected)
            insert_item(USER_ITEM, pos+1);
        }
    }
    
    // ELSE CREATE AT END OF LIST (before BUTTON_CreateNewItem)
    if (global.selected == -1)
     or  ( (global.selected.object_index != USER_ITEM)
     and (global.selected.object_index != item_caseDetails) )
    {
        var pos = ds_list_find_index(global.listOfItems, BUTTON_CreateNewItem.id)
        if (pos > -1) then insert_item(USER_ITEM, pos);
    }
}


if (item == "Add white space")
{
    if (global.selected > -1)
    {
        var list = find_list(global.selected);
        
        if (list == global.listOfItems)
        {
            pos = getCurrentListPosition();
            newItem = insert_item(item_WHITESPACE,pos+1);
        }
        /* // for inserting as a last page item (doesn't load properly due to the way lastPage items work)
        if (list == global.LAST_PAGE_ITEMS)
        {
            pos = ds_list_find_index(global.LAST_PAGE_ITEMS,global.selected)
            newItem = insert_lastPage_item(item_WHITESPACE,pos+1);
        }*/
    }
}


if (item == "Add Instructions Fee Item")
{
    newItem = insert_INSTRUCTIONS_DETAILS();
}


if (item == "Notation of Appearance")
{
    newItem = insert_item(item_plaintiff_notationOfAppearance,pos+1)
}


// Solicitors Mileage
if (item == "Solicitors Mileage")
{
    newItem = insert_item(item_solicitorsMileage,pos+1)
}




if (global.BILL_COURT == "Highcourt")
{
    if (item == "Formal letter prior to the issue of proceedings")
    {
        if !(instance_exists(item_formal_letter_prior_to_proceedings))
        {   
            newItem = insert_item(item_formal_letter_prior_to_proceedings,pos+1)
        }
    }
    
    
    if (item == "Personal Injury Summons")
    {
        if !(instance_exists(item_Personal_Injury_Summons))
        {   
            newItem = insert_item(item_Personal_Injury_Summons,pos+1)
        }
    }
    
    
    
    if (item == "Instructions for Personal Injury Summons")
    {
        if !(instance_exists(item_personal_Injury_Summons_Instructions))
        {   
            newItem = insert_item(item_personal_Injury_Summons_Instructions,pos+1)
        }
    }
    
    
    if (item == "Fee on preparation of Personal Injury Summons")
    {
        if !(instance_exists(item_Personal_Injury_Summons_PreparationFee))
        {   
            newItem = insert_item(item_Personal_Injury_Summons_PreparationFee,pos+1)
        }
    }
    
    
    
    
    if (item == "Attending counsel to settle")
    {
        newItem = insert_item(item_attendingCounselToSettle,pos+1)
    }
    
    
    
    if (item == "Received notification of entry of Defendants Appearance")
    {
        if !(instance_exists(item_scheduleOfSpecialDamages))
        {
            newItem = insert_item(item_receivedNotificationOfEntryOfDefendantsAppearance,pos+1)
        }
    }
    
    
    
    if (item == "Schedule of Special damages and attending to serve copy")
    {
        if !(instance_exists(item_scheduleOfSpecialDamages))
        {   
            newItem = insert_item(item_scheduleOfSpecialDamages,pos+1)
        }
    }
    
    
    
    if (item == "Fee on Case for Proofs")
    {
        if !(instance_exists(item_FeeOnCaseForProofs))
        {   
            newItem = insert_item(item_FeeOnCaseForProofs,pos+1)
        }
    }
    
    
    
    
    
    if (item == "Section 17 Notice...")
    {
        if !(instance_exists(item_section17Notice))
        {   
            newItem = insert_item(item_section17Notice,pos+1)
        }
    }
    
    if (item == "Formal Request for Voluntary Discovery")
    {
        if !(instance_exists(item_formalRequestForVoluntaryDiscovery))
        {   
            newItem = insert_item(item_formalRequestForVoluntaryDiscovery,pos+1)
        }
    }
    
    if (item == "Warning Letter to Defendant re Late Discovery")
    {
        if !(instance_exists(item_warningLetterToDefendant_LateDiscovery))
        {   
            newItem = insert_item(item_warningLetterToDefendant_LateDiscovery,pos+1)
        }
    }
    
    if (item == "Request for Details of Earnings from Employer")
    {
        if !(instance_exists(item_requestForDetailsOfEarningsFromEmployer))
        {   
            newItem = insert_item(item_requestForDetailsOfEarningsFromEmployer,pos+1)
        }
    }
    
    
    
    
    
    
    
    
    if (item == "Instructions for trial of action")
    {
        if !(instance_exists(item_instructionsForTrialOfAction))
        {   
            newItem = insert_item(item_instructionsForTrialOfAction,pos+1)
        }
    }
    
    
    if (item == "Notice of Trial")
    {
        if !(instance_exists(item_noticeOfTrial))
        {   
            newItem = insert_item(item_noticeOfTrial,pos+1)
        }
    }
    
    
    if (item == "Service of Notice of Trial")
    {
        if !(instance_exists(item_serviceOfNoticeOfTrial))
        {   
            newItem = insert_item(item_serviceOfNoticeOfTrial,pos+1)
        }
    }
    
    
    
    if (item == "Notice to Produce")
    {
        if !(instance_exists(item_noticeToProduce))
        {   
            newItem = insert_item(item_noticeToProduce,pos+1)
        }
    }
    
    if (item == "Stamp on Notice to Produce")
    {
        if !(instance_exists(item_stampOnNoticeToProduce))
        {   
            newItem = insert_item(item_stampOnNoticeToProduce,pos+1)
        }
    }
    
    
    
    if (item == "Received Notice to Produce from Defendant")
    {
        if !(instance_exists(item_plaintiff_receivedNoticeToProduce))
        {   
            newItem = insert_item(item_plaintiff_receivedNoticeToProduce,pos+1)
        }
    }
    /*if (item == "Received Notice to Produce from Plaintiff")
    {
        if !(instance_exists(item_defendant_receivedNoticeToProduce))
        {   
            newItem = insert_item(item_defendant_receivedNoticeToProduce,pos+1)
        }
    }*/
    
    
    //"Preparation of brief for counsel for Trial of Action"
    if (item == "Brief for counsel for Trial of Action")
    {
        if !(instance_exists(item_preparationOfBriefForTrialOfAction))
        {   
            newItem = insert_item(item_preparationOfBriefForTrialOfAction,pos+1)
        }
    }
    
    
    
    
    
    if (item == "Attending to File for Hearing")
    {
        if !(instance_exists(item_attendingToFileForHearing))
        {   
            newItem = insert_item(item_attendingToFileForHearing,pos+1)
        }
    }
    
    
    if (item == "Two Books of Pleadings (setting down)")
    {
        if !(instance_exists(item_twoBooksOfPleadings))
        {   
            newItem = insert_item(item_twoBooksOfPleadings,pos+1)
        }
    }
    
    if (item == "Stamp on Notice of Trial")
    {
        if !(instance_exists(item_StampOnNoticeOfTrial))
        {   
            newItem = insert_item(item_StampOnNoticeOfTrial,pos+1)
        }
    }
    
    if (item == "Notice for Setting Down")
    {
        if !(instance_exists(item_NoticeForSettingDown))
        {   
            newItem = insert_item(item_NoticeForSettingDown,pos+1)
        }
    }
    
    if (item == "Stamp on Setting Down")
    {
        if !(instance_exists(item_StampOnSettingDown))
        {   
            newItem = insert_item(item_StampOnSettingDown,pos+1)
        }
    }
    
    if (item == "Declaration of Service of Notice of Trial")
    {
        if !(instance_exists(item_declarationOfServiceOfNoticeOfTrial))
        {   
            newItem = insert_item(item_declarationOfServiceOfNoticeOfTrial,pos+1)
        }
    }
    
    
    
    if (item == "Fee on updated Particulars of Injury")
    {
        if !(instance_exists(item_feeOnUpdatedParticularsOfPersonalInjury))
        {   
            newItem = insert_item(item_feeOnUpdatedParticularsOfPersonalInjury,pos+1)
        }
    }
    
    if (item == "Brief For Counsel To Attend for Hearing Date")
    {
        if !(instance_exists(item_briefForCounselToAttendForHearingDate))
        {   
            newItem = insert_item(item_briefForCounselToAttendForHearingDate,pos+1)
        }
    }
    
    if (item == "Attending Court when hearing date obtained...")
    {
        if !(instance_exists(item_attendingCourtObtainingHearingDate))
        {   
            newItem = insert_item(item_attendingCourtObtainingHearingDate,pos+1)
        }
    }
    
    
    if (item == "Updated Schedule Of Special Damages")
    {
        newItem = insert_item(item_scheduleOfSpecialDamagesUpdated,pos+1)
    }
    
    if (item == "Schedule of Witnesses (2)")
    {
        newItem = insert_item(item_instructionsForPlaintiffsSchedule,pos+1)
    }
    
    
    
    
    
    
    
    
    
    
    if (item == "Summons To Tax")
    {
        if !(instance_exists(lastPage_summonsToTax))
        {
            newItem = instance_create(0,0,lastPage_summonsToTax);
        }
    }
    
    if (item == "Injuries Board Fee")
    {
        if !(instance_exists(lastPage_injuriesBoardFee))
        {
            newItem = instance_create(0,0,lastPage_injuriesBoardFee);
        }
    }
    
    if (item == "Attending Taxation")
    {
        if !(instance_exists(lastPage_attendingTaxation))
        {
            newItem = instance_create(0,0,lastPage_attendingTaxation);
        }
    }
    
    if (item == "Drawing Costs & Copy")
    {
        if !(instance_exists(lastPage_drawingCostsAndCopy))
        {
            newItem = instance_create(0,0,lastPage_drawingCostsAndCopy);
        }
    }
    
    if (item == "Postage And Sundries")
    {
        if !(instance_exists(lastPage_postageAndSundries))
        {
            newItem = instance_create(0,0,lastPage_postageAndSundries);
        }
    }
    
    
    
    
    /// STAMP ON PLENARY SUMMONS
    if (item == "Stamp on Plenary Summons") 
    {
        if !(instance_exists(item_StampOnPlenarySummons))
        {
            newItem = insert_item(item_StampOnPlenarySummons,pos+1)
        }
    }
    
    /// SERVICE OF SUMMONS OF THE DEFENDANT
    if (item == "Service of the Summons on the Defendant") 
    {
        if !(instance_exists(item_ServiceOfSummonsOnDefendant))
        {
            newItem = insert_item(item_ServiceOfSummonsOnDefendant,pos+1)
        }
    }
    
    
    
    /// AFFIDAVIT OF VERIFICATION
    if (item == "Affidavit of Verification") 
    {
        newItem = insert_item(item_AffidavitOfVerification,pos+1)
    }
    
    
    /// COMMISSIONERS FEE
    if (item == "Commissioners fee") 
    {
        newItem = insert_item(item_CommissionersFee,pos+1)
    }
    
    
    
    // ATTENDING COUNSEL
    if (item == "Attending counsel")
    {
        newItem = insert_item(item_attendingCounsel,pos+1);
    }
    /*
    if (item == "Attending senior counsel therewith")
    {
        newItem = insert_item(item_attendingSeniorCounselTherewith,pos+1);
    }
    
    if (item == "Attending junior counsel therewith")
    {
        newItem = insert_item(item_attendingJuniorCounselTherewith,pos+1);
    }
    */
    
    
    
    
    
    
    
    
    // Fee on Replies to Notice for Particulars
    if (item == "Fee on Replies to Notice for Particulars")
    {
        if !(instance_exists(item_feeOnRepliesToNoticeForParticulars))
        then newItem = insert_item(item_feeOnRepliesToNoticeForParticulars,pos+1)
    }
    
    
    // Fee on Replies to Notice for Further Information
    if (item == "Fee on Replies to Notice for Further Information")
    {
        if !(instance_exists(item_feeOnRepliesToNoticeForFurtherInformation))
        then newItem = insert_item(item_feeOnRepliesToNoticeForFurtherInformation,pos+1)
    }
    
    
    // Authority to the Department of Social Protection and having signed
    if (item == "Authority to the Department of Social Protection")
    {
        //if !(instance_exists(item_authorityToDepartmentOfSocialProtection))
        //then 
        newItem = insert_item(item_authorityToDepartmentOfSocialProtection,pos+1)
    }
    
    
    
    // Authority to the Department of Social Protection and having signed
    if (item == "Received Defence and advising Plaintiff...")
    {
        if !(instance_exists(item_receivedDefence))
        then newItem = insert_item(item_receivedDefence,pos+1)
    }
    
    
    
    // Authority to the Department of Social Protection and having signed
    if (item == "Fee arranging medical examinations of Plaintiff with Defendant")
    {
        newItem = insert_item(item_Plaintiff_feeArrangingMedicalExaminationForDefendant,pos+1)
    }
    
    
    // Recevied Notice to Produce from Defendant
    if (item == "Recevied Notice to Produce from Defendant")
    {
        if !(instance_exists(item_plaintiff_receivedNoticeToProduce))
        then newItem = insert_item(item_plaintiff_receivedNoticeToProduce,pos+1)
    }
    
    
    // Authority to the Department of Social Protection and having signed
    if (item == "Summons To Tax")
    {
        newItem = instance_create(0,0,lastPage_summonsToTax)
    }
    
    
    
    
    
    
    // Preparation of brief including documents
    if (item == "Preparation of Brief For Trial inlcuding books of pleadings")
    {
        if !(instance_exists(item_preparationOfBriefForTrialIncludingBookOfPleadings))
        then newItem = insert_item(item_preparationOfBriefForTrialIncludingBookOfPleadings,pos+1)
    }
    
    if (item == "Preparation of brief for counsel with copies documents")
    {
        if !(instance_exists(item_preparationOfBriefForCounselWithDocuments))
        then newItem = insert_item(item_preparationOfBriefForCounselWithDocuments,pos+1)
    }
    
    
    
    
    
    // Attending Consultation Prior to Hearing
    if (item == "Attending Consultation Prior to Hearing")
    {
        if !(instance_exists(item_attendingConsultationPriorToHearing))
        then newItem = insert_item(item_attendingConsultationPriorToHearing,pos+1)
    }
    
    
    // Paid Law Society for consultation Rooms
    if (item == "Paid Law Society for consultation Rooms")
    {
        if !(instance_exists(item_paidLawSocietyForConsultationRooms))
        then newItem = insert_item(item_paidLawSocietyForConsultationRooms,pos+1)
    }
    
    
    // Attending Court Settlement
    if (item == "Attending Court when a settlement was reached...")
    {
        if !(instance_exists(item_attendingCourtSettlement))
        then newItem = insert_item(item_attendingCourtSettlement,pos+1)
    }
    
    // Attending Court Settlement Not Reached
    if (item == "Attending Court - Settlement not reached")
    {
        if !(instance_exists(item_attendingCourtSettlementNotReached))
        then newItem = insert_item(item_attendingCourtSettlementNotReached,pos+1)
    }
    
    
    
    // Attending for the Order
    if (item == "Attending for the Order")
    {
        if !(instance_exists(item_attendingForTheOrder))
        then newItem = insert_item(item_attendingForTheOrder,pos+1)
    }
    
    
    /// MULTI ITEMS
    if (item == "MULTI - Personal Injury Summons (12)")
    {
        newItem = insert_item(macro_personalInjurySummons,pos+1)
    }
    
    if (item == "MULTI - Replies To Notice For Particulars (10)")
    {
        if (global.BILL_ON_BEHALF_OF == "Plaintiff")
          then newItem = insert_item(macro_plaintiffRepliesToParticulars,pos+1);
    }
    
    if (item == "MULTI - Advice on Proofs (6)")
    {
        if (global.BILL_ON_BEHALF_OF == "Plaintiff")
          then newItem = insert_item(macro_adviceOnProofs,pos+1);
    }
    
    if (item == "MULTI - Consultation with Senior Counsel (4)")
    {
        if (global.BILL_ON_BEHALF_OF == "Plaintiff")
          then newItem = insert_item(macro_plaintiffConsultationWithSeniorCounsel,pos+1);
    }
    
    
    if (item == "MULTI - Setting Down For Hearing (10)")
    {
        if (global.BILL_ON_BEHALF_OF == "Plaintiff")
        then newItem = insert_item(macro_SettingDown,pos+1);
    }
    
    if (item == "MULTI - Obtaining Hearing Date (9)")
    {
        if (global.BILL_ON_BEHALF_OF == "Plaintiff")
        then newItem = insert_item(macro_obtainingHearingDate,pos+1);
    }
    
    
    if (item == "MULTI - Updated Particulars of personal injury (2)")
    {
        if (global.BILL_ON_BEHALF_OF == "Plaintiff")
        then newItem = insert_item(macro_updateParticularsOfPersonalInjury,pos+1);
    }
    
    
    if (item == "MULTI - Plaintiff's Schedule Pusuant to SI 391 1998 (2)")
    {
        if (global.BILL_ON_BEHALF_OF == "Plaintiff")
        then newItem = insert_item(macro_schedulePursuantTo_SI_391_1998,pos+1);
    }
} // END OF HIGHCOURT




    
    
/// COUNSEL FEES
// SENIOR
if (item == "Paid Senior Counsel Fee...")
{
    newItem = insert_item(SENIOR_COUNSEL_FEE,pos+1)
}

if (item == "Senior Counsel Fee - Personal Injury Summons")
{
    newItem = insert_item(SENIOR_COUNSEL_FEE_personalInjurySummons,pos+1)
}

if (item == "Senior Counsel Fee - Settling Replies to Notice for Particulars")
{
    newItem = insert_item(SENIOR_COUNSEL_FEE_settlingRepliesToNotice,pos+1)
}

/*if (item == "Senior Counsel Fee - Disclosure Notice")
{
    newItem = insert_item(SENIOR_COUNSEL_FEE_feeOnConsultation,pos+1)
}*/

if (item == "Senior Counsel Fee - Settling Request for Voluntary Discovery")
{
    newItem = insert_item(SENIOR_COUNSEL_FEE_settlingRequestForVoluntaryDiscovery,pos+1)
}

if (item == "Senior Counsel Fee - Advice On Proofs")
{
    newItem = insert_item(SENIOR_COUNSEL_FEE_feeOnAdviceOnProofs,pos+1)
}

if (item == "Senior Counsel Fee - Attending for Hearing Date")
{
    newItem = insert_item(SENIOR_COUNSEL_FEE_attendingForHearingDate,pos+1)
}

if (item == "Senior Counsel Fee - Brief for Trial of Action")
{
    newItem = insert_item(SENIOR_COUNSEL_FEE_feeOnBriefForTrialOfAction,pos+1)
}

if (item == "Senior Counsel Fee - Fee on Consultation")
{
    newItem = insert_item(SENIOR_COUNSEL_FEE_feeOnConsultation,pos+1)
}

if (item == "Senior Counsel Fee - Settling affidavit")
{
    newItem = insert_item(SENIOR_COUNSEL_FEE_CC_feeOnSettlingAffidavit,pos+1)
}





// JUNIOR
if (item == "Paid Junior Counsel Fee...")
{
    newItem = insert_item(JUNIOR_COUNSEL_FEE,pos+1)
}

if (item == "Junior Counsel Fee - Personal Injury Summons")
{
    newItem = insert_item(JUNIOR_COUNSEL_FEE_personalInjurySummons,pos+1)
}

if (item == "Junior Counsel Fee - Settling Replies to Notice for Particulars")
{
    newItem = insert_item(JUNIOR_COUNSEL_FEE_settlingRepliesToNotice,pos+1)
}

if (item == "Junior Counsel Fee - Advice On Proofs")
{
    newItem = insert_item(JUNIOR_COUNSEL_FEE_feeOnAdviceOnProofs,pos+1)
}

if (item == "Junior Counsel Fee - Settling Request for Voluntary Discovery")
{
    newItem = insert_item(JUNIOR_COUNSEL_FEE_settlingRequestForVoluntaryDiscovery,pos+1)
}

if (item == "Junior Counsel Fee - Attending for Hearing Date")
{
    newItem = insert_item(JUNIOR_COUNSEL_FEE_attendingForHearingDate,pos+1)
}

if (item == "Junior Counsel Fee - Brief for Trial of Action")
{
    newItem = insert_item(JUNIOR_COUNSEL_FEE_feeOnBriefForTrialOfAction,pos+1)
}

if (item == "Junior Counsel Fee - Fee on Consultation")
{
    newItem = insert_item(JUNIOR_COUNSEL_FEE_feeOnConsultation,pos+1)
}

if (item == "Junior Counsel Fee - Settling affidavit")
{
    newItem = insert_item(JUNIOR_COUNSEL_FEE_CC_feeOnSettlingAffidavit,pos+1)
}






















// CIRCUIT COURT ONLY //
if (global.BILL_COURT == "Circuit")
{
    if (item == "Fee on Personal Injury Summons")
    {
        if !(instance_exists(item_CC_personalInjurySummons))
        {   
            newItem = insert_item(item_CC_personalInjurySummons,pos+1)
        }
    }
    
    if (item == "V.A.T. not otherwise recoverable")
    {
        if !(instance_exists(lastPage_VATNotRecoverable))
        {
            newItem = instance_create(0,0,lastPage_VATNotRecoverable);
        }
    }
    
    if (item == "Attending counsel to settle Personal Injury Summons")
    {
        if !(instance_exists(item_CCattendingToSettleSummons))
        {   
            newItem = insert_item(item_CCattendingToSettleSummons,pos+1)
        }
    }
    
    if (item == "Attending counsel to settle")
    {
        newItem = insert_item(item_CC_attendingCounselToSettle,pos+1)
    }
    
    
    if (item == "Stamp on Personal Injury Summons")
    {
        if !(instance_exists(item_CC_stampOnPersonalInjurySummons))
        {   
            newItem = insert_item(item_CC_stampOnPersonalInjurySummons,pos+1)
        }
    }
    
    if (item == "Attending to serve proceedings on the Defendant")
    {
        if !(instance_exists(item_CC_attendingToServeProceedingsOnDefendant))
        {   
            newItem = insert_item(item_CC_attendingToServeProceedingsOnDefendant,pos+1)
        }
    }
    
    if (item == "Affidavit of Verification")
    {
        newItem = insert_item(item_CC_affidavitOfVerification,pos+1)
    }
    
    
    if (item == "Commissioners fee")
    {
        newItem = insert_item(item_CC_commissionersFee,pos+1)
    }
    
    
    if (item == "Brief for Counsel to attend for settlement negotiations")
    {
        if !(instance_exists(item_CC_preparationOfBriefForCounselForSettlementNegotiations))
        {   
            newItem = insert_item(item_CC_preparationOfBriefForCounselForSettlementNegotiations,pos+1)
        }
    }
    
    
    if (item == "Brief for Counsel to attend for settlement negotiations")
    {
        if !(instance_exists(item_CC_preparationOfBriefForCounselForSettlementNegotiations))
        {   
            newItem = insert_item(item_CC_preparationOfBriefForCounselForSettlementNegotiations,pos+1)
        }
    }
    
    
    if (item == "Attending counsel")
    {
        newItem = insert_item(item_CC_attendingCounsel,pos+1)
    }
    
    if (item == "Attending Law Library for negotiations")
    {
        newItem = insert_item(item_CC_attendingLawLibraryForNegotiations,pos+1)
    }
    
    
    if (item == "Received Notice pursuant to Section 11 - Civil Liability and Courts Act 2004")
    {
        newItem = insert_item(item_CC_receivedNoticePursuantToSection11,pos+1)
    }
    
    
    if (item == "Fee on replies to Notice pursuant to Section 11 - Civil Liability and Courts Act 2004")
    {
        newItem = insert_item(item_CC_feeOnRepliesToSection11Notice,pos+1)
    }
    
    
    if (item == "Received Notice for Particulars from Defendant")
    {
        newItem = insert_item(item_CC_receivedNoticeForParticularsFromDefendant,pos+1)
    }
    
    
    if (item == "Fee on Replies to Notice for Particulars")
    {
        newItem = insert_item(item_CC_feeOnRepliesToNoticeForParticulars,pos+1)
    }
    
    
    if (item == "Consent to late filing of Defence")
    {
        newItem = insert_item(item_CC_consentToLateFilingOfDefence,pos+1)
    }
    
    
    if (item == "Warning letter prior to issue of Notice of Trial")
    {
        newItem = insert_item(item_CC_warningLetterPriorToNoticeOfTrial,pos+1)
    }
    
    
    if (item == "Stamp on Notice of Trial")
    {
        newItem = insert_item(item_CC_stampOnNoticeOfTrial,pos+1)
    }
    
    
    if (item == "Fee on Notice of Trial engrossing and copies")
    {
        newItem = insert_item(item_CC_feeOnNoticeOfTrialEngrossingAndCopies,pos+1)
    }
    
    if (item == "Attending to file")
    {
        newItem = insert_item(item_CC_attendingToFile,pos+1)
    }
    
    if (item == "Stamp")
    {
        newItem = insert_item(item_StampThereon,pos+1)
    }
    
    if (item == "Book of Pleadings and attending to file")
    {
        newItem =  insert_item(item_CC_BookOfPleadingsAndAttendingToFile,pos+1)
    }
    
    if (item == "Fee on Notice to Produce and copy to serve")
    {
        newItem =  insert_item(item_CC_feeOnNoticeToProduceAndCopyToServe,pos+1)
    }
    
    if (item == "Fee on case for proofs")
    {
        newItem =  insert_item(item_CC_feeOnCaseForProofs,pos+1)
    }
    
    
    if (item == "Authority for release of records and having signed")
    {
        newItem =  insert_item(item_CC_authorityForReleaseOfRecords,pos+1)
    }
    
    
    if (item == "Instructions for Schedule of Witnesses")
    {
        newItem =  insert_item(item_CC_instructionsForScheduleOfWitnesses,pos+1)
    }
    
    if (item == "Fee on Schedule of Witnesses")
    {
        newItem =  insert_item(item_CC_feeOnPlaintiffsScheduleOfWitnesses,pos+1)
    }
    
    if (item == "Instructions for Schedule of Medical Reports")
    {
        newItem =  insert_item(item_CC_instructionsForScheduleofMedicalReports,pos+1)
    }
    
    
    if (item == "Fee on Schedule of Medical Reports")
    {
        newItem =  insert_item(item_CC_feeOnPlaintiffsScheduleOfMedicalReports,pos+1)
    }
    
    if (item == "Fee on brief to counsel for Trial of Action")
    {
        newItem =  insert_item(item_CC_feeOnPreparationOfBriefToCounselForTrial,pos+1)
    }
    
    if (item = "Instructions for consultation prior to hearing")
    {
        newItem =  insert_item(item_CC_instructionsForConsultationPriorToHearing,pos+1)
    }
    
    if (item = "Fee on consultation prior to hearing")
    {
        newItem =  insert_item(item_CC_feeOnConsultationPriorToHearing,pos+1)
    }

    if (item = "Attending court for hearing...")
    {
        newItem =  insert_item(item_CC_attendingCourtForHearing,pos+1)
    }


    if (item = "Attending for the order")
    {
        newItem =  insert_item(item_CC_attendingForTheOrder,pos+1)
    }

    if (item = "Stamp on Certificate of Taxation")
    {
        newItem =  instance_create(0,0,lastPage_CC_stampOnCertificate)
    }

    // CUSTOM ITEMS
    var array = global.arrayOfCicruitCourtCustomItemValues;
    var size  = array_height_2d(array);
    for(var i=0; i<size; i++)
    {
        if ( item == array[i,0] )
        {
            newItem = insert_item(USER_ITEM,pos+1);
            newItem.description  = array[i,0];
            newItem.outlay       = array[i,1];
            newItem.professional = array[i,2];
        }
    }
    
} // END OF CIRCUIT COURT


if (newItem > -1)
{
    global.selected = newItem;
    view_jump_to_row(newItem.row);
    COMMON_ITEMS_CHECKER.alarm[0] = 2
    DOC_ORGANIZER.alarm[0] = 2;
}
