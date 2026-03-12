law LeaseContract
authority private
enacted 2024-02-14

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Landlord: Landlord Corp, legal person
    Tenant: Tenant Corp, legal person
    Guarantor: Guarantor Corp, legal person

objects
    CommercialPremises: nonmovable
    MonthlyRent: money
    Utilities: service

article 1 Generated
    fact asset LeaseRelation is present
    fact Landlord owns CommercialPremises
    fact collateral GuaranteeProperty is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must provide Utilities to Tenant.
    prohibition Tenant must not transfer CommercialPremises.
    obligation Tenant must transfer CommercialPremises to Landlord.
    obligation Guarantor must pay MonthlyRent to Landlord.
    rule RentPaymentRule
        If asset LeaseRelation is present
        then Tenant must pay MonthlyRent to Landlord.
    procedure LeaseExecution:
        Landlord transfers CommercialPremises to Tenant.
        Tenant pays MonthlyRent to Landlord.
    procedure LeaseTermination:
        Tenant transfers CommercialPremises to Landlord.