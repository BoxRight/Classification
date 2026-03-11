law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    CivilJudge: CivilJudge Corp, legal person

objects
    NullityAction: service
    ConcludedJudgment: service
    FraudulentEvidence: service

article 1 Generated
    fact certification ConcludedJudgmentExists is present
    fact certification FraudulentEvidencePresented is present
    claim Plaintiff may demand NullityAction from CivilJudge.
    rule NullityActionRule
        If certification ConcludedJudgmentExists is present and certification FraudulentEvidencePresented is present
        then Plaintiff may demand NullityAction from CivilJudge.
    procedure NullityFilingProcedure:
        Plaintiff provides NullityAction to CivilJudge.