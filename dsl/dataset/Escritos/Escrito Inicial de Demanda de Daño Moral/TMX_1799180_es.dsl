law CódigoCivilDel
authority judicial

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    Juez: Juez Corp, legal person

objects
    DanoMoralCompensation: money
    IndirectDamages: money
    LegalCosts: money
    SentencePublication: service

article 1 Generated
    fact liability MoralDamageObligation is present
    fact asset ReputationDamage is present
    fact asset FinancialLoss is present
    fact asset EmotionalDistress is present
    obligation Defendant must pay DanoMoralCompensation to Plaintiff.
    obligation Defendant must pay IndirectDamages to Plaintiff.
    obligation Defendant must provide SentencePublication to Public.
    obligation Defendant must pay LegalCosts to Plaintiff.
    rule CompensationPaymentRule
        If liability MoralDamageObligation is present
        then Defendant must pay DanoMoralCompensation to Plaintiff.
    rule IndirectDamagesRule
        If asset FinancialLoss is present and liability MoralDamageObligation is present
        then Defendant must pay IndirectDamages to Plaintiff.
    rule PublicationRule
        If liability MoralDamageObligation is present
        then Defendant must provide SentencePublication to Public.