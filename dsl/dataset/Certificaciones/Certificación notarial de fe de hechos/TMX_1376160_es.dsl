law LeyDelNotariado
authority administrative

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Notary: Notary Person, natural person
    PropertyOwner: PropertyOwner Person, natural person
    Possessor: Possessor Person, natural person
    Requester: Requester Person, natural person

objects
    Property: nonmovable
    TestimonyDocument: service
    LeaseContract: service

article 1 Generated
    fact certification NotarialProcedure is present
    fact PropertyOwner owns Property
    obligation Notary must provide TestimonyDocument to Requester.
    rule NotaryIdentificationRule
        If certification NotarialProcedure is present
        then Notary must provide TestimonyDocument to Requester.
    procedure NotarialCertificationProcedure:
        Notary provides TestimonyDocument to Requester.
        Notary provides TestimonyDocument to Requester.
        PropertyOwner transfers Property to Notary.
        Notary transfers Property to PropertyOwner.