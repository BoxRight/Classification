law ServiceContract
authority private
enacted 2023-04-28

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Company: Company Corp, legal person
    Professional: Professional Person, natural person

objects
    ProfessionalServices: service
    ProfessionalFees: money
    MaterialsDeveloped: service
    ConfidentialInformation: service
    Documentation: service
    TravelExpenses: money

article 1 Generated
    fact asset ServiceContract is present
    fact certification TaxCompliance is present
    fact certification LaborRegistration is present
    obligation Professional must provide ProfessionalServices to Company.
    obligation Company must pay ProfessionalFees to Professional.
    obligation Professional must provide ConfidentialInformation to Company.
    obligation Company must provide Documentation to Professional.
    obligation Company must pay TravelExpenses to Professional.
    procedure ContractExecution:
        Company provides Documentation to Professional.
        Professional provides ProfessionalServices to Company.
        Company pays ProfessionalFees to Professional.