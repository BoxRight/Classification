law CódigoCivilPara
authority judicial

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    FormerTenant: FormerTenant Person, natural person
    FormerOwner: FormerOwner Person, natural person

objects
    Property: nonmovable
    MonthlyRent: money
    LegalCosts: money

article 1 Generated
    fact Plaintiff owns Property
    fact certification PropertyRegistration is present
    fact asset LeaseContract is present
    claim Defendant may demand Property from Plaintiff.
    obligation Defendant must pay LegalCosts to Plaintiff.

scenario property_dispute_timeline:
    at plaintiff_acquired_property
    at lease_contract_established
    at tenant_abandoned_property
    at defendant_unlawful_occupation
    at extrajudicial_attempts_failed
    at lawsuit_filed