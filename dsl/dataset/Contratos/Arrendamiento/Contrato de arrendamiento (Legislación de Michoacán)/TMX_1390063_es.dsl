law LeaseContract
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Landlord: Landlord Corp, legal person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    Property: nonmovable
    MonthlyRent: money
    SecurityDeposit: money
    MaintenanceFee: money
    FireInsurance: service
    Utilities: service

article 1 Generated
    fact asset LeaseRelation is present
    fact certification ProperPropertyCondition is present
    obligation Landlord must transfer Property to Tenant.
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must transfer Property to Landlord.
    obligation Tenant must pay MaintenanceFee to Landlord.
    obligation Tenant must provide Utilities to Tenant.
    obligation Tenant must provide FireInsurance to Landlord.
    prohibition Tenant must not transfer Property.
    rule RentPaymentRule
        If asset LeaseRelation is present
        then Tenant must pay MonthlyRent to Landlord.
    procedure LeaseExecution:
        Landlord transfers Property to Tenant.
        Tenant pays MonthlyRent to Landlord.
        Tenant provides FireInsurance to Landlord.
    procedure LeaseTermination:
        Tenant transfers Property to Landlord.