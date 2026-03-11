law ContratoSubarrendamientoFinca
authority private
enacted 2024-07-12

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Sublandlord: Sublandlord Person, natural person
    Subtenant: Subtenant Corp, legal person
    Guarantor: Guarantor Person, natural person

objects
    UrbanProperty: nonmovable
    MonthlyRent: money
    Deposit: money
    PenaltyPayment: money
    UtilityServices: service

article 1 Generated
    fact asset SubleaseRelation is present
    fact Sublandlord owns UrbanProperty
    fact certification LegalCapacity is present
    fact certification LegalCapacity is present
    fact certification OwnerAuthorization is present
    fact collateral GuarantorProperty is present
    obligation Subtenant must pay MonthlyRent to Sublandlord.
    obligation Subtenant must transfer UrbanProperty to Sublandlord.
    obligation Subtenant must provide UtilityServices.
    prohibition Subtenant must not transfer UrbanProperty.
    obligation Guarantor must pay MonthlyRent to Sublandlord.
    rule RentPaymentRule
        If asset SubleaseRelation is present
        then Subtenant must pay MonthlyRent to Sublandlord.
    rule LatePaymentPenalty
        If Subtenant fails to pay MonthlyRent to Sublandlord
        then Subtenant must pay PenaltyPayment to Sublandlord.
    rule GuarantorLiabilityRule
        If asset SubleaseRelation is present and Subtenant fails to pay MonthlyRent to Sublandlord
        then Guarantor must pay MonthlyRent to Sublandlord.
    procedure ContractExecution:
        Sublandlord transfers UrbanProperty to Subtenant.
        Subtenant pays Deposit to Sublandlord.
        Subtenant pays MonthlyRent to Sublandlord.
    procedure ContractTermination:
        Subtenant transfers UrbanProperty to Sublandlord.
        Sublandlord pays Deposit to Subtenant.