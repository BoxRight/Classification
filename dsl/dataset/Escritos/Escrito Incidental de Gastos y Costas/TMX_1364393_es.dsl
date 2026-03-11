law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb pay: pay

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    Judge: Judge Person, natural person
    Lawyer: Lawyer Person, natural person

objects
    CostsAndExpenses: money
    LegalFeesDefense: money
    LegalFeesHearing: money
    LegalFeesEvidence: money
    LegalFeesSettlement: money
    ProfessionalServicesContract: service

article 1 Generated
    fact certification LawsuitFiled is present
    fact certification ComplaintAnswered is present
    fact certification ConciliationHearingHeld is present
    fact certification EvidenceOffered is present
    fact certification ActionWithdrawn is present
    fact certification WithdrawalRatified is present
    fact liability CostsAndExpensesLiability is present
    rule WithdrawalCostsRule
        If certification ActionWithdrawn is present and certification WithdrawalRatified is present
        then Plaintiff must pay CostsAndExpenses to Defendant.

scenario lease_lawsuit_withdrawal:
    at lawsuit_filed
    at complaint_answered
    at conciliation_hearing_held
    at evidence_offered
    at action_withdrawn
    at withdrawal_ratified
    at costs_incident_filed