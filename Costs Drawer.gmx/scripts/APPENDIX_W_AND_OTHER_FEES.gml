/// APPENDIX_W_AND_OTHER_FEES()

/* Default items array anatomy
 * global.arrayOfHighCourtItemValues[0,0] = "default description"
 * global.arrayOfHighCourtItemValues[0,1] = "new description"
 * global.arrayOfHighCourtItemValues[0,2] = default value;
 * global.arrayOfHighCourtItemValues[0,3] = custom value;

global.arrayOfHighCourtItemValues[0,0] = "Attending Taxation";
global.arrayOfHighCourtItemValues[0,1] = "";
global.arrayOfHighCourtItemValues[0,2] = 12.56;
global.arrayOfHighCourtItemValues[0,3] = 0;
global.arrayOfHighCourtItemValues[1,0] = "Stamp On Summons To Tax";
global.arrayOfHighCourtItemValues[1,1] = "";
global.arrayOfHighCourtItemValues[1,2] = 270.00;
global.arrayOfHighCourtItemValues[1,3] = 0;
*/


// values
global.APPENDIX_W_HC_ATTENDING_TAXATION     = 12.56;
global.costPerFolio                         = 0.17;
global.APPENDIX_W_HC_StampOnSummonsToTax    = 270.00;
global.INJURIES_BOARD_FEE                   = 45.00;
global.CommissionersFee                     = 10.00;
global.attendingForTheOrder                 = 1.28;

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
global.arrayOfHighCourtCustomItemValues[1,1] = 78;
global.arrayOfHighCourtCustomItemValues[1,2] = 0;
global.arrayOfHighCourtCustomItemValues[2,0] = "Item 3";
global.arrayOfHighCourtCustomItemValues[2,1] = 0;
global.arrayOfHighCourtCustomItemValues[2,2] = 0;
global.arrayOfHighCourtCustomItemValues[3,0] = "Item 4";
global.arrayOfHighCourtCustomItemValues[3,1] = 0;
global.arrayOfHighCourtCustomItemValues[3,2] = 0;
global.arrayOfHighCourtCustomItemValues[4,0] = "Item 5";
global.arrayOfHighCourtCustomItemValues[4,1] = 0;
global.arrayOfHighCourtCustomItemValues[4,2] = 0;
global.arrayOfHighCourtCustomItemValues[5,0] = "Item 6";
global.arrayOfHighCourtCustomItemValues[5,1] = 0;
global.arrayOfHighCourtCustomItemValues[5,2] = 0;
global.arrayOfHighCourtCustomItemValues[6,0] = "Item 7";
global.arrayOfHighCourtCustomItemValues[6,1] = 0;
global.arrayOfHighCourtCustomItemValues[6,2] = 0;
global.arrayOfHighCourtCustomItemValues[7,0] = "Item 8";
global.arrayOfHighCourtCustomItemValues[7,1] = 0;
global.arrayOfHighCourtCustomItemValues[7,2] = 0;
global.arrayOfHighCourtCustomItemValues[8,0] = "Item 9";
global.arrayOfHighCourtCustomItemValues[8,1] = 0;
global.arrayOfHighCourtCustomItemValues[8,2] = 0;
global.arrayOfHighCourtCustomItemValues[9,0] = "Item 10";
global.arrayOfHighCourtCustomItemValues[9,1] = 0;
global.arrayOfHighCourtCustomItemValues[9,2] = 0;
global.arrayOfHighCourtCustomItemValues[10,0] = "Item 11";
global.arrayOfHighCourtCustomItemValues[10,1] = 0;
global.arrayOfHighCourtCustomItemValues[10,2] = 0;
global.arrayOfHighCourtCustomItemValues[11,0] = "Item 12";
global.arrayOfHighCourtCustomItemValues[11,1] = 0;
global.arrayOfHighCourtCustomItemValues[11,2] = 0;
global.arrayOfHighCourtCustomItemValues[12,0] = "Item 13";
global.arrayOfHighCourtCustomItemValues[12,1] = 0;
global.arrayOfHighCourtCustomItemValues[12,2] = 0;
global.arrayOfHighCourtCustomItemValues[13,0] = "Item 14";
global.arrayOfHighCourtCustomItemValues[13,1] = 0;
global.arrayOfHighCourtCustomItemValues[13,2] = 0;
global.arrayOfHighCourtCustomItemValues[14,0] = "Item 15";
global.arrayOfHighCourtCustomItemValues[14,1] = 0;
global.arrayOfHighCourtCustomItemValues[14,2] = 0;
global.arrayOfHighCourtCustomItemValues[15,0] = "Item 16";
global.arrayOfHighCourtCustomItemValues[15,1] = 0;
global.arrayOfHighCourtCustomItemValues[15,2] = 0;
global.arrayOfHighCourtCustomItemValues[16,0] = "Item 17";
global.arrayOfHighCourtCustomItemValues[16,1] = 0;
global.arrayOfHighCourtCustomItemValues[16,2] = 0;
global.arrayOfHighCourtCustomItemValues[17,0] = "Item 18";
global.arrayOfHighCourtCustomItemValues[17,1] = 0;
global.arrayOfHighCourtCustomItemValues[17,2] = 0;
global.arrayOfHighCourtCustomItemValues[18,0] = "Item 19";
global.arrayOfHighCourtCustomItemValues[18,1] = 0;
global.arrayOfHighCourtCustomItemValues[18,2] = 0;
global.arrayOfHighCourtCustomItemValues[19,0] = "Item 20";
global.arrayOfHighCourtCustomItemValues[19,1] = 0;
global.arrayOfHighCourtCustomItemValues[19,2] = 0;
global.arrayOfHighCourtCustomItemValues[20,0] = "Item 21";
global.arrayOfHighCourtCustomItemValues[20,1] = 0;
global.arrayOfHighCourtCustomItemValues[20,2] = 0;
global.arrayOfHighCourtCustomItemValues[21,0] = "Item 22";
global.arrayOfHighCourtCustomItemValues[21,1] = 0;
global.arrayOfHighCourtCustomItemValues[21,2] = 0;
global.arrayOfHighCourtCustomItemValues[22,0] = "Item 23";
global.arrayOfHighCourtCustomItemValues[22,1] = 0;
global.arrayOfHighCourtCustomItemValues[22,2] = 0;
global.arrayOfHighCourtCustomItemValues[23,0] = "Item 24";
global.arrayOfHighCourtCustomItemValues[23,1] = 0;
global.arrayOfHighCourtCustomItemValues[23,2] = 0;
global.arrayOfHighCourtCustomItemValues[24,0] = "Item 25";
global.arrayOfHighCourtCustomItemValues[24,1] = 0;
global.arrayOfHighCourtCustomItemValues[24,2] = 0;
global.arrayOfHighCourtCustomItemValues[25,0] = "Item 26";
global.arrayOfHighCourtCustomItemValues[25,1] = 0;
global.arrayOfHighCourtCustomItemValues[25,2] = 0;
global.arrayOfHighCourtCustomItemValues[26,0] = "Item 27";
global.arrayOfHighCourtCustomItemValues[26,1] = 0;
global.arrayOfHighCourtCustomItemValues[26,2] = 0;
global.arrayOfHighCourtCustomItemValues[27,0] = "Item 28";
global.arrayOfHighCourtCustomItemValues[27,1] = 0;
global.arrayOfHighCourtCustomItemValues[27,2] = 0;
global.arrayOfHighCourtCustomItemValues[28,0] = "Item 29";
global.arrayOfHighCourtCustomItemValues[28,1] = 0;
global.arrayOfHighCourtCustomItemValues[28,2] = 0;
global.arrayOfHighCourtCustomItemValues[29,0] = "Item 30";
global.arrayOfHighCourtCustomItemValues[29,1] = 0;
global.arrayOfHighCourtCustomItemValues[29,2] = 0;
global.arrayOfHighCourtCustomItemValues[29,0] = "Item 30";
global.arrayOfHighCourtCustomItemValues[29,1] = 0;
global.arrayOfHighCourtCustomItemValues[29,2] = 0;
global.arrayOfHighCourtCustomItemValues[30,0] = "Item 31";
global.arrayOfHighCourtCustomItemValues[30,1] = 0;
global.arrayOfHighCourtCustomItemValues[30,2] = 0;
global.arrayOfHighCourtCustomItemValues[31,0] = "Item 32";
global.arrayOfHighCourtCustomItemValues[31,1] = 0;
global.arrayOfHighCourtCustomItemValues[31,2] = 0;
global.arrayOfHighCourtCustomItemValues[32,0] = "Item 33";
global.arrayOfHighCourtCustomItemValues[32,1] = 0;
global.arrayOfHighCourtCustomItemValues[32,2] = 0;
global.arrayOfHighCourtCustomItemValues[33,0] = "Item 34";
global.arrayOfHighCourtCustomItemValues[33,1] = 0;
global.arrayOfHighCourtCustomItemValues[33,2] = 0;
global.arrayOfHighCourtCustomItemValues[34,0] = "Item 35";
global.arrayOfHighCourtCustomItemValues[34,1] = 0;
global.arrayOfHighCourtCustomItemValues[34,2] = 0;



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

