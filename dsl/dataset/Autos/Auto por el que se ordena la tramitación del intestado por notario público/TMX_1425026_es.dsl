law AutoPorQue
authority judicial
enacted 2024-01-11

vocabulary
    verb provide: provide

parties
    Judge: Judge Corp, legal person
    Executor: Executor Person, natural person
    Notary: Notary Person, natural person
    CourtSecretary: CourtSecretary Person, natural person

objects
    CaseFile: service
    SuccessionProceeding: service

article 1 Generated
    fact certification SuccessionCaseActive is present
    fact certification ExecutorPetitionFiled is present
    obligation Notary must provide CaseFile to Judge.
    rule NotaryReceiptRule
        If certification CaseTransferredToNotary is present
        then Notary must provide CaseFile to Judge.