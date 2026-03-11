law LeaseContract
authority judicial
enacted 2024-03-11

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
    LegalFees: money

article 1 Generated
    fact Landlord owns LeasedProperty
    fact asset LeaseContract is present
    fact liability UnpaidRent is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must transfer LeasedProperty to Landlord.
    rule RescissionRule
        If asset LeaseContract is present and Tenant fails to pay MonthlyRent to Landlord
        then Landlord may demand LeasedProperty from Tenant.
    rule PaymentObligationRule
        If asset LeaseContract is present
        then Tenant must pay MonthlyRent to Landlord.
    procedure RescissionDemandProcedure:
        Tenant transfers LeasedProperty to Landlord.

scenario lease_breach_scenario:
    at lease_contract_signed
    at rent_payments_made
    at payment_breach
    at rescission_demand_filed