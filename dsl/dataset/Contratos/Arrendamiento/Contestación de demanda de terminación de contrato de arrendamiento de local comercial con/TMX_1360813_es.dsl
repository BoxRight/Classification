law LeaseContract
authority judicial
enacted 2024-01-23

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Actor: Actor Person, natural person
    Defendant: Defendant Person, natural person

objects
    LocalComercial: nonmovable
    MonthlyRent: money
    ReciboPago: service

article 1 Generated
    fact asset ContratoArrendamiento is present
    fact liability PagoRentaVencida is present
    obligation Defendant must pay MonthlyRent to Actor.
    claim Actor may demand LocalComercial from Defendant.
    rule IncumplimientoPago
        If asset ContratoArrendamiento is present and Defendant fails to pay MonthlyRent to Actor
        then Actor may demand LocalComercial from Defendant.