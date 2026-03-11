law LeaseContract
authority judicial
enacted 2024-04-23

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Court: Court Corp, legal person

objects
    Property: nonmovable
    Rent: money
    Keys: movable

article 1 Generated
    fact Landlord owns Property
    fact asset LeaseRelation is present
    fact liability RentDebt is present
    obligation Tenant must pay Rent to Landlord.
    obligation Tenant must transfer Property to Landlord.
    rule VacateOnTerminationRule
        If liability ContractBreach is present
        then Tenant must transfer Property to Landlord.
    procedure LeaseTerminationProcedure:
        Court transfers Property to Tenant.

scenario lease_termination_scenario:
    at verbal lease agreement established
    at tenant stops paying rent
    at landlord notifies termination through court
    at tenant refuses to vacate after sixty day notice
    at judicial demand filed for property vacation