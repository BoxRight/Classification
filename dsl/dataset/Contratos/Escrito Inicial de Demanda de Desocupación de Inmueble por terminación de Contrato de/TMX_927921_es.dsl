law LeaseContract
authority judicial
enacted 2024-10-07

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person
    Judge: Judge Person, natural person

objects
    Property: nonmovable
    MonthlyRent: money
    UnpaidRent: money
    Damages: money
    LegalCosts: money
    Utilities: money

article 1 Generated
    fact asset LeaseContract is present
    fact liability RentDebt is present
    fact Landlord owns Property
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must transfer Property to Landlord.
    rule EvictionRule
        If liability ContractTermination is present
        then Tenant must transfer Property to Landlord.
    rule DebtPaymentRule
        If liability RentDebt is present
        then Tenant must pay UnpaidRent to Landlord.
    rule DamagesRule
        If liability ContractTermination is present
        then Tenant must pay Damages to Landlord.
    procedure EvictionProceeding:
        Tenant transfers Property to Landlord.
        Tenant pays UnpaidRent to Landlord.
        Tenant pays Damages to Landlord.
        Tenant pays LegalCosts to Landlord.