law CódigoProcedimientosCiviles
authority judicial

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Defendant: Defendant Person, natural person
    Plaintiff: Plaintiff Person, natural person
    CivilJudge: CivilJudge Corp, legal person

objects
    CivilLiabilityClaim: service
    AnswerToComplaint: service

article 1 Generated
    fact certification CivilProceeding is present
    fact liability CivilLiabilityCase is present
    obligation Defendant must provide AnswerToComplaint to CivilJudge.
    privilege Defendant may perform ProceduralExceptions to CivilJudge.
    rule AnswerFilingRule
        If certification CivilProceeding is present
        then Defendant must provide AnswerToComplaint to CivilJudge.
    rule ExceptionRaisingRule
        If liability CivilLiabilityCase is present
        then Defendant may perform ProceduralExceptions to CivilJudge.
    procedure AnswerFilingProcedure:
        Defendant provides AnswerToComplaint to CivilJudge.
        Defendant fail CivilLiabilityClaim to Plaintiff.
        Defendant performs ProceduralExceptions to CivilJudge.