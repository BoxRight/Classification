law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    Judge: Judge Person, natural person
    Attorney: Attorney Person, natural person

objects
    LegalCosts: money
    LegalExpenses: money
    AttorneyFees: money
    CostBreakdownSchedule: service

article 1 Generated
    fact certification EvictionJudgmentFavorableToPlaintiff is present
    fact liability DefendantOrderedToPayCosts is present
    fact asset RightToCostRecovery is present
    claim Plaintiff may demand LegalCosts from Defendant.
    claim Plaintiff may demand LegalExpenses from Defendant.
    obligation Judge must provide CostBreakdownSchedule to Defendant.
    rule CostRecoveryRule
        If certification EvictionJudgmentFavorableToPlaintiff is present
        then Plaintiff may demand LegalCosts from Defendant.