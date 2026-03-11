law ContratoHospedaje(legislación
authority private
enacted 2018-07-26

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Propietaria: Propietaria Person, natural person
    Huesped: Huesped Person, natural person

objects
    CasaHabitacion: nonmovable
    MonthlyRent: money
    Deposit: money
    Utilities: service
    Furniture: movable
    Keys: movable
    Equipaje: movable

article 1 Generated
    fact Propietaria owns CasaHabitacion
    fact asset HospedajeRelation is present
    fact liability SecurityDeposit is present
    obligation Huesped must pay MonthlyRent to Propietaria.
    obligation Huesped must transfer CasaHabitacion to Propietaria.
    prohibition Huesped must not transfer CasaHabitacion.
    obligation Huesped must provide Utilities to Propietaria.
    rule LatePaymentPenalty
        If Huesped fails to pay MonthlyRent to Propietaria
        then Propietaria may demand CasaHabitacion from Huesped.
    rule DamageLiability
        If asset HospedajeRelation is present
        then Huesped must transfer Furniture to Propietaria.
    rule BaggageRetention
        If Huesped fails to pay MonthlyRent to Propietaria
        then Propietaria may demand Equipaje from Huesped.
    procedure ContractTermination:
        Propietaria transfers CasaHabitacion to Huesped.