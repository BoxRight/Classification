law EvictionDemand
authority judicial
enacted 2024-02-06

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    CivilJudge: CivilJudge Corp, legal person

objects
    Apartment: nonmovable
    MonthlyRent: money
    LegalCosts: money

article 1 Generated
    fact asset LeaseContract is present
    fact liability UnpaidRent is present
    obligation Tenant must pay MonthlyRent to Landlord.
    rule RentPaymentObligation
        If asset LeaseContract is present
        then Tenant must pay MonthlyRent to Landlord.