law LeaseContract
authority judicial
enacted 2024-04-05

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    TenantSpouse: TenantSpouse Person, natural person
    Judge: Judge Corp, legal person

objects
    RentalProperty: nonmovable
    MonthlyRent: money
    LeaseContract: service

article 1 Generated
    fact Landlord owns RentalProperty
    fact asset LeaseRelation is present
    fact liability RentPaymentObligation is present
    obligation Tenant must pay MonthlyRent to Landlord.
    claim Landlord may demand LeaseContract from Tenant.
    procedure VoluntaryJurisdictionNotification:
        Judge provides LeaseContract to Tenant.

scenario lease_termination_scenario:
    at lease_contract_signed
    at tenant_abandons_property
    at failed_communication_attempts
    at judicial_notification_request