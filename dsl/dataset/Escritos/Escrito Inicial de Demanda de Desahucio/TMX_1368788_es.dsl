law EvictionDemand
authority judicial

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Judge: Judge Person, natural person

objects
    Property: nonmovable
    MonthlyRent: money
    Apartment: nonmovable

article 1 Generated
    fact Landlord owns Property
    fact asset LeaseContract is present
    fact liability RentArrears is present
    obligation Tenant must pay MonthlyRent to Landlord.
    claim Tenant may demand Apartment from Landlord.
    rule EvictionForNonpayment
        If asset LeaseContract is present and liability RentArrears is present
        then Tenant may demand Apartment from Landlord.