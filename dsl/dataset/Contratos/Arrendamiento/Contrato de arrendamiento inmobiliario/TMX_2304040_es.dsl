law LeaseContract
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    Property: nonmovable
    MonthlyRent: money
    SecurityDeposit: money
    UtilityPayments: money
    PenaltyFee: money

article 1 Generated
    fact asset LeaseRelation is present
    fact Landlord owns Property
    fact liability RentDebt is present
    fact collateral GuarantorProperty is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must pay UtilityPayments to Landlord.
    obligation Landlord must transfer Property to Tenant.
    prohibition Tenant must not transfer Property.
    rule RentPaymentRule
        If asset LeaseRelation is present
        then Tenant must pay MonthlyRent to Landlord.
    rule BreachPenaltyRule
        If Tenant fails to pay MonthlyRent to Landlord
        then Tenant must pay PenaltyFee to Landlord.
    rule TerminationRule
        If Tenant fails to pay MonthlyRent to Landlord
        then Landlord may demand Property from Tenant.
    rule GuarantorLiabilityRule
        If Tenant fails to pay MonthlyRent to Landlord
        then Guarantor must pay MonthlyRent to Landlord.
    procedure ContractExecution:
        Landlord transfers Property to Tenant.
        Tenant pays SecurityDeposit to Landlord.
        Tenant pays MonthlyRent to Landlord.
    procedure ContractTermination:
        Tenant transfers Property to Landlord.