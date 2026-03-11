law DemandaUsucapiónCódigo
authority judicial

vocabulary
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    VerbalSeller: VerbalSeller Person, natural person

objects
    ImmovableProperty: nonmovable
    PurchasePrice: money
    PropertyTaxes: money
    PropertyImprovements: service

article 1 Generated
    fact Defendant owns ImmovableProperty
    fact asset GoodFaithPossession is present
    fact asset ContinuousPossession is present
    fact asset PublicPossession is present
    fact asset UninterruptedPossession is present
    claim Plaintiff may demand ImmovableProperty.

scenario adverse_possession_timeline:
    at verbal_sale_contract
    at payment_of_purchase_price
    at begin_peaceful_possession
    at continuous_possession_over_prescribed_years
    at file_usucaption_lawsuit