law DenunciaPorIncumplimiento
authority judicial
enacted 2024-09-30

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Complainant: Complainant Person, natural person
    Accused: Accused Person, natural person
    MinorChild: MinorChild Person, natural person
    PublicProsecutor: PublicProsecutor Corp, legal person

objects
    MonthlyAlimony: money
    AccumulatedDebt: money
    BasicNecessities: service

article 1 Generated
    fact liability AlimonyObligation is present
    fact certification JudicialResolution is present
    fact asset RegularIncome is present
    fact liability AccumulatedDebt is present
    obligation Accused must pay MonthlyAlimony to MinorChild.
    prohibition Accused must not provide BasicNecessities.
    rule AlimonyObligationRule
        If certification JudicialResolution is present
        then Accused must pay MonthlyAlimony to MinorChild.

scenario systematic_non_compliance:
    at Judicial resolution establishing alimony obligation
    at Systematic failure to provide alimony for multiple years
    at Attempts to contact debtor through various means
    at Debtor changes address without notification
    at Accumulation of unpaid alimony debt
    at Filing criminal complaint for non-compliance