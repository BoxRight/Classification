law CódigoProcedimientosCiviles
authority judicial

vocabulary
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    Court: Court Corp, legal person
    Secretary: Secretary Corp, legal person

objects
    LeaseLawsuit: service
    InitialComplaint: service
    LeaseContract: service
    CaseFile: service

article 1 Generated
    fact certification LawsuitAdmitted is present
    fact certification CaseFileCreated is present
    fact certification DefendantNotified is present
    obligation Defendant must provide InitialComplaint to Court.
    rule AnswerDeadlineRule
        If certification DefendantNotified is present
        then Defendant must provide InitialComplaint to Court.
    procedure LeaseLawsuitProcedure:
        Plaintiff provides LeaseLawsuit to Court.
        Court provides LeaseLawsuit to Plaintiff.
        Defendant provides InitialComplaint to Court.