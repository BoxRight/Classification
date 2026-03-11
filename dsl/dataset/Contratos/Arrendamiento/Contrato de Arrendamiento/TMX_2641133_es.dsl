law LeaseContract
authority private
enacted 2024-01-18

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Corp, legal person
    Guarantor: Guarantor Corp, legal person

objects
    CommercialProperty: nonmovable
    MonthlyRent: money
    SecurityDeposit: money
    InsuranceCoverage: service

article 1 Generated
    fact Landlord owns CommercialProperty
    fact asset LeaseRelation is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must provide InsuranceCoverage to Tenant.
    obligation Tenant must transfer CommercialProperty to Landlord.
    prohibition Tenant must not transfer CommercialProperty.
    obligation Guarantor must pay MonthlyRent to Landlord.
    rule RentPaymentRule
        If asset LeaseRelation is present
        then Tenant must pay MonthlyRent to Landlord.
    rule LatePaymentPenalty
        If Tenant fails to pay MonthlyRent to Landlord
        then Tenant must perform Money to Landlord.
    rule EarlyTerminationPenalty
        If Tenant fails to transfer CommercialProperty to Landlord
        then Tenant must perform Money to Landlord.
    rule GuarantorSolidarityRule
        If asset LeaseRelation is present
        then Guarantor must pay MonthlyRent to Landlord.