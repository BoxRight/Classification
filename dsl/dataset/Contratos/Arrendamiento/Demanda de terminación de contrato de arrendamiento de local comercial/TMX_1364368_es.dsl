law LeaseContract
authority judicial
enacted 2017-12-21

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Judge: Judge Corp, legal person

objects
    CommercialProperty: nonmovable
    MonthlyRent: money
    LegalCosts: money

article 1 Generated
    fact asset LeaseContract is present
    fact certification TerminationNoticeReceived is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must transfer CommercialProperty to Landlord.
    claim Landlord may demand CommercialProperty from Tenant.
    rule LeaseTerminationRule
        If certification TerminationNoticeReceived is present and Tenant fails to transfer CommercialProperty to Landlord
        then Tenant must transfer CommercialProperty to Landlord.
    rule CostsPaymentRule
        If Tenant fails to transfer CommercialProperty to Landlord
        then Tenant must pay LegalCosts to Landlord.
    procedure LeaseTerminationProcedure:
        Landlord transfers CommercialProperty to Tenant.