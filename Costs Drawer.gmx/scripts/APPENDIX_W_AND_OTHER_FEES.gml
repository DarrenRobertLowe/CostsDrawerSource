/// APPENDIX_W_AND_OTHER_FEES()

/* Default items array anatomy
 * global.arrayOfHighCourtItemValues[0,0] = "default description"
 * global.arrayOfHighCourtItemValues[0,1] = "new description"
 * global.arrayOfHighCourtItemValues[0,2] = default value;
 * global.arrayOfHighCourtItemValues[0,3] = custom value;
*/
global.arrayOfHighCourtItemValues[0,0] = "Attending Taxation";
global.arrayOfHighCourtItemValues[0,1] = "";
global.arrayOfHighCourtItemValues[0,2] = 12.56;
global.arrayOfHighCourtItemValues[0,3] = 0;
global.arrayOfHighCourtItemValues[1,0] = "Stamp On Summons To Tax";
global.arrayOfHighCourtItemValues[1,1] = "";
global.arrayOfHighCourtItemValues[1,2] = 270.00;
global.arrayOfHighCourtItemValues[1,3] = 0;


/* Custom items array anatomy
 * Note: since there's no "default" value, we're
 * only concerned with whether the value is for
 * outlay or professional.
 *
 * global.arrayOfHighCourtItemValues[0,0] = "name / description"
 * global.arrayOfHighCourtItemValues[0,1] = Outlay
 * global.arrayOfHighCourtItemValues[0,2] = Professional
*/
global.arrayOfHighCourtCustomItemValues[0,0] = "This is a custom item description and attending same";
global.arrayOfHighCourtCustomItemValues[0,1] = 0;
global.arrayOfHighCourtCustomItemValues[0,2] = 123.45;
global.arrayOfHighCourtCustomItemValues[1,0] = "This is another custom item description";
global.arrayOfHighCourtCustomItemValues[1,1] = 0;
global.arrayOfHighCourtCustomItemValues[1,2] = 78;





// values
global.APPENDIX_W_HC_ATTENDING_TAXATION     = 12.56;
global.costPerFolio = 0.17;
global.APPENDIX_W_HC_StampOnSummonsToTax    = 270.00;

global.INJURIES_BOARD_FEE                   = 45.00;
global.CommissionersFee = 10.00;
global.attendingForTheOrder = 1.28;
global.costPerFolio = 0.17;

global.APPENDIX_W_HC_formalLetterPriorToProceedings = 0.83;

global.solicitorCostPerMileage = 1;
global.APPENDIX_W_HC_attendingConsultation = 9.52;

global.APPENDIX_W_HC_ServiceOfSummonsOnDefendant = 10.00

global.APPENDIX_W_HC_feeOnPreparationOfPersonalInjurySummons  = 17.07;

global.APPENDIX_W_HC_attendingCounselToSettle   = 2.56;
global.APPENDIX_W_HC_affidavitOfVerification    = 2.56;


global.APPENDIX_W_HC_serviceOfNoticeOfTrial = 6.25;


global.stampOnAffidavitFee = 20.00;

global.feeOnRepliesToNoticeForParticulars = 8.53;
global.feeOnRepliesToNoticeForFurtherInformation = 8.53;
global.section17NoticeCopyAndAttendingToFileAndServe = 8.53;
global.formalRequestForVoluntaryDiscovery = 8.53;
global.FeeOnCaseForProofs = 8.53;
global.requestForDetailsOfEarningsFromEmployer = 8.53;
global.APPENDIX_W_HC_scheduleOfSpecialDamages = 8.53;
global.APPENDIX_W_HC_scheduleOfSpecialDamagesUpdate = 8.53;


global.authorityToDepartmentOfSocialProtection = 5.11;


global.attendingCounselTherewith = 2.56;
global.attendingSeniorCounselTherewith = 2.56;


global.APPENDIX_W_HC_noticeOfTrial = 2.13;
global.APPENDIX_W_HC_attendingToFileForHearing = 1.28;

global.twoBooksOfPleadingsFee = 12.70;
global.fee_StampOnNoticeOfTrial = 60.00;


global.APPENDIX_W_HC_noticeForSettingDown = 1.28;

global.fee_stampOnSettingDown = 250.00;

global.APPENDIX_W_HC_declarationOfServiceOfNoticeOfTrial = 2.56;
global.APPENDIX_W_HC_noticeToProduce = 2.56;

global.APPENDIX_W_HC_feeOnUpdatedParticularsOfPersonalInjury = 8.53;

global.warningLetter = 20.00;

global.briefForCounselToAttendForHearingDate = 31.50;   // Is this set out in appendix_w ?
global.attendingCourtObtainingHearingDate    = 20.47;   // Is this set out in appendix_w ?

global.APPENDIX_W_plaintiffsScheduleOfWitneses = 8.53;

global.feeArrangingMedicalExaminationForDefendant = 50.45; // Note: this is not in the rules, but was arrived at by negotiations, and used to be allowed by Taxing Masters in the past. (it has since been stricken out, but no harm in adding it anyway)


global.preparationOfBriefForCounselForTrialOfAction = 66.00;
global.preparationOfBriefForTrialOfActionIncludingBookOfPleadings = 66.00;
global.preparationOfBriefForJuniorCounselWithCopiesDocuments = 66.00;


global.attendingCourtSettlement = 20.47;






// CIRCUIT COURT

global.CC_personalInjurySummons  = 25.39;
global.CC_attendingToSettleSummons = 9.52;
global.CC_attendingToServeProceedingsOnDefendant = 15.00;
global.CC_affidavitOfVerification = 25.39;
global.CC_commissionersFee = 12.00;
global.CC_attendingCounselToSettle = 9.52;
global.CC_preparationOfBriefForCounselForSettlementNegotiations = 44.00;
global.CC_attendingCounsel = 9.52;
global.CC_attendingLawLibraryForNegotiations = 38.00;
global.CC_feeOnRepliesToSection11 = 25.39;
global.CC_feeOnRepliesToNoticeForParticulars = 25.39;
global.CC_warningLetterPriorToIssueOfNoticeOfTrial = 20.00;
global.CC_feeOnNoticeOfTrialEngrossingAndCopies = 9.52;
global.CC_attendingToFile = 9.52;
global.CC_feeOnNoticeToProduceAndCopyToServe = 9.52;
global.CC_feeOnCaseForProofs = 25.39;
global.CC_authorityForReleaseOfRecords = 5.11;
global.CC_feeOnSchedule = 9.52;
global.CC_feeOnPreparationOfBriefToCounselForTrial = 44.00;
global.CC_feeOnConsultationPriorToHearing = 38.00;
global.CC_attendingCourtSettlement = 38.00;
global.CC_ATTENDING_TAXATION = 63.00;
global.CC_summonsToTax = 25.00;
global.CC_stampOnSummonsToTax = 70.00;
global.CC_stampOnCertificate = 70.00;
global.CC_drawingCostsAndCopy = 38.00;
