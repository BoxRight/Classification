law DiligenciaEntregaPosesión
authority administrative
enacted 2024-02-06

vocabulary
    verb transfer: transfer

parties
    Actor: Actor Person, natural person
    Defendant: Defendant Person, natural person
    CourtClerk: CourtClerk Person, natural person
    Judge: Judge Person, natural person

objects
    LeasedProperty: nonmovable
    DefendantsBelongings: movable

article 1 Generated
    fact Actor owns LeasedProperty
    fact certification JudicialOrder is present
    obligation Defendant must transfer LeasedProperty to Actor.
    rule PossessionDeliveryRule
        If certification JudicialOrder is present
        then Defendant must transfer LeasedProperty to Actor.
    procedure PossessionDeliveryProcedure:
        Defendant transfers LeasedProperty to Actor.
        Actor transfers LeasedProperty to Actor.