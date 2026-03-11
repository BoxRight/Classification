law ServiceContract
authority private
enacted 2023-04-21

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Contratante: Contratante Corp, legal person
    ServiceProvider: ServiceProvider Person, natural person

objects
    ProfessionalServices: service
    DebtCollectionServices: service
    MonthlyFees: money
    ConfidentialInformation: movable

article 1 Generated
    fact certification ProfessionalLicense is present
    obligation ServiceProvider must provide DebtCollectionServices to Contratante.
    obligation Contratante must pay MonthlyFees to ServiceProvider.
    prohibition ServiceProvider must not transfer ConfidentialInformation.
    rule ServiceProvisionRule
        If asset ServiceContract is present
        then ServiceProvider must provide DebtCollectionServices to Contratante.