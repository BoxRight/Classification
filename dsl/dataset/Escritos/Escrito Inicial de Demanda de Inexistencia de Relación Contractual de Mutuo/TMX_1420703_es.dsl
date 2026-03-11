law InitialComplaint
authority judicial
enacted 2024-03-05

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    PlaintiffExecutor: PlaintiffExecutor Person, natural person
    Deceased: Deceased Person, natural person
    Defendant: Defendant Person, natural person
    Notary: Notary Corp, legal person
    CivilJudge: CivilJudge Corp, legal person

objects
    LoanContract: service
    MortgageGuarantee: nonmovable
    LegalCosts: money

article 1 Generated
    fact certification ExecutorAppointment is present
    fact certification NotarialInstrument is present
    fact liability MortgageDebt is present
    claim PlaintiffExecutor may demand ContractInexistenceDeclaration from CivilJudge.
    claim PlaintiffExecutor may demand LegalCosts from Defendant.
    procedure InexistenceLawsuitProcedure:
        PlaintiffExecutor performs InitialComplaint to CivilJudge.

scenario contract_inexistence_timeline:
    at deceased_death
    at contract_execution_attempt
    at lawsuit_filing