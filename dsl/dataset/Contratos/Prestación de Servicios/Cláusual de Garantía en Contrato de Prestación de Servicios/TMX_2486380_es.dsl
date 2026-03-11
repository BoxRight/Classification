law ServiceContract
authority private
enacted 2024-01-17

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    ServiceProvider: ServiceProvider Corp, legal person
    Client: Client Corp, legal person

objects
    Products: movable
    TechnicalSupportServices: service
    TrainingServices: service
    TechnologicalInfrastructure: service
    ProductPrice: money

article 1 Generated
    fact asset ServiceContract is present
    obligation ServiceProvider must transfer Products to Client.
    obligation ServiceProvider must provide TechnicalSupportServices to Client.
    obligation ServiceProvider must provide TechnologicalInfrastructure to Client.
    obligation ServiceProvider must provide TrainingServices to Client.
    rule DefectRemedyRule
        If asset ServiceContract is present
        then ServiceProvider must transfer Products to Client.
    rule SupportObligationRule
        If asset ServiceContract is present
        then ServiceProvider must provide TechnicalSupportServices to Client.