law ServiceContract
authority private
enacted 2023-04-21

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Association: Association Corp, legal person
    Professional: Professional Person, natural person

objects
    ProfessionalServices: service
    ProfessionalFees: money
    DevelopedMaterials: movable
    ConfidentialInformation: movable
    NecessaryDocumentation: movable
    TravelExpenses: money
    PenaltyPayment: money

article 1 Generated
    fact asset ServiceContractRelation is present
    obligation Professional must provide ProfessionalServices to Association.
    obligation Association must pay ProfessionalFees to Professional.
    obligation Association must transfer NecessaryDocumentation to Professional.
    prohibition Professional must not transfer ConfidentialInformation.
    rule ContractTerminationRule
        If Professional fails to provide ProfessionalServices to Association
        then Association may perform ContractTermination to Professional.
    rule ConfidentialityBreachPenaltyRule
        If Professional fails to perform ConfidentialityObligation to Association
        then Professional must pay PenaltyPayment to Association.
    rule TravelExpensesRule
        If asset TravelRequirement is present
        then Association must pay TravelExpenses to Professional.
    procedure ContractExecutionProcedure:
        Association transfers NecessaryDocumentation to Professional.
        Professional provides ProfessionalServices to Association.
        Association pays ProfessionalFees to Professional.