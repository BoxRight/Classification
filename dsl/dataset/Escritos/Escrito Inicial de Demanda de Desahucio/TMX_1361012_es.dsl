law EvictionDemand
authority judicial
enacted 2024-02-12

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    CivilJudge: CivilJudge Corp, legal person

objects
    RentalProperty: nonmovable
    MonthlyRent: money
    OverdueRent: money
    VatPayment: money
    LegalCosts: money

article 1 Generated
    fact Landlord owns RentalProperty
    fact asset LeaseContract is present
    fact liability RentDebt is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must pay VatPayment to Landlord.
    claim Landlord may demand RentalProperty from Tenant.
    rule EvictionRule
        If asset LeaseContract is present and Tenant fails to pay MonthlyRent to Landlord
        then Landlord may demand RentalProperty from Tenant.
    rule DamagesRule
        If Tenant fails to pay MonthlyRent to Landlord
        then Tenant must pay OverdueRent to Landlord.