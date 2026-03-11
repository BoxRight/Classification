law LeaseDemand
authority judicial

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person

objects
    RentalProperty: nonmovable
    MonthlyRent: money
    LegalCosts: money

article 1 Generated
    fact asset LeaseContract is present
    fact liability UnpaidRent is present
    obligation Tenant must pay MonthlyRent to Landlord.
    rule LeaseRescissionRule
        If asset LeaseContract is present and Tenant fails to pay MonthlyRent to Landlord
        then Tenant must transfer RentalProperty to Landlord.
    rule LegalCostsRule
        If asset LeaseContract is present and Tenant fails to pay MonthlyRent to Landlord
        then Tenant must pay LegalCosts to Landlord.
    procedure LeaseTerminationLawsuit:
        Tenant transfers RentalProperty to Landlord.
        Tenant pays LegalCosts to Landlord.