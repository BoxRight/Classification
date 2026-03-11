law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb provide: provide

parties
    Petitioner: Petitioner Person, natural person
    Judge: Judge Person, natural person
    Plaintiff: Plaintiff Person, natural person

objects
    InstanceLapseIncident: service
    SentenceExecution: service
    LeaseLawsuit: service

article 1 Generated
    fact certification LawsuitInitiated is present
    fact certification InstanceLapsed is present
    claim Petitioner may demand InstanceLapseIncident from Judge.
    rule NullificationRule
        If certification InstanceLapsed is present
        then Judge must provide SentenceExecution to Petitioner.
    procedure InstanceLapseProcedure:
        Petitioner provides InstanceLapseIncident to Judge.
        Judge provides SentenceExecution to Petitioner.