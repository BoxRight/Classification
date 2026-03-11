law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    Judge: Judge Person, natural person
    NotaryPublic: NotaryPublic Person, natural person
    ExpertWitness: ExpertWitness Person, natural person

objects
    PublicDocument: service
    NotarialInstrument: service
    Signature: service
    ExpertReport: service

article 1 Generated
    fact certification NotarialAuthentication is present
    fact certification DocumentFalsification is present
    claim Defendant may demand ExpertReport from Judge.
    obligation ExpertWitness must provide ExpertReport to Judge.
    rule DocumentChallengeRule
        If certification DocumentFalsification is present
        then Defendant may demand ExpertReport from Judge.
    procedure DocumentChallengeProcedure:
        Defendant provides PublicDocument to Judge.
        ExpertWitness provides Signature to Judge.
        ExpertWitness provides ExpertReport to Judge.