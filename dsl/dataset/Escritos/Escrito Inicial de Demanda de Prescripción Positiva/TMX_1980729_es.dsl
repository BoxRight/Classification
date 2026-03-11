law AdversePossessionDemand
authority judicial
enacted 2024-03-11

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    PropertyRegistryDirector: PropertyRegistryDirector Corp, legal person

objects
    ImmovableProperty: nonmovable
    PropertyTitle: service
    PurchasePrice: money
    LegalCosts: money
    PropertyTaxes: money
    UtilityServices: service

article 1 Generated
    fact Defendant owns ImmovableProperty
    fact asset PropertyPossession is present
    fact certification PropertyRegistration is present
    claim Plaintiff may demand PropertyTitle from Defendant.
    claim Plaintiff may demand PropertyTitle from PropertyRegistryDirector.
    claim Plaintiff may demand LegalCosts from Defendant.
    claim Plaintiff may demand LegalCosts from PropertyRegistryDirector.
    rule AdversePossessionRule
        If asset PropertyPossession is present
        then Plaintiff may demand PropertyTitle from Defendant.