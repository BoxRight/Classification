law ServiceContract
authority private
enacted 2023-04-13

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Client: Client Corp, legal person
    ServiceProvider: ServiceProvider Person, natural person

objects
    LiteraryWork: service
    ProfessionalServices: service
    MonthlyFees: money
    IntellectualPropertyRights: service
    ConfidentialInformation: service

article 1 Generated
    fact asset ServiceContract is present
    obligation ServiceProvider must provide ProfessionalServices to Client.
    obligation Client must pay MonthlyFees to ServiceProvider.
    obligation ServiceProvider must provide IntellectualPropertyRights to Client.
    prohibition ServiceProvider must not provide ConfidentialInformation.
    rule ServiceProvisionRule
        If asset ServiceContract is present
        then ServiceProvider must provide ProfessionalServices to Client.
    procedure ContractTerminationProcedure:
        Client provides ProfessionalServices to ServiceProvider.
    procedure BreachTerminationProcedure:
        Client provides ProfessionalServices to ServiceProvider.