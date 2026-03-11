law CódigoProcedimientosCiviles
authority judicial

vocabulary
    verb provide: provide

parties
    Appellant: Appellant Corp, legal person
    Judge: Judge Person, natural person

objects
    JudicialResolution: service
    RevocationAppeal: service
    OrdinaryAppeal: service

article 1 Generated
    fact certification JudicialBulletinPublication is present
    claim Appellant may demand RevocationAppeal from Judge.
    claim Appellant may demand OrdinaryAppeal from Judge.
    rule RevocationFilingRule
        If certification JudicialBulletinPublication is present
        then Appellant may demand RevocationAppeal from Judge.
    rule AlternativeAppealRule
        If asset ResolutionAppealable is present
        then Appellant may demand OrdinaryAppeal from Judge.
    procedure AppealFilingProcedure:
        Appellant provides RevocationAppeal to Judge.
        Appellant provides OrdinaryAppeal to Judge.