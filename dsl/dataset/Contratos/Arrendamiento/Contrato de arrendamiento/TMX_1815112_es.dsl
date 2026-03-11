law LeaseContract
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlords: Landlords Person, natural person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    Apartment: nonmovable
    MonthlyRent: money
    SecurityDeposit: money
    LateFee: money
    PenaltyPayment: money
    ElectricityService: service
    WaterService: service

article 1 Generated
    fact Landlords owns Apartment
    fact asset LeaseAgreement is present
    obligation Landlords must transfer Apartment to Tenant.
    obligation Tenant must pay MonthlyRent to Landlords.
    obligation Tenant must pay SecurityDeposit to Landlords.
    obligation Tenant must transfer Apartment to Landlords.
    rule LatePaymentPenalty
        If Tenant fails to pay MonthlyRent to Landlords
        then Tenant must pay LateFee to Landlords.
    rule DepositReturn
        If asset ContractExpiration is present
        then Landlords must pay SecurityDeposit to Tenant.
    rule PenaltyForBreach
        If asset ContractTermination is present
        then Tenant must pay PenaltyPayment to Landlords.