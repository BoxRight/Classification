law LeaseDemand
authority judicial
enacted 2024-02-08

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Tenant: Tenant Person, natural person
    Landlord: Landlord Person, natural person
    Judge: Judge Corp, legal person

objects
    LeaseContract: service
    Property: nonmovable
    MonthlyRent: money
    LegalCosts: money

article 1 Generated
    fact Tenant owns Property
    fact asset CurrentRentPayments is present
    fact asset PunctualPaymentHistory is present
    claim Landlord may demand LeaseContract from Tenant.
    claim Landlord may demand LegalCosts from Tenant.
    rule LeaseExtensionRight
        If asset PunctualPaymentHistory is present and asset CurrentRentPayments is present
        then Landlord may demand LeaseContract from Tenant.