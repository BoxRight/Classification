law ContratoObraPrecio
authority private
enacted 2024-02-02

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Contratante: Contratante Corp, legal person
    Contractor: Contractor Corp, legal person

objects
    Obra: service
    ContractAmount: money
    AdvancePayment: money
    PartialPayments: money
    Materials: movable
    Tools: movable
    Labor: service
    Property: nonmovable
    Permits: service
    GuarantyBond: service
    PenaltyAmount: money

article 1 Generated
    fact asset ConstructionContract is present
    fact Contratante owns Property
    fact certification TaxCompliance is present
    fact certification TaxCompliance is present
    fact certification LegalRepresentation is present
    fact certification LegalRepresentation is present
    obligation Contractor must provide Obra to Contratante.
    obligation Contratante must transfer Property to Contractor.
    obligation Contratante must provide Permits to Contractor.
    obligation Contractor must transfer Materials to Obra.
    obligation Contractor must provide Labor to Obra.
    obligation Contratante must pay AdvancePayment to Contractor.
    obligation Contratante must pay PartialPayments to Contractor.
    obligation Contratante must pay ContractAmount to Contractor.
    obligation Contractor must provide GuarantyBond to Contratante.
    privilege Contratante may provide Obra to Contractor.
    privilege Contractor may provide Obra to Contratante.
    rule ContractExecutionRule
        If asset ConstructionContract is present
        then Contractor must provide Obra to Contratante.
    procedure WorkExecution:
        Contratante transfers Property to Contractor.
        Contratante provides Permits to Contractor.
        Contratante pays AdvancePayment to Contractor.
        Contractor provides Obra to Contratante.
        Contratante pays PartialPayments to Contractor.
        Contratante pays ContractAmount to Contractor.
    procedure ContractTermination:
        Contratante provides Obra to Contractor.