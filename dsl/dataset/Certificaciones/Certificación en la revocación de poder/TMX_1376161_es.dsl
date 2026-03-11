law LeyDelNotariado
authority administrative

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Principal: Principal Person, natural person
    Agent: Agent Person, natural person
    NotaryGranting: NotaryGranting Person, natural person
    NotaryRevoking: NotaryRevoking Person, natural person

objects
    PowerOfAttorney: service
    RevocationNotice: service

article 1 Generated
    fact certification PowerOfAttorneyExists is present
    fact certification RevocationExecuted is present
    obligation Principal must provide RevocationNotice to Agent.
    obligation Principal must provide RevocationNotice to NotaryGranting.
    obligation NotaryGranting must provide RevocationNotice to Principal.
    rule RevocationEffectivenessRule
        If certification RevocationExecuted is present
        then Principal must provide RevocationNotice to Agent.
    procedure PowerRevocationProcedure:
        Principal provides PowerOfAttorney to Agent.
        Principal provides RevocationNotice to Agent.
        Principal provides RevocationNotice to NotaryGranting.
        NotaryGranting provides RevocationNotice to Principal.