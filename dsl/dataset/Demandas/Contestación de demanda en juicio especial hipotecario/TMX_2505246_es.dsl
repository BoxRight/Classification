law ContestaciónDemandaJuicio
authority judicial
enacted 2024-01-23

vocabulary
    verb pay: pay

parties
    Defendant: Defendant Person, natural person
    Plaintiff: Plaintiff Corp, legal person
    Judge: Judge Corp, legal person

objects
    MortgageCredit: money
    MortgageProperty: nonmovable
    AdministrationCommission: money
    OrdinaryInterests: money
    MoratoryInterests: money
    LegalCosts: money
    MortgageContract: service

article 1 Generated
    fact certification MortgageContract is present
    fact liability CreditObligation is present
    fact asset MortgageGuarantee is present
    prohibition Plaintiff must not pay MortgageCredit.
    prohibition Plaintiff must not pay AdministrationCommission.
    prohibition Plaintiff must not pay OrdinaryInterests.
    prohibition Plaintiff must not pay MoratoryInterests.
    prohibition Plaintiff must not pay LegalCosts.
    rule ProceduralImproprietyRule
        If certification LackOfStanding is present
        then Plaintiff must not pay MortgageCredit.