law ContratoSubarrendamientoFinca
authority private
enacted 2023-06-16

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Subarrendador: Subarrendador Person, natural person
    Subarrendatario: Subarrendatario Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    FincaRustica: nonmovable
    MonthlyRent: money
    SecurityDeposit: money
    PenaltyPayment: money

article 1 Generated
    fact asset SubleaseRelation is present
    fact asset OriginalLeaseAuthorization is present
    fact collateral FiadorProperty is present
    obligation Subarrendatario must pay MonthlyRent to Subarrendador.
    obligation Subarrendatario must transfer FincaRustica to Subarrendador.
    prohibition Subarrendatario must not transfer FincaRustica.
    rule RentPaymentObligation
        If asset SubleaseRelation is present
        then Subarrendatario must pay MonthlyRent to Subarrendador.
    procedure ContractExecution:
        Subarrendador transfers FincaRustica to Subarrendatario.
        Subarrendatario transfers FincaRustica to Subarrendador.