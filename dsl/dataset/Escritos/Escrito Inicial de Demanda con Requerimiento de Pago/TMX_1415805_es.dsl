law InitialComplaint
authority judicial
enacted 2024-12-02

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    Judge: Judge Corp, legal person
    CourtClerk: CourtClerk Corp, legal person

objects
    LoanAmount: money
    MonthlyInterests: money
    CourtCosts: money
    PublicDeed: service
    DefendantAssets: movable

article 1 Generated
    fact liability LoanDebt is present
    fact asset LoanClaim is present
    fact certification PublicDeed is present
    obligation Defendant must pay LoanAmount to Plaintiff.
    obligation Defendant must pay MonthlyInterests to Plaintiff.
    rule PaymentRequirementRule
        If liability LoanDebt is present and certification PublicDeed is present
        then Defendant must pay LoanAmount to Plaintiff.
    rule AssetSeizureRule
        If Defendant fails to pay LoanAmount to Plaintiff
        then CourtClerk may transfer DefendantAssets to Plaintiff.