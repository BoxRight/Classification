law CódigoProcedimientosCiviles
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
    ConfessionEvidence: service
    DocumentaryEvidence: service

article 1 Generated
    fact certification LegalHearing is present
    fact certification RentalDispute is present
    obligation Plaintiff must provide ConfessionEvidence to Judge.
    obligation Defendant must provide ConfessionEvidence to Judge.
    procedure RentalHearingProcedure:
        Plaintiff transfers RentalProperty to Judge.

scenario rental_hearing_timeline:
    at hearing_scheduled
    at plaintiff_appears
    at defendant_fails_to_appear
    at evidence_presented
    at judgment_scheduled