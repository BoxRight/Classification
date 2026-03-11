law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    Judge: Judge Corp, legal person
    Minor: Minor Person, natural person

objects
    Judgment: service
    SentenceExecution: service

article 1 Generated
    fact asset ExecutoriedJudgment is present
    fact liability DefendantNonCompliance is present
    fact certification MinorInterestProtection is present
    obligation Defendant must provide Judgment to Plaintiff.
    claim Plaintiff may demand SentenceExecution from Judge.
    rule ExecutionAfterNonCompliance
        If asset ExecutoriedJudgment is present and liability DefendantNonCompliance is present
        then Plaintiff may demand SentenceExecution from Judge.
    rule MinorInterestPriority
        If certification MinorInterestProtection is present
        then Judge must provide SentenceExecution to Minor.
    procedure ExecutionIncidentProcedure:
        Plaintiff provides SentenceExecution to Judge.