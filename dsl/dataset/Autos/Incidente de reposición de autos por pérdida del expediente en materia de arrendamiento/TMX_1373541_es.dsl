law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    Judge: Judge Person, natural person
    CourtSecretary: CourtSecretary Person, natural person

objects
    RentalProperty: nonmovable
    CaseFile: service
    InitialComplaint: service
    AnswerToComplaint: service

article 1 Generated
    fact certification CaseFileLoss is present
    fact asset RentalProcess is present
    fact certification LegalPersonality is present
    obligation Judge must provide CaseFile to Plaintiff.
    obligation CourtSecretary must provide CaseFile to Judge.
    rule FileReplacementRule
        If certification CaseFileLoss is present and asset RentalProcess is present
        then Judge must provide CaseFile to Plaintiff.
    procedure FileReplacementProcedure:
        Plaintiff provides InitialComplaint to Judge.
        Judge provides CaseFile to Defendant.
        Defendant provides AnswerToComplaint to Judge.