law ContratoComodatoVehículo
authority private
enacted 2024-01-30

vocabulary
    verb transfer: transfer

parties
    Comodante: Comodante Person, natural person
    Comodatario: Comodatario Corp, legal person

objects
    Vehicle: movable
    PenaltyAmount: money

article 1 Generated
    fact asset ComodatoRelation is present
    obligation Comodatario must transfer Vehicle to Comodante.
    obligation Comodatario must transfer Vehicle.
    prohibition Comodatario must not transfer Vehicle.
    rule DeliveryRule
        If asset ComodatoRelation is present
        then Comodante must transfer Vehicle to Comodatario.
    rule TransferProhibitionRule
        If asset ComodatoRelation is present
        then Comodatario must not transfer Vehicle.
    rule PenaltyRule
        If Comodatario fails to transfer Vehicle to Comodante
        then Comodatario must pay PenaltyAmount to Comodante.
    procedure ContractTermination:
        Comodatario transfers Vehicle to Comodante.