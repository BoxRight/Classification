law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb pay: pay

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    Judge: Judge Person, natural person

objects
    PrincipalSum: money
    OrdinaryInterest: money
    DefaultInterest: money
    CourtCosts: money

article 1 Generated
    fact certification DefinitiveJudgment is present
    fact liability DebtObligation is present
    fact asset CreditGranted is present
    obligation Defendant must pay PrincipalSum to Plaintiff.
    obligation Defendant must pay OrdinaryInterest to Plaintiff.
    obligation Defendant must pay DefaultInterest to Plaintiff.
    obligation Defendant must pay CourtCosts to Plaintiff.
    rule JudgmentExecutionRule
        If certification DefinitiveJudgment is present
        then Defendant must pay PrincipalSum to Plaintiff.
    rule OrdinaryInterestCalculationRule
        If liability DebtObligation is present
        then Defendant must pay OrdinaryInterest to Plaintiff.
    rule DefaultInterestCalculationRule
        If liability DebtObligation is present
        then Defendant must pay DefaultInterest to Plaintiff.
    procedure JudgmentLiquidationProcedure:
        Judge pays CourtCosts to Defendant.