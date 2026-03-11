law ActaAudienciaRebeldía
authority judicial
enacted 2024-01-04

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    Judge: Judge Person, natural person
    Secretary: Secretary Person, natural person

article 1 Generated
    fact certification ScheduledHearing is present
    fact certification DefendantDefault is present
    fact certification EvidencePresented is present
    procedure DefaultHearingProcedure:
        Judge performs HearingOpening to Court.
        Judge performs DefaultDeclaration to Defendant.
        Plaintiff performs Evidence to Court.
        Plaintiff performs Allegations to Court.
        Judge performs CaseSubmission to FinalJudgment.

scenario default_hearing_timeline:
    at hearing_scheduled
    at plaintiff_appears
    at defendant_fails_to_appear
    at default_declared
    at evidence_presented
    at case_submitted_for_judgment