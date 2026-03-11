law LeaseContract
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    Property: nonmovable
    MonthlyRent: money
    Vat: money
    SecurityDeposit: money
    Utilities: service
    InsuranceBond: service

article 1 Generated
    fact Landlord owns Property
    fact asset LeaseRelation is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must pay Vat to Landlord.
    obligation Tenant must pay SecurityDeposit to Landlord.
    prohibition Tenant must not transfer Property.
    prohibition Tenant must not transfer Property.
    obligation Tenant must provide Utilities to ServiceProviders.
    obligation Tenant must provide InsuranceBond to InsuranceCompany.
    obligation Tenant must transfer Property to Landlord.
    rule LeasePaymentRule
        If asset LeaseRelation is present
        then Tenant must pay MonthlyRent to Landlord.
    rule ContractBreachPenalty
        If Tenant fails to perform ContractualObligations to Landlord
        then Tenant must perform PenaltyPayment to Landlord.
    procedure PropertyModificationProcedure:
        Landlord provides written authorization.