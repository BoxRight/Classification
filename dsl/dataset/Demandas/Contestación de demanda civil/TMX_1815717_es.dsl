law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb provide: provide

parties
    Defendant: Defendant Person, natural person
    Plaintiff: Plaintiff Person, natural person
    CivilJudge: CivilJudge Corp, legal person

objects
    CivilLawsuit: service
    AnswerDocument: service

article 1 Generated
    fact certification CivilLawsuitFiled is present
    fact certification LegalStandingChallenged is present
    obligation Defendant must provide AnswerDocument to CivilJudge.
    rule AnswerFilingRule
        If certification CivilLawsuitFiled is present
        then Defendant must provide AnswerDocument to CivilJudge.