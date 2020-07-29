/// find_cautions()
ds_list_clear(global.CAUTIONS);


with (ITEM)
{
    // get the quantum row
    qrow = (row + ds_list_size(shownDescriptionList))-1;
    if (qrow < row) then qrow = row;
    
    user_item_dates();
    //if validate_year(dateYear)   == false then add_caution("invalid year",id.row);
    //if validate_month(dateMonth) == false then add_caution("invalid month",id.row+1);
    //if validate_day(dateDay)     == false then add_warning("invalid day",id.row);
    
    if (defaultOutlay > 0) and (outlay != defaultOutlay)
    then add_caution("Professional on this item is normally " +string(formatQuantum(defaultOutlay)), qrow );
        
    if (defaultProfessional > 0) and (professional != defaultProfessional)
    then add_caution("Professional on this item is normally " +string(formatQuantum(defaultProfessional)), qrow );
}


with (USER_ITEM)
{
    //if  (countMyItemNumber = false) and (canToggleItemNumber == true)
    //  then add_caution("Normal items should have item numbers so they can be identified easily.", row); 
    
    // Is the item showing "See Fee Later" but the instructions fee was destroyed?
    /*
    if  (instructionsFee == true)
    and (seeFeeLater == true)
    {
        if  (myFee == -3)
        //and (outlay == 0)
        //and (professional == 0)
        then add_caution("Note the actual instructions fee for this item was deleted" +formatQuantum(global.APPENDIX_W_HC_ATTENDING_TAXATION) +"", row); 
    }
    */
}



with (item_section17Notice)
{
    if (professionalText != formatQuantum(global.section17NoticeCopyAndAttendingToFileAndServe))
    {
        add_caution("This fee should be " +formatQuantum(global.section17NoticeCopyAndAttendingToFileAndServe) +"", qrow);
    }
}


with (item_formalRequestForVoluntaryDiscovery)
{
    if (professionalText != formatQuantum(global.formalRequestForVoluntaryDiscovery))
    {
        add_caution("This fee should be " +formatQuantum(global.formalRequestForVoluntaryDiscovery) +"", qrow);
    }
}


with (item_authorityToDepartmentOfSocialProtection)
{
    if (professionalText != formatQuantum(global.authorityToDepartmentOfSocialProtection))
    {
        add_caution("This fee should be " +formatQuantum(global.authorityToDepartmentOfSocialProtection) +"", qrow);
    }
}


with (item_warningLetterToDefendant_LateDiscovery)
{
    if (professionalText != formatQuantum(global.warningLetter))
    {
        add_caution("This fee should be " +formatQuantum(global.warningLetter) +"", qrow);
    }
}


with (item_requestForDetailsOfEarningsFromEmployer)
{
    if (professionalText != formatQuantum(global.requestForDetailsOfEarningsFromEmployer))
    {
        add_caution("This fee should be " +formatQuantum(global.requestForDetailsOfEarningsFromEmployer) +"", qrow);
    }
}




with (item_scheduleOfSpecialDamages)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_scheduleOfSpecialDamages))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_scheduleOfSpecialDamages) +"", qrow);
    }
}



with (item_formal_letter_prior_to_proceedings)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_formalLetterPriorToProceedings))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_formalLetterPriorToProceedings) +"", qrow);
    }
}


with (lastPage_attendingTaxation)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_ATTENDING_TAXATION))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_ATTENDING_TAXATION) +"", qrow); 
    }
}

with (lastPage_stampThereon)
{
    if (outlayText != formatQuantum(global.APPENDIX_W_HC_StampOnSummonsToTax))
    {
        add_caution("This stamp is " +formatQuantum(global.APPENDIX_W_HC_StampOnSummonsToTax) +" standard", qrow); 
    }
}


with (item_Plaintiff_feeArrangingMedicalExaminationForDefendant)
{
    var str = formatQuantum(global.feeArrangingMedicalExaminationForDefendant);
    
    if  (professionalText != string(str))
    and (professionalText != NOQUANTUM)
    {
        add_caution("If claimed, this fee should be " +string(str) +" or "+string(NOQUANTUM), qrow);
    }
    if (professionalText == string(str))
    {
        add_caution("This item is likely to not be allowed, as it is not provided for in the rules. Consider removing fee to add to instructions fee automatically.", qrow);
    }
}



with (item_CCattendingToSettleSummons)
{
    if (professionalText != formatQuantum(global.CC_attendingToSettleSummons))
    {
        add_caution("This fee should be " +formatQuantum(global.CC_attendingToSettleSummons) +"", qrow); 
    }
}



with (item_CC_personalInjurySummons)
{
    if (professionalText != formatQuantum(global.CC_personalInjurySummons))
    {
        add_caution("This fee should be " +formatQuantum(global.CC_personalInjurySummons) +"", qrow); 
    }
}



with (item_Personal_Injury_Summons_PreparationFee)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_feeOnPreparationOfPersonalInjurySummons))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_feeOnPreparationOfPersonalInjurySummons) +"", qrow); 
    }
}

with (item_attendingToFileSummons)
{
    if (professionalText != NOQUANTUM)
    {
        add_caution("Professional for this item is normally -.--", qrow); 
    }
}

with (item_copyForService)
{
    if (professionalText != NOQUANTUM)
    {
        add_caution("Professional for this item is normally -.--", qrow); 
    }
}


with (item_attendingJuniorCounselToSettle)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_attendingCounselToSettle))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_attendingCounselToSettle) +"", qrow); 
    }
}

with (item_attendingCounselToSettle)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_attendingCounselToSettle))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_attendingCounselToSettle) +"", qrow); 
    }
}


with (item_ServiceOfSummonsOnDefendant)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_ServiceOfSummonsOnDefendant))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_ServiceOfSummonsOnDefendant) +"", qrow); 
    }
}

with (item_AffidavitOfVerification)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_affidavitOfVerification))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_affidavitOfVerification) +"", qrow); 
    }
}

with (item_StampOnAffidavit)
{
    if (outlayText != formatQuantum(global.stampOnAffidavitFee))
    {
        add_caution("Stamp on affidavit is normally " +formatQuantum(global.stampOnAffidavitFee), qrow); 
    }
}


with (item_CommissionersFee)
{
    if (outlayText != formatQuantum(global.CommissionersFee))
    {
        add_caution("Commissioners Fee is normally " +formatQuantum(global.CommissionersFee), qrow); 
    }
}


with (item_briefForCounselToAttendForHearingDate)
{
    if (professionalText != formatQuantum(global.briefForCounselToAttendForHearingDate))
    {
        add_caution("This fee should be "  +formatQuantum(global.briefForCounselToAttendForHearingDate) +"", qrow); // probably not actually Appendix W
    }
}

with (item_attendingCounsel)
{
    if (professionalText != formatQuantum(global.attendingCounselTherewith))
    {
        add_caution("This fee should be "  +formatQuantum(global.attendingCounselTherewith) +"", qrow); // probably not actually Appendix W
    }
}


with (item_attendingCourtObtainingHearingDate)
{
    if (professionalText != formatQuantum(global.attendingCourtObtainingHearingDate))
    {
        add_caution("This fee should be "  +formatQuantum(global.attendingCourtObtainingHearingDate) +"", qrow); // probably not actually Appendix W
    }
}




/*
with (item_injuriesBoardFee)
{
    if ( outlayText != formatQuantum(global.INJURIES_BOARD_FEE) )
    {
        add_caution("Injuries Board Fee is normally" +formatQuantum(global.INJURIES_BOARD_FEE), row); 
    }
}
*/

with (item_feeOnRepliesToNoticeForParticulars)
{
    if (professionalText != formatQuantum(global.feeOnRepliesToNoticeForParticulars))
    {
        add_caution("This fee should be " +formatQuantum(global.feeOnRepliesToNoticeForParticulars) +"", qrow); 
    }
}


with (item_FeeOnCaseForProofs)
{
    if (professionalText != formatQuantum(global.FeeOnCaseForProofs))
    {
        add_caution("This fee should be " +formatQuantum(global.FeeOnCaseForProofs) +"", qrow); 
    }
}


with (item_scheduleOfSpecialDamagesUpdated)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_scheduleOfSpecialDamagesUpdate))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_scheduleOfSpecialDamagesUpdate) +"", qrow); 
    }
}

with (item_attendingSeniorCounselTherewith)
{
    if (professionalText != formatQuantum(global.attendingSeniorCounselTherewith))
    {
        add_caution("This fee should be " +formatQuantum(global.attendingSeniorCounselTherewith) +"", qrow); 
    }
}


with (item_noticeOfTrial)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_noticeOfTrial))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_noticeOfTrial) +"", qrow); 
    }
}

with (item_serviceOfNoticeOfTrial)
{
    if (outlayText != formatQuantum(global.APPENDIX_W_HC_serviceOfNoticeOfTrial))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_serviceOfNoticeOfTrial) +"", qrow); 
    }
}


with (item_attendingToFileForHearing)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_attendingToFileForHearing))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_attendingToFileForHearing) +"", qrow); 
    }
}


with (item_twoBooksOfPleadings)
{
    if (professionalText != formatQuantum(global.twoBooksOfPleadingsFee))
    {
        add_caution("This cost is normally " +formatQuantum(global.twoBooksOfPleadingsFee) +"", qrow); 
    }
}


with (item_StampOnNoticeOfTrial)
{
    if (outlayText != formatQuantum(global.fee_StampOnNoticeOfTrial))
    {
        add_caution("This stamp is normally " +formatQuantum(global.fee_StampOnNoticeOfTrial) +"", qrow); 
    }
}


with (item_StampOnSettingDown)
{
    if (outlayText != formatQuantum(global.fee_stampOnSettingDown))
    {
        add_caution("Stamp for this is " +formatQuantum(global.fee_stampOnSettingDown) +" standard", qrow); 
    }
}


with (item_NoticeForSettingDown)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_noticeForSettingDown))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_noticeForSettingDown) +"", qrow); 
    }
}


with (item_declarationOfServiceOfNoticeOfTrial)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_declarationOfServiceOfNoticeOfTrial))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_declarationOfServiceOfNoticeOfTrial) +"", qrow); 
    }
}


with (item_noticeToProduce)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_noticeToProduce))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_noticeToProduce) +"", qrow); 
    }
}


with (item_feeOnUpdatedParticularsOfPersonalInjury)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_HC_feeOnUpdatedParticularsOfPersonalInjury))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_HC_feeOnUpdatedParticularsOfPersonalInjury) +"", qrow); 
    }
}

with (item_plaintiffsScheduleOfWitnesses)
{
    if (professionalText != formatQuantum(global.APPENDIX_W_plaintiffsScheduleOfWitneses))
    {
        add_caution("This fee should be " +formatQuantum(global.APPENDIX_W_plaintiffsScheduleOfWitneses) +"", qrow); 
    }
}


/*with (item_solicitorsMileage)
{
    if (shownDescription != ("Solicitors mileage at €"+string(global.solicitorCostPerMileage) +" per mile"))
    {
        add_caution("Note: Mileage is usually allowed at €" +string(global.solicitorCostPerMileage), row); 
    }
}*/

with (item_attendingCourtSettlement)
{
    if (professionalText != formatQuantum(global.attendingCourtSettlement))
    {
        add_caution("This fee should be " +formatQuantum(global.attendingCourtSettlement) +"", qrow); 
    }
}



with (item_attendingForTheOrder)
{
    if (professionalText != formatQuantum(global.attendingForTheOrder))
    {
        add_caution("This fee should be " +formatQuantum(global.attendingForTheOrder) +"", qrow); 
    }
}




/// sort the list
if (global.sortWarningsAndCautions)
 then sort_warnings(global.CAUTIONS);
