law ServiceContract
authority private
enacted 2024-02-05

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Company: Company Corp, legal person
    Professional: Professional Person, natural person

objects
    ProfessionalServices: service
    ProfessionalFees: money
    DevelopedMaterials: service
    ConfidentialInformation: service
    NecessaryDocumentation: service
    TravelExpenses: money
    PenaltyFee: money

article 1 Generated
    fact certification ProfessionalQualifications is present
    fact certification TaxCompliance is present
    fact asset ServiceContractRelation is present
    obligation Professional must provide ProfessionalServices to Company.
    obligation Company must pay ProfessionalFees to Professional.
    obligation Professional must provide DevelopedMaterials to Company.
    prohibition Professional must not provide ConfidentialInformation.
    obligation Company must provide NecessaryDocumentation to Professional.
    obligation Company must pay TravelExpenses to Professional.
    rule ServiceProvisionRule
        If asset ServiceContractRelation is present
        then Professional must provide ProfessionalServices to Company.
    rule PaymentRule
        If asset ServiceContractRelation is present
        then Company must pay ProfessionalFees to Professional.
    rule RescissionRule
        If Professional fails to provide ProfessionalServices to Company
        then Company may perform ServiceContractRelation to Termination.
    rule ConfidentialityBreachRule
        If Professional fails to provide ConfidentialInformation to ThirdParties
        then Professional must pay PenaltyFee to Company.
    rule TravelExpensesRule
        If asset TravelRequirement is present
        then Company must pay TravelExpenses to Professional.