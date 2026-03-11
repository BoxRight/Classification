law LeaseContract
authority private
enacted 2024-02-19

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    FincaRustica: nonmovable
    RentaSemestral: money
    FrutosAgricolas: movable
    SeguroResponsabilidad: service
    Penalizacion: money

article 1 Generated
    fact Landlord owns FincaRustica
    fact asset ContratoArrendamiento is present
    fact collateral GarantiaFiador is present
    obligation Tenant must pay RentaSemestral to Landlord.
    obligation Tenant must transfer FincaRustica.
    obligation Tenant must provide SeguroResponsabilidad.
    prohibition Tenant must not transfer FincaRustica.
    privilege Landlord may transfer FincaRustica.
    obligation Tenant must transfer FincaRustica to Landlord.