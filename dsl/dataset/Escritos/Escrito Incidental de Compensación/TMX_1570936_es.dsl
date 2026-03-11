law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb pay: pay

parties
    Petitioner: Petitioner Person, natural person
    Counterpart: Counterpart Person, natural person
    CivilJudge: CivilJudge Corp, legal person

objects
    MutualDebt: money
    MutualCredit: money
    CompensationPayment: money

article 1 Generated
    fact liability MutualDebt is present
    fact asset MutualCredit is present
    claim Petitioner may demand CompensationPayment from Counterpart.
    obligation CivilJudge must pay CompensationPayment to Counterpart.
    rule CompensationRule
        If asset MutualCredit is present and liability MutualDebt is present
        then Petitioner may demand CompensationPayment from Counterpart.
    procedure CompensationIncidentProcedure:
        Petitioner pays CompensationPayment to CivilJudge.
        CivilJudge pays CompensationPayment to Counterpart.
        CivilJudge pays CompensationPayment to Petitioner.