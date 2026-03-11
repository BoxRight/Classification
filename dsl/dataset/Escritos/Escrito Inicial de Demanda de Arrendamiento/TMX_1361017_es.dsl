law LeaseDemand
authority judicial
enacted 2024-02-08

vocabulary
    verb pay: pay

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Court: Court Corp, legal person

objects
    RentalProperty: nonmovable
    MonthlyRent: money
    LeaseContract: service

article 1 Generated
    fact asset LeaseContract is present
    fact liability RentPaymentObligation is present
    fact Landlord owns RentalProperty
    obligation Tenant must pay MonthlyRent to Landlord.
    claim Landlord may demand MonthlyRent from Tenant.
    procedure LeaseRescissionProcedure:
        Court provides LeaseContract to Tenant.
        Tenant transfers RentalProperty to Landlord.