law SaleContract
authority administrative
enacted 2024-01-12

vocabulary
    verb transfer: transfer

parties
    Notary: Notary Corp, legal person
    Enajenante: Enajenante Person, natural person
    Tenant: Tenant Person, natural person

objects
    Property: nonmovable
    LeaseContract: service
    Damages: money

article 1 Generated
    fact certification PropertyNotLeased is present
    fact Enajenante owns Property
    obligation Enajenante must perform PropertyNotLeased to Notary.
    claim Tenant may demand Property from Enajenante.
    rule NotaryKnowledgeSanction
        If asset LeaseContract is present and certification NotaryKnowledge is present
        then Notary must fail Sanction to Authority.