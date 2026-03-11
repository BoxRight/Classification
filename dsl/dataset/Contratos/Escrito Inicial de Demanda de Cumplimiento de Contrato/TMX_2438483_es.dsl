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
    LeasedProperty: nonmovable
    MonthlyRent: money
    UnpaidRent: money
    Damages: money
    CourtCosts: money

article 1 Generated
    fact Landlord owns LeasedProperty
    fact asset LeaseContract is present
    fact liability UnpaidRentDebt is present
    fact asset TacitRenewal is present
    obligation Tenant must pay MonthlyRent to Landlord.
    claim Landlord may demand MonthlyRent from Tenant.
    claim Landlord may demand LeasedProperty from Tenant.
    rule LeasePaymentObligation
        If asset LeaseContract is present
        then Tenant must pay MonthlyRent to Landlord.
    rule BreachConsequences
        If asset LeaseContract is present and Tenant fails to pay MonthlyRent to Landlord
        then Landlord may demand LeasedProperty from Tenant.
    rule ContractRescission
        If asset LeaseContract is present and liability UnpaidRentDebt is present
        then Landlord may demand LeasedProperty from Tenant.