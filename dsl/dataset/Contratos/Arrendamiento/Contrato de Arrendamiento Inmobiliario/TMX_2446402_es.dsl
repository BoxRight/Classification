law LeaseContract
authority private
enacted 2024-02-13

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    ResidentialProperty: nonmovable
    MonthlyRent: money
    PenaltyPayment: money
    UtilityServices: service

article 1 Generated
    fact asset LeaseRelation is present
    fact Landlord owns ResidentialProperty
    fact liability GuaranteeObligation is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must provide UtilityServices to Tenant.
    prohibition Tenant must not transfer ResidentialProperty.
    obligation Tenant must transfer ResidentialProperty to Landlord.
    rule RentPaymentObligation
        If asset LeaseRelation is present
        then Tenant must pay MonthlyRent to Landlord.
    rule EarlyTerminationPenalty
        If Tenant transfers ResidentialProperty
        then Tenant must pay PenaltyPayment to Landlord.
    rule HoldoverPenalty
        If Tenant transfers ResidentialProperty
        then Tenant must pay PenaltyPayment to Landlord.
    procedure RentPaymentProcedure:
        Tenant pays MonthlyRent to Landlord.
    procedure EarlyTerminationProcedure:
        Tenant transfers ResidentialProperty to Landlord.