law RentPaymentDemand
authority judicial
enacted 2024-02-15

vocabulary
    verb pay: pay

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    RentalProperty: nonmovable
    MonthlyRent: money
    UnpaidRents: money
    LegalCosts: money

article 1 Generated
    fact asset LeaseContract is present
    fact liability GuaranteeObligation is present
    fact asset PropertyVacated is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Guarantor must pay UnpaidRents to Landlord.
    claim Landlord may demand UnpaidRents from Guarantor.
    rule GuaranteeLiabilityRule
        If asset LeaseContract is present and liability GuaranteeObligation is present and Tenant fails to pay MonthlyRent to Landlord
        then Guarantor must pay UnpaidRents to Landlord.

scenario rent_default_scenario:
    at lease_execution
    at tenant_vacated_property
    at rent_payment_default
    at judicial_claim_filed