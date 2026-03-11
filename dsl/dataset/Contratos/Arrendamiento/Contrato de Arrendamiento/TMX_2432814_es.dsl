law LeaseContract
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    EventVenue: nonmovable
    RentalPayment: money
    AdvancePayment: money
    SecurityDeposit: money
    VenueServices: service

article 1 Generated
    fact Landlord owns EventVenue
    fact asset LeaseRelation is present
    fact liability GuarantorLiability is present
    obligation Tenant must pay AdvancePayment to Landlord.
    obligation Tenant must pay RentalPayment to Landlord.
    obligation Landlord must provide VenueServices to Tenant.
    prohibition Tenant must not transfer EventVenue.
    rule PaymentScheduleRule
        If asset LeaseRelation is present
        then Tenant must pay AdvancePayment to Landlord.
    rule DamageLiabilityRule
        If Tenant fails to transfer EventVenue to Landlord
        then Tenant must pay SecurityDeposit to Landlord.
    rule GuarantorLiabilityRule
        If liability GuarantorLiability is present
        then Guarantor must pay RentalPayment to Landlord.
    procedure RentalPaymentProcess:
        Tenant pays AdvancePayment to Landlord.
        Tenant pays RentalPayment to Landlord.
    procedure EventCancellationProcess:
        Tenant transfers EventVenue to Landlord.