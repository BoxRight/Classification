law CódigoCivilPara
authority judicial

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Judge: Judge Person, natural person

objects
    LeasedProperty: nonmovable
    MonthlyRent: money
    LeaseContract: service

article 1 Generated
    fact asset LeaseRelation is present
    fact Landlord owns LeasedProperty
    obligation Tenant must pay MonthlyRent to Landlord.
    claim Landlord may demand LeaseContract from Tenant.
    procedure LeaseTerminationNotification:
        Tenant fail LeaseContract to Landlord.
        Landlord provides LeaseContract to Tenant.