law LeaseContract
authority private
enacted 2024-01-30

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Corp, legal person
    Tenant: Tenant Person, natural person

objects
    Vehiculo: movable
    MonthlyRent: money

article 1 Generated
    fact asset ContratoArrendamiento is present
    obligation Landlord must transfer Vehiculo to Tenant.
    obligation Tenant must pay MonthlyRent to Landlord.
    rule ArrendamientoVehiculoRule
        If asset ContratoArrendamiento is present
        then Landlord must transfer Vehiculo to Tenant.
    rule PagoRentaRule
        If asset ContratoArrendamiento is present
        then Tenant must pay MonthlyRent to Landlord.