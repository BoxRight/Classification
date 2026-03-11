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
    Garantia: money
    PenaltyFee: money

article 1 Generated
    fact asset ContratoArrendamiento is present
    fact Landlord owns Property
    fact liability FianzaGarantia is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must transfer Property to Landlord.
    prohibition Tenant must not transfer Property.
    obligation Tenant must perform Servicios to PrestadoresServicios.
    rule PenaPorFaltaPago
        If Tenant fails to pay MonthlyRent to Landlord
        then Tenant must pay PenaltyFee to Landlord.
    procedure TerminacionVoluntaria:
        Arrendatario performs Inmueble to Arrendador.