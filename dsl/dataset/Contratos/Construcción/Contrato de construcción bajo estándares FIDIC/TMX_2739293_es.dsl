law ContratoConstrucciónBajo
authority private

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Contractor: Contractor Corp, legal person
    Client: Client Corp, legal person
    SupervisingEngineer: SupervisingEngineer Person, natural person

objects
    ConstructionWork: service
    ConstructionPlans: service
    TechnicalSpecifications: service
    Materials: movable
    Equipment: movable
    Payment: money
    PerformanceGuarantee: money
    RetentionAmount: money
    PenaltyAmount: money

article 1 Generated
    fact asset ContractualRelation is present
    fact certification WorkCompletion is present
    fact certification PaymentApproval is present
    obligation Contractor must provide ConstructionWork to Client.
    obligation Contractor must transfer Materials to ConstructionWork.
    obligation Contractor must pay PerformanceGuarantee to Client.
    obligation Client must pay Payment to Contractor.
    obligation SupervisingEngineer must provide ConstructionWork to Client.
    prohibition Contractor must not provide ConstructionWork.
    rule PaymentRule
        If certification PaymentApproval is present
        then Client must pay Payment to Contractor.
    rule RetentionRule
        If asset ContractualRelation is present
        then Client may demand RetentionAmount from Contractor.
    procedure ConstructionExecution:
        Contractor provides ConstructionWork to Client.
        SupervisingEngineer provides ConstructionWork to Client.
        Client pays Payment to Contractor.
    procedure PaymentProcess:
        SupervisingEngineer provides ConstructionWork to Client.
        Client pays Payment to Contractor.