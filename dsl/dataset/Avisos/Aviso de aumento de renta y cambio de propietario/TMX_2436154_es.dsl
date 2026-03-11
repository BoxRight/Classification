law CódigoCivilPara
authority private

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    PreviousOwner: PreviousOwner Person, natural person

objects
    Property: nonmovable
    MonthlyRent: money
    RentDebt: money
    SecurityDeposit: money
    AdditionalDeposit: money

article 1 Generated
    fact Landlord owns Property
    fact asset LeaseContract is present
    fact liability RentDebt is present
    fact asset SecurityDeposit is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must pay RentDebt to Landlord.
    rule NonAcceptanceRule
        If Tenant fails to perform  to Landlord
        then Tenant must transfer Property to Landlord.