law ContratoSubarrendamientoFinca
authority private
enacted 2023-06-16

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Subarrendador: Subarrendador Person, natural person
    Subarrendatario: Subarrendatario Person, natural person
    Guarantor: Guarantor Person, natural person
    Landlord: Landlord Person, natural person

objects
    FincaUrbana: nonmovable
    MonthlyRent: money
    Deposit: money
    Penalty: money
    Interest: money
    UtilityServices: service

article 1 Generated
    fact asset SubleaseRelation is present
    fact Landlord owns FincaUrbana
    fact certification OwnerAuthorization is present
    fact collateral GuarantorProperty is present
    obligation Subarrendatario must pay MonthlyRent to Subarrendador.
    obligation Subarrendador must transfer FincaUrbana to Subarrendatario.
    obligation Subarrendatario must transfer FincaUrbana to Subarrendador.
    obligation Subarrendatario must provide UtilityServices to Subarrendador.
    obligation Subarrendatario must transfer FincaUrbana to Subarrendador.
    prohibition Subarrendatario must not transfer FincaUrbana.
    obligation Guarantor must pay MonthlyRent to Subarrendador.
    rule RentPaymentRule
        If asset SubleaseRelation is present
        then Subarrendatario must pay MonthlyRent to Subarrendador.
    rule LatePaymentPenalty
        If Subarrendatario fails to pay MonthlyRent to Subarrendador
        then Subarrendatario must pay Interest to Subarrendador.
    procedure ContractExecution:
        Subarrendador transfers FincaUrbana to Subarrendatario.
        Subarrendatario pays MonthlyRent to Subarrendador.
        Subarrendatario transfers FincaUrbana to Subarrendador.
    procedure TerminationProcess:
        Subarrendatario transfers FincaUrbana to Subarrendador.