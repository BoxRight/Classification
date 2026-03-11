law LeyAmparo,Reglamentaria
authority judicial

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Judge: Judge Corp, legal person
    ComplainantParty: ComplainantParty Person, natural person
    CoordinationForensicServices: CoordinationForensicServices Corp, legal person
    OtherParties: OtherParties Person, natural person

objects
    GraphoscopyExpertEvidence: service
    Questionnaire: movable
    FineFiftyDaysMinimumWage: money

article 1 Generated
    fact certification ExpertEvidenceOffered is present
    fact certification ExpertEvidenceAdmitted is present
    obligation OtherParties must transfer Questionnaire to Judge.
    obligation CoordinationForensicServices must provide GraphoscopyExpertEvidence to Judge.
    obligation ComplainantParty must provide GraphoscopyExpertEvidence to Judge.
    rule QuestionnaireExpansionRule
        If certification ExpertEvidenceAdmitted is present
        then OtherParties may transfer Questionnaire to Judge.
    rule FineImpositionRule
        If CoordinationForensicServices fails to provide GraphoscopyExpertEvidence to Judge
        then Judge must pay FineFiftyDaysMinimumWage to CoordinationForensicServices.
    procedure ExpertEvidencePreparation:
        Judge transfers Questionnaire to OtherParties.
        ComplainantParty provides GraphoscopyExpertEvidence to Judge.