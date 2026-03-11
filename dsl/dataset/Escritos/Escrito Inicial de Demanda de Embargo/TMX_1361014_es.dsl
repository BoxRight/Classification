law LeaseContract
authority judicial
enacted 2024-02-06

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person

objects
    CommercialProperty: nonmovable
    MonthlyRent: money
    PenaltyFee: money
    IncreasedRent: money
    LegalCosts: money

article 1 Generated
    fact asset LeaseContract is present
    fact liability UnpaidRent is present
    fact liability PenaltyPayment is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must transfer CommercialProperty to Landlord.
    rule PenaltyRule
        If Tenant fails to pay MonthlyRent to Landlord
        then Tenant must pay PenaltyFee to Landlord.
    rule IncreasedRentRule
        If Tenant fails to transfer CommercialProperty to Landlord
        then Tenant must pay IncreasedRent to Landlord.