law DemandaIncidentalEjecución
authority judicial
enacted 2024-05-15

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    CivilJudge: CivilJudge Corp, legal person
    BankingInstitution: BankingInstitution Corp, legal person

objects
    MonetaryJudgment: money
    BankAccount: movable
    BankAccountInformation: service

article 1 Generated
    fact certification DefinitiveSentence is present
    fact liability MonetaryDebt is present
    fact asset BankAccountOwnership is present
    obligation Defendant must pay MonetaryJudgment to Plaintiff.
    rule EmbargoExecutionRule
        If certification DefinitiveSentence is present and Defendant fails to pay MonetaryJudgment to Plaintiff
        then CivilJudge must transfer BankAccount to Defendant.
    procedure BankAccountEmbargoProcedure:
        CivilJudge provides BankAccountInformation to BankingInstitution.
        CivilJudge transfers BankAccount to Defendant.