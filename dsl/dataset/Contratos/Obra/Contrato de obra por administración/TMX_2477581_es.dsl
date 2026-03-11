law ContratoObraPor
authority private
enacted 2024-02-02

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Landlord: Landlord Corp, legal person
    Contractor: Contractor Corp, legal person

objects
    ConstructionWork: service
    PaymentPercentage: money
    BondAmount: money
    PenaltyAmount: money

article 1 Generated
    fact asset ContractRelation is present
    fact certification CamaraRegistration is present
    fact certification CamaraRegistration is present
    obligation Contractor must provide ConstructionWork to Landlord.
    obligation Landlord must pay PaymentPercentage to Contractor.
    obligation Contractor must pay BondAmount to Landlord.
    rule ContractExecutionRule
        If asset ContractRelation is present
        then Contractor must provide ConstructionWork to Landlord.
    rule BondRule
        If asset ContractRelation is present
        then Contractor must pay BondAmount to Landlord.
    rule InsuranceRule
        If asset ContractRelation is present
        then Contractor must provide ConstructionWork to Landlord.
    rule BreachTerminationRule
        If Contractor fails to provide ConstructionWork to Landlord
        then Landlord may provide ConstructionWork to Contractor.
    rule SuspensionRule
        If asset ContractRelation is present
        then Landlord may provide ConstructionWork to Contractor.
    procedure ConstructionProcess:
        Contractor provides ConstructionWork to Landlord.
        Contractor provides ConstructionWork to Landlord.
        Contractor provides ConstructionWork to Landlord.
        Contractor provides ConstructionWork to Landlord.
        Contractor provides ConstructionWork to Landlord.