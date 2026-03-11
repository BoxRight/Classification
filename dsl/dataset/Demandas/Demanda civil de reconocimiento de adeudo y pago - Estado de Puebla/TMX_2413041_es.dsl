law DemandaCivilReconocimiento
authority judicial
enacted 2022-04-29

vocabulary
    verb pay: pay

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person

objects
    PrincipalDebt: money
    OrdinaryInterests: money
    MoratoryInterests: money
    LegalCosts: money

article 1 Generated
    fact liability ContractualDebt is present
    fact liability PaymentDefault is present
    claim Defendant may demand PrincipalDebt from Plaintiff.
    claim Defendant may demand OrdinaryInterests from Plaintiff.
    claim Defendant may demand MoratoryInterests from Plaintiff.
    claim Defendant may demand LegalCosts from Plaintiff.
    rule MoratoryInterestRule
        If liability PaymentDefault is present
        then Defendant must pay MoratoryInterests to Plaintiff.
    rule OrdinaryInterestRule
        If liability ContractualDebt is present
        then Defendant must pay OrdinaryInterests to Plaintiff.