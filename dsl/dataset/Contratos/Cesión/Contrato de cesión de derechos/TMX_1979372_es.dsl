law ContratoCesiónDerechos
authority private
enacted 2024-04-29

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Assignor: Assignor Person, natural person
    Cesionarios: Cesionarios Person, natural person
    Tenant: Tenant Person, natural person

objects
    DerechosRentas: service
    Rentas: money
    EdificioFinca: nonmovable
    Impuestos: money

article 1 Generated
    fact asset CesionDerechos is present
    fact asset ContratoArrendamiento is present
    obligation Assignor must provide DerechosRentas to Cesionarios.
    privilege Cesionarios may pay Rentas to Tenant.
    obligation Assignor must provide DerechosRentas to Tenant.
    obligation Cesionarios must pay Impuestos to Assignor.
    rule CesionGratuitaRule
        If asset CesionDerechos is present
        then Cesionarios may pay Rentas to Tenant.
    procedure ProcesoCesion:
        Cedente provides DerechosRentas to Cesionarios.
        Assignor provides DerechosRentas to Tenant.
        Cesionarios pays Rentas to Tenant.