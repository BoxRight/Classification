law ContratoSubarrendamientoLocal
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
    LocalComercial: nonmovable
    MonthlyRent: money
    Deposit: money
    Servicios: service
    InmuebleGarantia: nonmovable

article 1 Generated
    fact asset RelacionSubarrendamiento is present
    fact asset AutorizacionPropietario is present
    fact Guarantor owns LocalComercial
    fact asset ContratoArrendamientoOriginal is present
    obligation Subarrendatario must pay MonthlyRent to Subarrendador.
    obligation Subarrendatario must transfer LocalComercial to Subarrendador.
    obligation Subarrendatario must provide Servicios.
    obligation Guarantor must pay MonthlyRent to Subarrendador.
    prohibition Subarrendatario must not transfer LocalComercial.
    rule ObligacionRenta
        If asset RelacionSubarrendamiento is present
        then Subarrendatario must pay MonthlyRent to Subarrendador.
    procedure ProcesoSubarrendamiento:
        Subarrendador transfers LocalComercial to Subarrendatario.
        Subarrendatario pays MonthlyRent to Subarrendador.
        Subarrendatario provides Servicios.
        Subarrendatario transfers LocalComercial to Subarrendador.