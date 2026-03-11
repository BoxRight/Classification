law InitialComplaint
authority judicial
enacted 2024-06-12

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Corp, legal person

objects
    TimeshareContract: service
    HostingServices: service
    FacilityUse: service
    InitialFee: money
    MonthlyPayments: money
    DamagesCompensation: money
    CostsAndExpenses: money

article 1 Generated
    fact asset TimeshareContractRelation is present
    fact liability ContractualBreach is present
    obligation Defendant must provide HostingServices to Plaintiff.
    obligation Defendant must provide FacilityUse to Plaintiff.
    prohibition Defendant must not provide TimeshareContract.
    rule ContractBreachTermination
        If asset TimeshareContractRelation is present and Defendant fails to provide TimeshareContract to Plaintiff
        then Plaintiff may demand TimeshareContract from Defendant.
    rule BreachCompensationRule
        If liability ContractualBreach is present
        then Defendant must pay DamagesCompensation to Plaintiff.
    rule RestitutionRule
        If liability ContractualBreach is present
        then Defendant must pay InitialFee to Plaintiff.
    procedure ContractTerminationLawsuit:
        Plaintiff provides TimeshareContract to Defendant.