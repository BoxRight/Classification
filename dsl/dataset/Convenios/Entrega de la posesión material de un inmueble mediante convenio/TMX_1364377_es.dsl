law EntregaPosesiónMaterial
authority private
enacted 2024-02-06

vocabulary
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person

objects
    Property: nonmovable

article 1 Generated
    fact asset LeaseRelation is present
    fact asset LegalCapacity is present
    fact asset LegalCapacity is present
    fact asset GoodCondition is present
    obligation Tenant must transfer Property to Landlord.
    rule PossessionDeliveryRule
        If asset LeaseRelation is present
        then Tenant must transfer Property to Landlord.
    procedure PossessionDeliveryProcedure:
        Tenant transfers Property to Landlord.
        Landlord transfers Property to Tenant.