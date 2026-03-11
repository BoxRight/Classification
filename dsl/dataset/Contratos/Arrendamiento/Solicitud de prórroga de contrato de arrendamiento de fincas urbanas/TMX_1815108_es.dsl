law LeaseContract
authority judicial
enacted 2021-04-26

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Tenant: Tenant Person, natural person
    Landlord: Landlord Person, natural person

objects
    Property: nonmovable
    MonthlyRent: money
    LeaseContract: service

article 1 Generated
    fact Tenant owns Property
    fact asset CurrentRentPayments is present
    fact certification LegalRequirementsCompliance is present
    claim Tenant may demand LeaseContract from Landlord.
    obligation Tenant must pay MonthlyRent to Landlord.
    rule LeaseExtensionRight
        If asset CurrentRentPayments is present and certification LegalRequirementsCompliance is present
        then Tenant may demand LeaseContract from Landlord.