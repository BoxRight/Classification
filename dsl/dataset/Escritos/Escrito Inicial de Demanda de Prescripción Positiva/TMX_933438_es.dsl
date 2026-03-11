law AdversePossessionDemand
authority judicial
enacted 2024-02-12

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant1: Defendant1 Person, natural person
    Defendant2: Defendant2 Person, natural person
    PropertyRegistryDirector: PropertyRegistryDirector Corp, legal person
    OriginalSeller: OriginalSeller Person, natural person
    IntermediateSeller: IntermediateSeller Person, natural person

objects
    PropertyLot: nonmovable
    Truck: movable
    OriginalDeed: service
    LegalCosts: money

article 1 Generated
    fact Plaintiff owns PropertyLot
    fact asset PropertyTitle is present
    fact certification PropertyRegistration is present
    claim Plaintiff may demand PropertyLot from PropertyRegistryDirector.
    obligation Defendant1 must pay LegalCosts to Plaintiff.

scenario property_acquisition_timeline:
    at Original sale contract executed
    at Property resold to plaintiff
    at Plaintiff takes possession
    at Continuous peaceful possession begins
    at Prescription period completed