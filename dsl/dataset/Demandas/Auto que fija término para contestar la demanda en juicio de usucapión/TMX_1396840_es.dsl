law AutoQueFija
authority judicial
enacted 2024-01-11

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    CivilJudge: CivilJudge Person, natural person
    CourtNotifier: CourtNotifier Person, natural person

objects
    UsucapionLawsuit: service
    AnswerToLawsuit: service

article 1 Generated
    fact certification LawsuitAdmitted is present
    fact certification SummonsServed is present
    obligation Defendant must provide AnswerToLawsuit to CivilJudge.
    rule ServiceRule
        If certification LawsuitAdmitted is present
        then CourtNotifier must provide UsucapionLawsuit to Defendant.
    procedure UsucapionProcedure:
        Plaintiff provides UsucapionLawsuit to CivilJudge.
        CivilJudge provides UsucapionLawsuit to Plaintiff.
        CourtNotifier provides UsucapionLawsuit to Defendant.
        Defendant provides AnswerToLawsuit to CivilJudge.